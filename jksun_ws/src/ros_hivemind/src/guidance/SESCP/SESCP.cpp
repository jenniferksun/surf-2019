#include "SESCP.hpp"
#include <environments.hpp>
using namespace std;
using namespace Eigen;
class Tree {
public:
    vector<Node> nodes;
    vector<Edge> edges;
    float minCost;
    vector<int> minTreeSet;
    int nEdges;
    int nNodes;
    void addNode(Node newNode) {
        nodes.push_back(newNode);
        nNodes++;
    }
    void addEdge(Edge newEdge) {
        edges.push_back(newEdge);
        nEdges++;
    }
    Tree(int num_samples) {
        this->nodes.reserve(num_samples);
        this->edges.reserve(num_samples*num_samples);
        this->minTreeSet.reserve(5);
        this->minCost = INFINITY;
        this->nNodes = 0;
        this->nEdges = 0;
    }
    //Find shortest path from start node (0) to end node (1)
    bool dijkstra() {
        // Initializations ------------------
        vector<int> prev;
        prev.reserve(nNodes);
        vector<float> edgeCosts;
        edgeCosts.reserve(nNodes);
        minTreeSet.clear();
        float alt;
        int startNode = 0;
        int endNode = 1;
        vector<int> Q;
        Q.push_back(startNode);

        for (int i=0; i<nNodes; i++) {
            nodes[i].dist = INFINITY;
        }
        nodes[startNode].dist = 0;
        //------------------------------------

        while (!Q.empty()) {
            // Find neighbors
            for (int i=0;i<nEdges;i++) {
                if (edges[i].first == Q.back()) {
                    // Find dist thru Tree and Q.back()
                    alt = edges[i].weight + nodes[Q.back()].dist;

                    if (nodes[edges[i].second].dist > alt) {
                        // Compare to dist thru tree w/o Q.back. If less, change dist, prev, and edgeCosts
                        nodes[edges[i].second].dist = alt;
                        prev[edges[i].second] = Q.back();
                        edgeCosts[edges[i].second] = alt;

                        if (find(Q.begin(),Q.end(),edges[i].second) == Q.end()) {
                            // If second is not in Q, add it
                            Q.insert(Q.begin(),edges[i].second);
                        }
                    }
                }
            }
            Q.pop_back();
            if (Q.back() == endNode) {
                // cout << "Found the end!" << endl;
                break;
            }

        }
        if (Q.empty()) { // Never reached stopping condition, incomplete path
            return false;
        }
        else {
            minTreeSet.push_back(Q.back()); // Add end Node to path
            minCost = 0;
            int next= 100; // initialize to anything not Start Node
            while (next != startNode) {
                // cout << "Node : " << minTreeSet.front() << " Cost : " << edgeCosts[minTreeSet.front()]<< endl;
                next = prev[minTreeSet.front()];
                minCost += edgeCosts[minTreeSet.front()];
                minTreeSet.insert(minTreeSet.begin(),next); // add to the front of path
            }
            // cout << "Node : " << minTreeSet.front() << " Cost : " << 0 << endl;
        }

        return true;
    }
};


void load_obstacles(void);
float MinDisObstacle(Vector3f);
Vector3f Generate_Sample() ;
Vector3f Nearest_pt_on_sphere (Tree , Vector3f );
void Vertices_near_xnew(Tree , Vector3f , float, vector<int>*);
float SCP(Tree, float, Vector3f, Vector3f, geometry_msgs::PoseArray&);
float OptimizeSCP(vector<Node>&, float, Vector3f, Vector3f, geometry_msgs::PoseArray&);
float SCP_Single_Int(int, Tree, float, Vector3f, Vector3f, geometry_msgs::PoseArray&, vector<int>&, vector<int>&, float);
float OptimizeSCP_Single_Int(vector<Node>&, int, float, Vector3f, Vector3f,geometry_msgs::PoseArray&, vector<int>&, vector<int>&);
float SCP_Double_Int(int, Tree, float, Vector3f, Vector3f, geometry_msgs::PoseArray&, vector<int>&, vector<int>&, float);
float OptimizeSCP_Double_Int(vector<Node>&, int, float, Vector3f, Vector3f,geometry_msgs::PoseArray&, vector<int>&, vector<int>&);
// MatrixXf diff_flat_traj(Vector3f, Vector3f, geometry_msgs::PoseArray&);
// MatrixXf diff_flat_traj_noscp(Vector3f, Vector3f, Tree);//, MatrixXf&);
// void func_Yaw_Velocity_at_k(int, float, VectorXf&);
// void func_Yaw_Position_at_k(int, float, VectorXf&);
// void func_Snap_at_k(int, float, MatrixXf&);
// void func_Jerk_at_k(int, float, MatrixXf&);
// void func_Accleration_at_k(int, float, MatrixXf&);
// void func_Velocity_at_k(int, float, MatrixXf&);
// void func_Position_at_k(int, float, MatrixXf&);

float delta_t;
// Generate the Tree (Main Loop)

int calculate_trajectory(vector<Vector3f> &trajectory){
    ros::NodeHandle nh;
    static const int maxSends = 5;
    ros::Publisher pub = nh.advertise<geometry_msgs::PoseArray>("SESCP_trajectory_pub", maxSends+1);

    ros::Time::init();
    ROS_INFO("Re Add a wait so Gazebo/CVX can catch up, remove for final version");
    ros::Duration(10.0).sleep();

    // Initializing Variables -------------
    int total_num_samples = 50;
    ofstream trajFile;
    srand(time(0));

    int t_start = clock();
    int num_sample = 0;
    float best_dist = INFINITY;
    vector<int> best_path;

    geometry_msgs::PoseArray optimal_sigma;
    float best_traj_cost = INFINITY;
    float last_path_tried_cost = INFINITY;

    int edge_start;
    int edge_end;
    float edge_weight;
    Vector3f x_rand;
    Vector3f x_new;
    float r_new;
    vector<int> near_idx_array;

    Tree T(total_num_samples);
    float cost_n_to_new, cost_new_to_n;
    Node n_new;
    vector<int> this_path;
    float this_dist;
    this_path.reserve(total_num_samples);
    float this_optimal_cost;
    geometry_msgs::PoseArray this_optimal_sigma;

    int num_steps;
    int optimal_sigma_num_steps;

    // To change environment, change this flag to the corresponding number in header or here
    // 1: room, 2: room_v2, [3:all_shapes], 4: ROS_House, 5: ROS_Kitchen, 6:Asteroid Field
    load_environment(envFlag);
    cout << fName << endl;
    if (fileFlag) {
        load_obstacles();
    }


    //===============================================================================

    x_0.minObs = MinDisObstacle(x_0.pos);
    x_f.minObs = MinDisObstacle(x_f.pos);
    T.addNode(x_0);
    T.addNode(x_f);

    while (num_sample <= total_num_samples) {
        num_sample++;
        cout<<"Num sample = "<<num_sample<<endl;

        x_rand = Generate_Sample();

        x_new = Nearest_pt_on_sphere(T, x_rand);
        n_new.pos = x_new;
        n_new.minObs = MinDisObstacle(n_new.pos);
        Vertices_near_xnew(T, n_new.pos, n_new.minObs, &near_idx_array);
        T.addNode(n_new);
        for (int near_idx = 0; near_idx<near_idx_array.size(); near_idx++) {
            // Simplified Solution to Problem (SCP_Trajectory_Simple)
            float sigma_n_to_new = 1;
            float sigma_new_to_n = 1;
            Vector3f x_idx;
            x_idx = T.nodes[near_idx_array[near_idx]].pos;
            cost_n_to_new = (x_new - x_idx).norm();
            cost_new_to_n = cost_n_to_new;
            Edge newEdge;
            newEdge.first = near_idx_array[near_idx];
            newEdge.second = T.nNodes-1;
            newEdge.weight = cost_n_to_new;
            T.addEdge(newEdge);
            newEdge.first = T.nNodes-1;
            newEdge.second = near_idx_array[near_idx];
            newEdge.weight = cost_new_to_n;
            T.addEdge(newEdge);
        }

        // THE GRAPH BUILDING AND TRAVERSAL ARE HERE --------------------------------------------
        bool successFlag;
        successFlag = T.dijkstra();

        if ((T.minCost < best_dist) && (last_path_tried_cost != T.minCost) ){
            if (type_of_dynamics == 1){ // Distance Minimization: x[k+1]=x[k]+u[k]
                this_path = T.minTreeSet;
                this_dist = T.minCost;

                // Simple SCP Trajectory
                float U_max = 100;
                this_optimal_cost = SCP(T, U_max, x_0.pos, x_f.pos, this_optimal_sigma);
                // Optimize SCP trajectory
                int num_this_path = T.minTreeSet.size();
                num_steps = 2*num_this_path-1;

                // Write this_old_optimal_sigma
                vector<Node> this_old_optimal_sigma;
                this_old_optimal_sigma.reserve(num_steps);
                Node this_path_node;

                for (int i=0; i<num_this_path; i++){
                    if (i == num_this_path){
                        this_path_node = T.nodes[T.minTreeSet[i]];
                        this_old_optimal_sigma.push_back(this_path_node);
                    }
                    else{
                        this_path_node = T.nodes[T.minTreeSet[i]];
                        this_old_optimal_sigma.push_back(this_path_node);
                        this_old_optimal_sigma.push_back(this_path_node);
                    }
                }

                vector<Node> new_optimal_sigma;
                for (int ni = 0; ni<num_optimize_loops; ni++){
                    Vector3f x_idxnew;
                    float r_idx;
                    Vector3f x_idx_old;
                    float r_idx_old;

                    num_steps = this_optimal_sigma.poses.size();
                    new_optimal_sigma.clear();
                    new_optimal_sigma.reserve(num_steps);
                    Node temp_new_node;

                    for (int i=0; i < num_steps; i++){
                        if (i == 0){
                            temp_new_node.pos[0] = this_optimal_sigma.poses[i].position.x;
                            temp_new_node.pos[1] = this_optimal_sigma.poses[i].position.y;
                            temp_new_node.pos[2] = this_optimal_sigma.poses[i].position.z;
                            temp_new_node.minObs = this_old_optimal_sigma[i].minObs;
                            new_optimal_sigma.push_back(temp_new_node);
                        }
                        else if (i == num_steps-1){
                            temp_new_node = this_old_optimal_sigma.back();
                            new_optimal_sigma.push_back(temp_new_node);
                        }
                        else{
                            temp_new_node.pos[0] = this_optimal_sigma.poses[i].position.x;
                            temp_new_node.pos[1] = this_optimal_sigma.poses[i].position.y;
                            temp_new_node.pos[2] = this_optimal_sigma.poses[i].position.z;
                            x_idxnew = temp_new_node.pos;
                            r_idx = MinDisObstacle(x_idxnew);

                            x_idx_old = new_optimal_sigma.back().pos;
                            r_idx_old = new_optimal_sigma.back().minObs;

                            if ((x_idxnew - x_idx_old).norm() <= r_idx + r_idx_old){
                                temp_new_node.pos = x_idxnew;
                                temp_new_node.minObs = r_idx;
                                new_optimal_sigma.push_back(temp_new_node);
                            }
                            else{
                                x_idx_old = this_old_optimal_sigma[i].pos;
                                r_idx_old = this_old_optimal_sigma[i].minObs;

                                temp_new_node.pos = x_idx_old;
                                temp_new_node.minObs = r_idx_old;
                                new_optimal_sigma.push_back(temp_new_node);

                                temp_new_node.pos = x_idxnew;
                                temp_new_node.minObs = r_idx;
                                new_optimal_sigma.push_back(temp_new_node);
                            }
                        }
                    }

                    this_optimal_sigma.poses.clear();
                    this_optimal_cost = OptimizeSCP(new_optimal_sigma, U_max, x_0.pos, x_f.pos, this_optimal_sigma);

                    num_this_path = new_optimal_sigma.size();
                    num_steps = 2*num_this_path-1;
                    this_old_optimal_sigma.clear();
                    this_old_optimal_sigma.reserve(num_steps);
                    Node this_path_node;
                    for (int i=0; i<num_this_path; i++){

                        if (i == (num_this_path-1)){
                            this_path_node = new_optimal_sigma[i];
                            this_old_optimal_sigma.push_back(this_path_node);
                        }
                        else{
                            this_path_node = new_optimal_sigma[i];
                            this_old_optimal_sigma.push_back(this_path_node);
                            this_old_optimal_sigma.push_back(this_path_node);
                        }
                    }
                }
            }

            else if (type_of_dynamics == 2){ // Single Integrator: \dot{x} = u
                cout << "Single Integrator Dynamics" << endl;
                this_path = T.minTreeSet;
                this_dist = T.minCost;
                // Simple SCP Trajectory
                float U_max = 100;

                // cout << "This Path " << endl;
                // for (int i=0;i<T.minTreeSet.size(); i++){
                //     cout << T.nodes[T.minTreeSet[i]].pos[0] << "," << T.nodes[T.minTreeSet[i]].pos[1] << "," << T.nodes[T.minTreeSet[i]].pos[2] << "," <<T.nodes[T.minTreeSet[i]].minObs << endl;
                // }
                // cout << "---------------------" << endl;

                // TODO: Make Total_time and delta_t user input
                float total_time = 10; // [sec]
                delta_t = 0.1; // [sec]
                num_steps = floor((total_time/delta_t)+1);

                // Optimize SCP trajectory
                int num_this_path = T.minTreeSet.size();

                // Write this_old_optimal_sigma
                vector<Node> this_old_optimal_sigma;
                this_old_optimal_sigma.reserve(2*num_this_path-1);
                Node this_path_node;

                for (int i=0; i<num_this_path; i++){
                    this_path_node = T.nodes[T.minTreeSet[i]];
                    if (i == num_this_path){
                        this_old_optimal_sigma.push_back(this_path_node);
                    }
                    else{
                        this_old_optimal_sigma.push_back(this_path_node);
                        this_old_optimal_sigma.push_back(this_path_node);
                    }
                }
                // Find Full Trajectory connecting sphere intersections
                //int num_this_path = this_path.size();
                Node traj_node;
                vector<Node> full_trajectory;
                Node traj_node2;
                Node traj_node3;
                full_trajectory.reserve(num_this_path+1);

                for (int i=0; i <= num_this_path; i++){

                    if (i == 0){
                        traj_node = T.nodes[T.minTreeSet[i]];
                        full_trajectory.push_back(traj_node);
                    }
                    else if (i == num_this_path){
                        full_trajectory.push_back(T.nodes[T.minTreeSet.back()]);
                    }
                    else {
                        traj_node = T.nodes[T.minTreeSet[i]];
                        traj_node2 = T.nodes[T.minTreeSet[i-1]];
                        traj_node3.pos = (traj_node2.pos + (traj_node2.minObs / (traj_node2.minObs + traj_node.minObs)) * (traj_node.pos - traj_node2.pos));
                        full_trajectory.push_back(traj_node3);
                    }
                }

                // cout << "full_trajectory " << endl;
                // for (int i=0; i< full_trajectory.size(); i++){
                //     cout << full_trajectory[i].pos[0] <<", " << full_trajectory[i].pos[1] <<", " << full_trajectory[i].pos[2] <<", " << full_trajectory[i].minObs << endl;
                // }
                // Divide up the time between waypoints by distance
                vector<float> time_fraction_full_trajectory;
                vector<float> cdf_time_fraction_full_trajectory;
                time_fraction_full_trajectory.reserve(num_this_path);

                for (int i=0; i<num_this_path; i++){
                    time_fraction_full_trajectory.push_back((full_trajectory[i+1].pos- full_trajectory[i].pos).norm());
                }

                float sum = accumulate(time_fraction_full_trajectory.begin(), time_fraction_full_trajectory.end(),0.0);

                for (int i=0; i< time_fraction_full_trajectory.size(); i++){
                    time_fraction_full_trajectory[i] = total_time * time_fraction_full_trajectory[i] / sum;
                }

                cdf_time_fraction_full_trajectory.push_back(time_fraction_full_trajectory[0]);
                for(int i =1; i< time_fraction_full_trajectory.size(); i++){
                    cdf_time_fraction_full_trajectory.push_back(cdf_time_fraction_full_trajectory[i-1] + time_fraction_full_trajectory[i]);
                }
                // cout << "TFF " << endl;
                // for (int i=0; i< time_fraction_full_trajectory.size(); i++){
                //     cout << time_fraction_full_trajectory[i] << endl;
                // }
                // cout << "CDF " << endl;
                // for (int i=0; i< cdf_time_fraction_full_trajectory.size(); i++){
                //     cout << cdf_time_fraction_full_trajectory[i] << endl;
                // }

                // Which sphere is it in at each time?
                vector<int> which_radius_array;
                which_radius_array.reserve(num_steps);
                vector<int> intersection_array;
                intersection_array.reserve(num_this_path-1);
                float t;
                int sphere_count = 0;
                for (int i=0; i < num_steps; i++){
                    t = float(i*delta_t);
                    if ((t - cdf_time_fraction_full_trajectory[sphere_count]) < delta_t/2) {
                        which_radius_array.push_back(sphere_count);
                    }
                    else{
                        sphere_count++;
                        which_radius_array.push_back(sphere_count);
                        intersection_array.push_back(i);
                    }

                }

                // cout << "Intersection Array: NTF " << num_this_path<< endl;
                // for (int i=0;i<intersection_array.size(); i++){
                //     cout << intersection_array[i] << endl;
                // }
                // cout << "---------------------" << endl;

                // cout << "Which Radius Array " << endl;
                // for (int i=0;i<which_radius_array.size(); i++){
                //     cout << which_radius_array[i] << endl;
                // }
                // cout << "---------------------" << endl;
                this_optimal_cost = SCP_Single_Int(num_steps, T, U_max, x_0.pos, x_f.pos, this_optimal_sigma, which_radius_array, this_path, delta_t);

                // cout << "TOS " << endl;
                // for (int i=0;i<this_optimal_sigma.poses.size(); i++){
                //     cout << this_optimal_sigma.poses[i].position.x << "," << this_optimal_sigma.poses[i].position.y << "," << this_optimal_sigma.poses[i].position.z << endl;
                // }
                // cout << "---------------------" << endl;
                // Write this_optimal_sigma_modified
                vector<Node> this_optimal_sigma_modified;
                Node modify1;
                Node modify2;
                Node modify3;

                // Generate New Path
                vector<Node> new_optimal_sigma;
                Node temp_new_node;
                // cout << "This optimal sigma modified size " << this_optimal_sigma_modified.size() << endl;
                for (int ni = 0; ni<num_optimize_loops; ni++){
                    delta_t = delta_t/2;
                    num_steps = floor((total_time/delta_t)+1);

                    cout << "SCP ITERATION NUMBER " << ni+1 << " of " << num_optimize_loops << endl;

                    if (ni>0){
                        this_old_optimal_sigma.clear();
                        this_old_optimal_sigma.reserve(2*num_this_path-1);
                        for (int i=0; i<num_this_path; i++){
                            this_path_node = new_optimal_sigma[i];
                            if (i == num_this_path){
                                this_old_optimal_sigma.push_back(this_path_node);
                            }
                            else{
                                this_old_optimal_sigma.push_back(this_path_node);
                                this_old_optimal_sigma.push_back(this_path_node);
                            }
                        }
                    }

                    // Write this_optimal_sigma_modified
                    this_optimal_sigma_modified.clear();
                    this_optimal_sigma_modified.reserve(2*num_this_path-1);
                    for (int i=0; i<num_this_path-1; i++){
                        if (i==0){
                            modify1.pos[0] = this_optimal_sigma.poses[i].position.x;
                            modify1.pos[1] = this_optimal_sigma.poses[i].position.y;
                            modify1.pos[2] = this_optimal_sigma.poses[i].position.z;
                            this_optimal_sigma_modified.push_back(modify1);
                            int idx = intersection_array[i];
                            modify2.pos[0] = this_optimal_sigma.poses[idx].position.x;
                            modify2.pos[1] = this_optimal_sigma.poses[idx].position.y;
                            modify2.pos[2] = this_optimal_sigma.poses[idx].position.z;
                            this_optimal_sigma_modified.push_back(modify2);
                            int next_idx = ceil(((float) intersection_array[i+1]+ (float) intersection_array[i])/2);

                            modify3.pos[0] = this_optimal_sigma.poses[next_idx].position.x;
                            modify3.pos[1] = this_optimal_sigma.poses[next_idx].position.y;
                            modify3.pos[2] = this_optimal_sigma.poses[next_idx].position.z;
                            this_optimal_sigma_modified.push_back(modify3);
                        }
                        else if (i == num_this_path-2){
                            int idx = intersection_array[i];
                            modify1.pos[0] = this_optimal_sigma.poses[idx].position.x;
                            modify1.pos[1] = this_optimal_sigma.poses[idx].position.y;
                            modify1.pos[2] = this_optimal_sigma.poses[idx].position.z;
                            this_optimal_sigma_modified.push_back(modify1);
                            if (idx != this_optimal_sigma.poses.size()-1) {
                                modify2.pos[0] = this_optimal_sigma.poses.back().position.x;
                                modify2.pos[1] = this_optimal_sigma.poses.back().position.y;
                                modify2.pos[2] = this_optimal_sigma.poses.back().position.z;
                                this_optimal_sigma_modified.push_back(modify2);
                            }
                        }
                        else{
                            int idx = intersection_array[i];
                            modify1.pos[0] = this_optimal_sigma.poses[idx].position.x;
                            modify1.pos[1] = this_optimal_sigma.poses[idx].position.y;
                            modify1.pos[2] = this_optimal_sigma.poses[idx].position.z;
                            this_optimal_sigma_modified.push_back(modify1);
                            int next_idx = ceil(((float) intersection_array[i+1]+ (float) intersection_array[i])/2);

                            modify2.pos[0] = this_optimal_sigma.poses[next_idx].position.x;
                            modify2.pos[1] = this_optimal_sigma.poses[next_idx].position.y;
                            modify2.pos[2] = this_optimal_sigma.poses[next_idx].position.z;
                            this_optimal_sigma_modified.push_back(modify2);
                        }

                    }
                    // cout << "TOSM " << endl;
                    // for (int i=0; i< this_optimal_sigma_modified.size(); i++){
                    //     cout << this_optimal_sigma_modified[i].pos[0] <<", " << this_optimal_sigma_modified[i].pos[1] <<", " << this_optimal_sigma_modified[i].pos[2] << endl;
                    // }
                    // cout << "---------------------------------" << endl;
                    Vector3f x_idx, x_idx_old, x_idx_new;
                    float r_idx, r_idx_old, r_idx_new;
                    new_optimal_sigma.clear();
                    //new_optimal_sigma.reserve(num_steps);
                    Node temp_new_node;
                    for (int i=0; i < this_optimal_sigma_modified.size(); i++){
                        if (i == 0){
                            temp_new_node.pos = this_optimal_sigma_modified[i].pos;
                            temp_new_node.minObs = this_old_optimal_sigma[i].minObs;
                            new_optimal_sigma.push_back(temp_new_node);
                        }
                        else if (i == this_optimal_sigma_modified.size()-1){
                            temp_new_node.pos = this_optimal_sigma_modified.back().pos;
                            temp_new_node.minObs = this_old_optimal_sigma.back().minObs;
                            new_optimal_sigma.push_back(temp_new_node);
                        }
                        else{
                            x_idx_new = this_optimal_sigma_modified[i].pos;
                            r_idx_new = MinDisObstacle(x_idx_new);

                            x_idx_old = new_optimal_sigma.back().pos;
                            r_idx_old = new_optimal_sigma.back().minObs;
                            if ((x_idx_new - x_idx_old).norm() <= r_idx_new + r_idx_old){
                                temp_new_node.pos = x_idx_new;
                                temp_new_node.minObs = r_idx_new;
                                new_optimal_sigma.push_back(temp_new_node);
                            }
                            else{
                                // cout << "TOO FAR " << endl;
                                x_idx = this_old_optimal_sigma[i].pos;
                                r_idx = this_old_optimal_sigma[i].minObs;

                                temp_new_node.pos = x_idx;
                                temp_new_node.minObs = r_idx;
                                new_optimal_sigma.push_back(temp_new_node);

                                temp_new_node.pos = x_idx_new;
                                temp_new_node.minObs = r_idx_new;
                                new_optimal_sigma.push_back(temp_new_node);
                                // cout << "Norm1 " << (x_idx_old - x_idx).norm() << " Rads " << r_idx+r_idx_old << endl;
                                // cout << "Norm " << (x_idx - x_idx_new).norm() << " Rads " << r_idx_new+r_idx << endl;
                            }
                        }
                    }
                    // cout << "NOS" << endl;
                    // for (int i=0; i< new_optimal_sigma.size(); i++){
                    //     cout << new_optimal_sigma[i].pos[0] <<", " << new_optimal_sigma[i].pos[1] <<", " << new_optimal_sigma[i].pos[2] <<", " << new_optimal_sigma[i].minObs << endl;
                    // }
                    // Identify NOS pairs that are causing trouble

                    num_this_path = new_optimal_sigma.size();

                    float NOS_norm, NOS_radius;
                    bool badSphere= false;
                    for (int i=0; i<new_optimal_sigma.size()-1; i++){
                        NOS_norm = (new_optimal_sigma[i].pos - new_optimal_sigma[i+1].pos).norm();
                        NOS_radius = new_optimal_sigma[i].minObs + new_optimal_sigma[i+1].minObs;
                        if (NOS_norm>NOS_radius) {
                            cout << "Bad: " << NOS_norm << " , " << NOS_radius << " for nodes ";
                            cout << new_optimal_sigma[i].pos[0] << " ," << new_optimal_sigma[i].pos[1] << " ," << new_optimal_sigma[i].pos[2] << " ; ";
                            cout << new_optimal_sigma[i+1].pos[0] << " ," << new_optimal_sigma[i+1].pos[1] << " ," << new_optimal_sigma[i+1].pos[2] << endl;
                            badSphere = true;
                        }
                    }
                    cout << "------------------------------------------" << endl;
                    if (badSphere){
                        cout << endl << "Spheres don't intersect, optimization will fail, exiting" << endl;
                        return -1;
                    }

                    // Divide up the time between waypoints by distance
                    num_this_path = new_optimal_sigma.size();
                    full_trajectory.clear();
                    full_trajectory.reserve(num_this_path+1);

                    for (int i=0; i <= num_this_path; i++){

                        if (i == 0){
                            traj_node = new_optimal_sigma[i];
                            full_trajectory.push_back(traj_node);
                        }
                        else if (i == num_this_path){
                            traj_node = new_optimal_sigma[i-1];
                            full_trajectory.push_back(traj_node);
                        }
                        else {
                            traj_node = new_optimal_sigma[i];
                            traj_node2 = new_optimal_sigma[i-1];
                            traj_node3.pos = (traj_node2.pos + (traj_node2.minObs / (traj_node2.minObs + traj_node.minObs)) * (traj_node.pos - traj_node2.pos));
                            full_trajectory.push_back(traj_node3);
                        }
                    }
                    // cout << "Full Traj " << endl;
                    // for (int i=0;i<full_trajectory.size(); i++){
                    //     cout << full_trajectory[i].pos[0] << "," << full_trajectory[i].pos[1] << "," << full_trajectory[i].pos[2] << endl;
                    // }
                    // cout << "---------------------" << endl;
                    time_fraction_full_trajectory.clear();
                    cdf_time_fraction_full_trajectory.clear();
                    cdf_time_fraction_full_trajectory.reserve(num_this_path);
                    time_fraction_full_trajectory.reserve(num_this_path);
                    sum = 0.0;
                    for (int i=0; i<num_this_path; i++){
                        float dist = (full_trajectory[i+1].pos- full_trajectory[i].pos).norm();
                        time_fraction_full_trajectory.push_back(dist);
                        sum += dist;
                    }

                    for (int i=0; i< time_fraction_full_trajectory.size(); i++){
                        time_fraction_full_trajectory[i] = total_time * time_fraction_full_trajectory[i] / sum;
                    }

                    cdf_time_fraction_full_trajectory.push_back(time_fraction_full_trajectory[0]);
                    for(int i =1; i< time_fraction_full_trajectory.size(); i++){
                        cdf_time_fraction_full_trajectory.push_back(cdf_time_fraction_full_trajectory[i-1] + time_fraction_full_trajectory[i]);
                    }

                    // cout << "TFF " << endl;
                    // for (int i=0;i<time_fraction_full_trajectory.size(); i++){
                    //     cout << time_fraction_full_trajectory[i] << endl;
                    // }
                    // cout << "---------------------" << endl;
                    // cout << "CDF " << endl;
                    // for (int i=0;i<cdf_time_fraction_full_trajectory.size(); i++){
                    //     cout << cdf_time_fraction_full_trajectory[i] << endl;
                    // }
                    // cout << "---------------------" << endl;
                    // Which sphere is it in at each time?
                    which_radius_array.clear();
                    which_radius_array.reserve(num_steps);
                    intersection_array.clear();
                    // intersection_array.push_back(1);
                    float t;
                    int sphere_count = 0;
                    for (int i=0; i < num_steps; i++){
                        t = float(i)*delta_t;
                        if ((t - cdf_time_fraction_full_trajectory[sphere_count]) < delta_t/2) {
                            which_radius_array.push_back(sphere_count);
                        }
                        else{
                            sphere_count++;
                            which_radius_array.push_back(sphere_count);
                            intersection_array.push_back(i);
                        }

                    }
                    // cout << "Intersection Array: NTF " << num_this_path<< endl;
                    // for (int i=0;i<intersection_array.size(); i++){
                    //     cout << intersection_array[i] << endl;
                    // }
                    // cout << "---------------------" << endl;
                    // this_optimal_sigma.poses.clear();
                    this_optimal_cost = OptimizeSCP_Single_Int(new_optimal_sigma, num_steps, U_max, x_0.pos, x_f.pos, this_optimal_sigma, which_radius_array, this_path);
                    if (this_optimal_cost == INFINITY) {
                        return -1;
                    }
                    // cout << "TOS " << endl;
                    // for (int i=0;i<this_optimal_sigma.poses.size(); i++){
                    //     cout << this_optimal_sigma.poses[i].position.x << "," << this_optimal_sigma.poses[i].position.y << "," << this_optimal_sigma.poses[i].position.z << endl;
                    // }
                    // cout << "---------------------" << endl;

                }
            }


            else if (type_of_dynamics == 3){ // Double Integrator: \ddot{x} = u
                cout << "Double Integrator Dynamics" << endl;
                this_path = T.minTreeSet;
                this_dist = T.minCost;
                // Simple SCP Trajectory
                float U_max = 100;

                // cout << "This Path " << endl;
                // for (int i=0;i<T.minTreeSet.size(); i++){
                //     cout << T.nodes[T.minTreeSet[i]].pos[0] << "," << T.nodes[T.minTreeSet[i]].pos[1] << "," << T.nodes[T.minTreeSet[i]].pos[2] << "," <<T.nodes[T.minTreeSet[i]].minObs << endl;
                // }
                // cout << "---------------------" << endl;

                // TODO: Make Total_time and delta_t user input
                float total_time = 10; // [sec]
                delta_t = 0.1; // [sec]
                num_steps = floor((total_time/delta_t)+1);

                // Optimize SCP trajectory
                int num_this_path = T.minTreeSet.size();

                // Write this_old_optimal_sigma
                vector<Node> this_old_optimal_sigma;
                this_old_optimal_sigma.reserve(2*num_this_path-1);
                Node this_path_node;

                for (int i=0; i<num_this_path; i++){
                    this_path_node = T.nodes[T.minTreeSet[i]];
                    if (i == num_this_path){
                        this_old_optimal_sigma.push_back(this_path_node);
                    }
                    else{
                        this_old_optimal_sigma.push_back(this_path_node);
                        this_old_optimal_sigma.push_back(this_path_node);
                    }
                }
                // Find Full Trajectory connecting sphere intersections
                //int num_this_path = this_path.size();
                Node traj_node;
                vector<Node> full_trajectory;
                Node traj_node2;
                Node traj_node3;
                full_trajectory.reserve(num_this_path+1);

                for (int i=0; i <= num_this_path; i++){

                    if (i == 0){
                        traj_node = T.nodes[T.minTreeSet[i]];
                        full_trajectory.push_back(traj_node);
                    }
                    else if (i == num_this_path){
                        full_trajectory.push_back(T.nodes[T.minTreeSet.back()]);
                    }
                    else {
                        traj_node = T.nodes[T.minTreeSet[i]];
                        traj_node2 = T.nodes[T.minTreeSet[i-1]];
                        traj_node3.pos = (traj_node2.pos + (traj_node2.minObs / (traj_node2.minObs + traj_node.minObs)) * (traj_node.pos - traj_node2.pos));
                        full_trajectory.push_back(traj_node3);
                    }
                }

                // cout << "full_trajectory " << endl;
                // for (int i=0; i< full_trajectory.size(); i++){
                //     cout << full_trajectory[i].pos[0] <<", " << full_trajectory[i].pos[1] <<", " << full_trajectory[i].pos[2] <<", " << full_trajectory[i].minObs << endl;
                // }
                // Divide up the time between waypoints by distance
                vector<float> time_fraction_full_trajectory;
                vector<float> cdf_time_fraction_full_trajectory;
                time_fraction_full_trajectory.reserve(num_this_path);

                for (int i=0; i<num_this_path; i++){
                    time_fraction_full_trajectory.push_back((full_trajectory[i+1].pos- full_trajectory[i].pos).norm());
                }

                float sum = accumulate(time_fraction_full_trajectory.begin(), time_fraction_full_trajectory.end(),0.0);

                for (int i=0; i< time_fraction_full_trajectory.size(); i++){
                    time_fraction_full_trajectory[i] = total_time * time_fraction_full_trajectory[i] / sum;
                }

                cdf_time_fraction_full_trajectory.push_back(time_fraction_full_trajectory[0]);
                for(int i =1; i< time_fraction_full_trajectory.size(); i++){
                    cdf_time_fraction_full_trajectory.push_back(cdf_time_fraction_full_trajectory[i-1] + time_fraction_full_trajectory[i]);
                }
                // cout << "TFF " << endl;
                // for (int i=0; i< time_fraction_full_trajectory.size(); i++){
                //     cout << time_fraction_full_trajectory[i] << endl;
                // }
                // cout << "CDF " << endl;
                // for (int i=0; i< cdf_time_fraction_full_trajectory.size(); i++){
                //     cout << cdf_time_fraction_full_trajectory[i] << endl;
                // }

                // Which sphere is it in at each time?
                vector<int> which_radius_array;
                which_radius_array.reserve(num_steps);
                vector<int> intersection_array;
                intersection_array.reserve(num_this_path-1);
                float t;
                int sphere_count = 0;
                for (int i=0; i < num_steps; i++){
                    t = float(i*delta_t);
                    if ((t - cdf_time_fraction_full_trajectory[sphere_count]) < delta_t/2) {
                        which_radius_array.push_back(sphere_count);
                    }
                    else{
                        sphere_count++;
                        which_radius_array.push_back(sphere_count);
                        intersection_array.push_back(i);
                    }

                }

                // cout << "Intersection Array: NTF " << num_this_path<< endl;
                // for (int i=0;i<intersection_array.size(); i++){
                //     cout << intersection_array[i] << endl;
                // }
                // cout << "---------------------" << endl;

                // cout << "Which Radius Array " << endl;
                // for (int i=0;i<which_radius_array.size(); i++){
                //     cout << which_radius_array[i] << endl;
                // }
                // cout << "---------------------" << endl;
                this_optimal_cost = SCP_Double_Int(num_steps, T, U_max, x_0.pos, x_f.pos, this_optimal_sigma, which_radius_array, this_path, delta_t);

                // cout << "TOS " << endl;
                // for (int i=0;i<this_optimal_sigma.poses.size(); i++){
                //     cout << this_optimal_sigma.poses[i].position.x << "," << this_optimal_sigma.poses[i].position.y << "," << this_optimal_sigma.poses[i].position.z << endl;
                // }
                // cout << "---------------------" << endl;
                // Write this_optimal_sigma_modified
                vector<Node> this_optimal_sigma_modified;
                Node modify1;
                Node modify2;
                Node modify3;

                // Generate New Path
                vector<Node> new_optimal_sigma;
                Node temp_new_node;
                // cout << "This optimal sigma modified size " << this_optimal_sigma_modified.size() << endl;
                for (int ni = 0; ni<num_optimize_loops; ni++){
                    delta_t = delta_t/2;
                    num_steps = floor((total_time/delta_t)+1);

                    cout << "SCP ITERATION NUMBER " << ni+1 << " of " << num_optimize_loops << endl;

                    if (ni>0){
                        this_old_optimal_sigma.clear();
                        this_old_optimal_sigma.reserve(2*num_this_path-1);
                        for (int i=0; i<num_this_path; i++){
                            this_path_node = new_optimal_sigma[i];
                            if (i == num_this_path){
                                this_old_optimal_sigma.push_back(this_path_node);
                            }
                            else{
                                this_old_optimal_sigma.push_back(this_path_node);
                                this_old_optimal_sigma.push_back(this_path_node);
                            }
                        }
                    }

                    // Write this_optimal_sigma_modified
                    this_optimal_sigma_modified.clear();
                    this_optimal_sigma_modified.reserve(2*num_this_path-1);
                    for (int i=0; i<num_this_path-1; i++){
                        if (i==0){
                            modify1.pos[0] = this_optimal_sigma.poses[i].position.x;
                            modify1.pos[1] = this_optimal_sigma.poses[i].position.y;
                            modify1.pos[2] = this_optimal_sigma.poses[i].position.z;
                            this_optimal_sigma_modified.push_back(modify1);
                            int idx = intersection_array[i];
                            modify2.pos[0] = this_optimal_sigma.poses[idx].position.x;
                            modify2.pos[1] = this_optimal_sigma.poses[idx].position.y;
                            modify2.pos[2] = this_optimal_sigma.poses[idx].position.z;
                            this_optimal_sigma_modified.push_back(modify2);
                            int next_idx = ceil(((float) intersection_array[i+1]+ (float) intersection_array[i])/2);

                            modify3.pos[0] = this_optimal_sigma.poses[next_idx].position.x;
                            modify3.pos[1] = this_optimal_sigma.poses[next_idx].position.y;
                            modify3.pos[2] = this_optimal_sigma.poses[next_idx].position.z;
                            this_optimal_sigma_modified.push_back(modify3);
                        }
                        else if (i == num_this_path-2){
                            int idx = intersection_array[i];
                            modify1.pos[0] = this_optimal_sigma.poses[idx].position.x;
                            modify1.pos[1] = this_optimal_sigma.poses[idx].position.y;
                            modify1.pos[2] = this_optimal_sigma.poses[idx].position.z;
                            this_optimal_sigma_modified.push_back(modify1);
                            if (idx != this_optimal_sigma.poses.size()-1) {
                                modify2.pos[0] = this_optimal_sigma.poses.back().position.x;
                                modify2.pos[1] = this_optimal_sigma.poses.back().position.y;
                                modify2.pos[2] = this_optimal_sigma.poses.back().position.z;
                                this_optimal_sigma_modified.push_back(modify2);
                            }
                        }
                        else{
                            int idx = intersection_array[i];
                            modify1.pos[0] = this_optimal_sigma.poses[idx].position.x;
                            modify1.pos[1] = this_optimal_sigma.poses[idx].position.y;
                            modify1.pos[2] = this_optimal_sigma.poses[idx].position.z;
                            this_optimal_sigma_modified.push_back(modify1);
                            int next_idx = ceil(((float) intersection_array[i+1]+ (float) intersection_array[i])/2);

                            modify2.pos[0] = this_optimal_sigma.poses[next_idx].position.x;
                            modify2.pos[1] = this_optimal_sigma.poses[next_idx].position.y;
                            modify2.pos[2] = this_optimal_sigma.poses[next_idx].position.z;
                            this_optimal_sigma_modified.push_back(modify2);
                        }

                    }


                    Vector3f x_idx, x_idx_old, x_idx_new;
                    float r_idx, r_idx_old, r_idx_new;
                    new_optimal_sigma.clear();
                    //new_optimal_sigma.reserve(num_steps);
                    Node temp_new_node;
                    for (int i=0; i < this_optimal_sigma_modified.size(); i++){
                        if (i == 0){
                            temp_new_node.pos = this_optimal_sigma_modified[i].pos;
                            temp_new_node.minObs = this_old_optimal_sigma[i].minObs;
                            new_optimal_sigma.push_back(temp_new_node);
                        }
                        else if (i == this_optimal_sigma_modified.size()-1){
                            temp_new_node.pos = this_optimal_sigma_modified.back().pos;
                            temp_new_node.minObs = this_old_optimal_sigma.back().minObs;
                            new_optimal_sigma.push_back(temp_new_node);
                        }
                        else{
                            x_idx_new = this_optimal_sigma_modified[i].pos;
                            r_idx_new = MinDisObstacle(x_idx_new);

                            x_idx_old = new_optimal_sigma.back().pos;
                            r_idx_old = new_optimal_sigma.back().minObs;
                            if ((x_idx_new - x_idx_old).norm() <= r_idx_new + r_idx_old){
                                temp_new_node.pos = x_idx_new;
                                temp_new_node.minObs = r_idx_new;
                                new_optimal_sigma.push_back(temp_new_node);
                            }
                            else{
                                // cout << "TOO FAR " << endl;
                                x_idx = this_old_optimal_sigma[i].pos;
                                r_idx = this_old_optimal_sigma[i].minObs;

                                temp_new_node.pos = x_idx;
                                temp_new_node.minObs = r_idx;
                                new_optimal_sigma.push_back(temp_new_node);

                                temp_new_node.pos = x_idx_new;
                                temp_new_node.minObs = r_idx_new;
                                new_optimal_sigma.push_back(temp_new_node);
                                // cout << "Norm1 " << (x_idx_old - x_idx).norm() << " Rads " << r_idx+r_idx_old << endl;
                                // cout << "Norm " << (x_idx - x_idx_new).norm() << " Rads " << r_idx_new+r_idx << endl;
                            }
                        }
                    }
                    // Identify NOS pairs that are causing trouble

                    num_this_path = new_optimal_sigma.size();

                    float NOS_norm, NOS_radius;
                    bool badSphere = false;
                    for (int i=0; i<new_optimal_sigma.size()-1; i++){
                        NOS_norm = (new_optimal_sigma[i].pos - new_optimal_sigma[i+1].pos).norm();
                        NOS_radius = new_optimal_sigma[i].minObs + new_optimal_sigma[i+1].minObs;
                        if (NOS_norm>NOS_radius) {
                            cout << "Bad: " << NOS_norm << " , " << NOS_radius << " for nodes ";
                            cout << new_optimal_sigma[i].pos[0] << " ," << new_optimal_sigma[i].pos[1] << " ," << new_optimal_sigma[i].pos[2] << " ; ";
                            cout << new_optimal_sigma[i+1].pos[0] << " ," << new_optimal_sigma[i+1].pos[1] << " ," << new_optimal_sigma[i+1].pos[2] << endl;
                        }
                    }
                    cout << "------------------------------------------" << endl;
                    if (badSphere){
                        cout << endl << "Spheres don't intersect, optimization will fail, exiting" << endl;
                        return -1;
                    }
                    // Divide up the time between waypoints by distance
                    num_this_path = new_optimal_sigma.size();
                    full_trajectory.clear();
                    full_trajectory.reserve(num_this_path+1);

                    for (int i=0; i <= num_this_path; i++){

                        if (i == 0){
                            traj_node = new_optimal_sigma[i];
                            full_trajectory.push_back(traj_node);
                        }
                        else if (i == num_this_path){
                            traj_node = new_optimal_sigma[i-1];
                            full_trajectory.push_back(traj_node);
                        }
                        else {
                            traj_node = new_optimal_sigma[i];
                            traj_node2 = new_optimal_sigma[i-1];
                            traj_node3.pos = (traj_node2.pos + (traj_node2.minObs / (traj_node2.minObs + traj_node.minObs)) * (traj_node.pos - traj_node2.pos));
                            full_trajectory.push_back(traj_node3);
                        }
                    }
                    // cout << "Full Traj " << endl;
                    // for (int i=0;i<full_trajectory.size(); i++){
                    //     cout << full_trajectory[i].pos[0] << "," << full_trajectory[i].pos[1] << "," << full_trajectory[i].pos[2] << endl;
                    // }
                    // cout << "---------------------" << endl;
                    time_fraction_full_trajectory.clear();
                    cdf_time_fraction_full_trajectory.clear();
                    cdf_time_fraction_full_trajectory.reserve(num_this_path);
                    time_fraction_full_trajectory.reserve(num_this_path);
                    sum = 0.0;
                    for (int i=0; i<num_this_path; i++){
                        float dist = (full_trajectory[i+1].pos- full_trajectory[i].pos).norm();
                        time_fraction_full_trajectory.push_back(dist);
                        sum += dist;
                    }

                    for (int i=0; i< time_fraction_full_trajectory.size(); i++){
                        time_fraction_full_trajectory[i] = total_time * time_fraction_full_trajectory[i] / sum;
                    }

                    cdf_time_fraction_full_trajectory.push_back(time_fraction_full_trajectory[0]);
                    for(int i =1; i< time_fraction_full_trajectory.size(); i++){
                        cdf_time_fraction_full_trajectory.push_back(cdf_time_fraction_full_trajectory[i-1] + time_fraction_full_trajectory[i]);
                    }

                    // cout << "TFF " << endl;
                    // for (int i=0;i<time_fraction_full_trajectory.size(); i++){
                    //     cout << time_fraction_full_trajectory[i] << endl;
                    // }
                    // cout << "---------------------" << endl;
                    // cout << "CDF " << endl;
                    // for (int i=0;i<cdf_time_fraction_full_trajectory.size(); i++){
                    //     cout << cdf_time_fraction_full_trajectory[i] << endl;
                    // }
                    // cout << "---------------------" << endl;
                    // Which sphere is it in at each time?
                    which_radius_array.clear();
                    which_radius_array.reserve(num_steps);
                    intersection_array.clear();
                    // intersection_array.push_back(1);
                    float t;
                    int sphere_count = 0;
                    for (int i=0; i < num_steps; i++){
                        t = float(i)*delta_t;
                        if ((t - cdf_time_fraction_full_trajectory[sphere_count]) < delta_t/2) {
                            which_radius_array.push_back(sphere_count);
                        }
                        else{
                            sphere_count++;
                            which_radius_array.push_back(sphere_count);
                            intersection_array.push_back(i);
                        }

                    }

                    // this_optimal_sigma.poses.clear();
                    this_optimal_cost = OptimizeSCP_Double_Int(new_optimal_sigma, num_steps, U_max, x_0.pos, x_f.pos, this_optimal_sigma, which_radius_array, this_path);
                    if (this_optimal_cost == INFINITY) {
                        return -1;
                    }

                }
            }

            else{
                cout<<"type_of_dynamics is incorrect!"<<endl;
            }

            // float sigma_n_to_new = 1;
            // float sigma_new_to_n = 1;
            // Vector3f x_idx;

            // cost_n_to_new = T.minCost;
            // cost_new_to_n = cost_n_to_new;

            // this_optimal_cost = cost_n_to_new; //cvx_optval
            // this_optimal_sigma = x_idx; //x

        if (this_optimal_cost < best_traj_cost) {
            best_dist = this_dist;
            best_path = this_path;
            best_traj_cost = this_optimal_cost;
            optimal_sigma.poses.resize(this_optimal_sigma.poses.size());
            //cout<<this_optimal_sigma.poses[0]<< ",,"<< optimal_sigma.poses.size()<<endl;
            for (int i=0; i< num_steps; i++){
                optimal_sigma.poses[i] = this_optimal_sigma.poses[i];
            }
            optimal_sigma_num_steps = this_optimal_sigma.poses.size();
        }
        else{
            last_path_tried_cost = this_dist;
        }
        }

            // cout<< T.minCost << " ; "<< best_dist << " ; " << last_path_tried_cost << endl;

            // if (successFlag) {
            //     // This should go away. Need a valid stopping condition.
            //     char a;
            //     cin >> a;
            //     // break;
            // }
        if (num_sample == total_num_samples && best_dist == INFINITY){
            total_num_samples = min( total_num_samples+10, 10000);
        }
    }
    // MatrixXf data_store;


    // data_store = diff_flat_traj(x_0.pos, x_f.pos, optimal_sigma);
    // data_store = diff_flat_traj_noscp(x_0.pos, x_f.pos, T);//, data_store);


    int t_end = clock();
    cout << "Computation Time = "<< (t_end-t_start)/double(CLOCKS_PER_SEC)*1000 << " msec" << endl;
    // cout <<"Minimum Tree Cost is " << T.minCost << " with " << T.minTreeSet.size() << " nodes" << endl;
    cout <<"Minimum Tree Cost = " << best_dist << endl;
    cout <<"Minimum Trajectory Cost = " << best_traj_cost << endl;

    // Save Trajectory to File
    string path = "/fmp_catkin_ws/src/frmp.ros/trajectories/traj.txt";
    cout << "Traj path is: " << path << endl;
    trajFile.open(path);
    if(!trajFile.is_open())
    {
        cout << "Traj File didn\'t open" << endl;
    }
    else {
        // for (int i=0; i<T.minTreeSet.size(); i++) {
        //     int ind = T.minTreeSet[i];
        //     trajFile << T.nodes[ind].pos[0] << "," << T.nodes[ind].pos[1]<< "," << T.nodes[ind].pos[2]<< "," << endl;
        //     cout << "Printing Tree Nodes" <<  T.nodes[ind].pos[0] << "," << T.nodes[ind].pos[1]<< "," << T.nodes[ind].pos[2]<< "," << endl;
        // }

        cout<< "Printing Trajectory" << endl;
        for (int i=0; i<optimal_sigma_num_steps; i++){
        // for (int i=0; i<T.minTreeSet.size(); i++){
            // cout << "Printing Trajectory" << optimal_sigma.poses[i].position.x << "," << optimal_sigma.poses[i].position.y << "," << optimal_sigma.poses[i].position.z << "," << endl;
            //cout<<optimal_sigma.poses[i]<<endl;
            geometry_msgs::Pose one_node = optimal_sigma.poses[i];
            // Node one_node = T.nodes[T.minTreeSet[i]];
            // cout << "Printing Trajectory: " << one_node.position.x << "," << one_node.position.y << "," << one_node.position.z << "," << endl;
            trajFile << one_node.position.x << "," << one_node.position.y << "," << one_node.position.z << "," << endl;
            // trajFile << one_node.pos[0] << "," << one_node.pos[1] << "," << one_node.pos[2] << "," << endl;
        }
        trajFile.close();
    }

    /**Set trajectory for caller*/
    for (int i=0; i<optimal_sigma_num_steps; i++){
        geometry_msgs::Pose one_node = optimal_sigma.poses[i];
        trajectory.push_back(Vector3f(one_node.position.x,one_node.position.y,one_node.position.z));
    }

    // Save DF Trajectory to File
    // path = pw->pw_dir;
    // path += "/fmp_catkin_ws/src/frmp.ros/trajectories/df_traj.txt";
    // cout << "DF Traj path is: " << path << endl;
    // trajFile.open(path);
    // if(!trajFile.is_open())
    // {
    //     cout << "Traj File didn\'t open" << endl;
    // }
    // else {
    //     // for (int i=0; i<T.minTreeSet.size(); i++) {
    //     //     int ind = T.minTreeSet[i];
    //     //     trajFile << T.nodes[ind].pos[0] << "," << T.nodes[ind].pos[1]<< "," << T.nodes[ind].pos[2]<< "," << endl;
    //     //     cout << "Printing Tree Nodes" <<  T.nodes[ind].pos[0] << "," << T.nodes[ind].pos[1]<< "," << T.nodes[ind].pos[2]<< "," << endl;
    //     // }

    //     cout<< "Printing Trajectory" << endl;
    //     // for (int i=0; i<optimal_sigma_num_steps; i++){
    //     for (int i=0; i<data_store.rows(); i++){
    //         trajFile << data_store(i,0) << "," << data_store(i,1) << "," << data_store(i,2) << "," << endl;
    //     }
    //     trajFile.close();
    // }

    ros::Rate loop_rate(5);
    int count = 0;
    optimal_sigma = this_optimal_sigma;
    while(ros::ok() && count < maxSends) {
        cout << "Sending Message" << endl;
        pub.publish(optimal_sigma);
        loop_rate.sleep();
        count++;
    }
    return 0;
}


Vector3f Generate_Sample() {
    // Generates random samples in room defined in environments.hpp
    // TODO add quasi-random sampling
    Vector3f sample;
    sample[0] = room_length[0] + (room_length[1]-room_length[0]) * ((float) rand())/((float) RAND_MAX);
    sample[1] = room_width[0] + (room_width[1]-room_width[0]) * ((float) rand())/((float) RAND_MAX);
    sample[2] = room_height[0] + (room_height[1]-room_height[0]) * ((float) rand())/((float) RAND_MAX);
    return sample;
}


Vector3f Nearest_pt_on_sphere (Tree T, Vector3f x_rand) {

    float min_dist = INFINITY;
    int min_idx = 0;
    Vector3f x_idx;
    Vector3f x_new;
    float dist = 100;

    for (int idx = 0; idx< T.nNodes; idx++) {
        x_idx = T.nodes[idx].pos;
        dist = (x_rand - x_idx).norm();

        if (dist < min_dist){
           min_dist = dist;
           min_idx = idx;
        }
    }

    if (min_dist <= T.nodes[min_idx].minObs ){
        x_new = x_rand;
    }
    else {
        x_idx = T.nodes[min_idx].pos;
        x_new = x_idx +  T.nodes[min_idx].minObs*(x_rand - x_idx)/(x_rand - x_idx).norm();
    }
    return x_new;
}

void Vertices_near_xnew(Tree T, Vector3f x_new, float r_new, vector<int>* near_idx_array) {
    // Find vertices within r_new distance of x_new
    near_idx_array->clear();
    Vector3f x_idx;
    float dist;
    for (int idx = 0; idx<=T.nNodes; idx++) {
        x_idx = T.nodes[idx].pos;
        dist = (x_new - x_idx).norm();

        if (dist <= T.nodes[idx].minObs + r_new) {
            near_idx_array->push_back(idx);
        }
    }
}

// Loads obstacles from file name specified in header (WRL Format only)
void load_obstacles() {
    // TODO add in multi-obstacle support (asteroid field, see header for instructions)
    string path = "../../../WRL/" + fName;
    ifstream envFile(path);
    bool vertFlag = false;
    all_obstacles.clear();
    vector<Vector3f> vertices;
    vertices.reserve(5000);
    Vector3f data;
    Obstacle obs;
    vector<Vector3f> faceVerts(3);
    if(!envFile.is_open())
    {
        cout << "Environment File didnt open" << endl;
    }
    else {
        string line;
        while( std::getline(envFile,line)){
            if (vertFlag) {
                if (line == "        ]" && vertFlag) {
                    break;
                }
                else {
                    stringstream strstr(line);
                    size_t initOffset = 10; // 10 spaces before data
                    size_t offset1,offset2;
                    data[0] = stod(&line[initOffset],&offset1);
                    data[1] = stod(&line[initOffset+offset1],&offset2);
                    data[2] = stod(&line[initOffset+offset1+offset2],NULL);
                    vertices.push_back(data);
                }
            }
            if (line == "        point [") {
                vertFlag = true;
            }
        }
        envFile.close();
        all_obstacles.reserve(vertices.size()/3);
        for (int i=0; i<vertices.size()/3; i++) {
            faceVerts.clear();
            faceVerts.push_back(vertices[3*i]);
            faceVerts.push_back(vertices[3*i+1]);
            faceVerts.push_back(vertices[3*i+2]);
            if (0.5*( (faceVerts[1]-faceVerts[0]).cross(faceVerts[2]-faceVerts[0]) ).norm()>0.01){
                obs.set(2,faceVerts);
                all_obstacles.push_back(obs);
            }
        }
        cout << "Num Obstacles Loaded : " << all_obstacles.size() << endl;
    }
    return;
}

float MinDisObstacle(Vector3f pos) {

    int num_obstacles = all_obstacles.size();
    float minD = INFINITY;
    Obstacle obs;
    for (int obs_i=0; obs_i<num_obstacles; obs_i++) {

        obs = all_obstacles[obs_i];
        switch (obs.shape) {
            // cuboid
            case 1 : {
                Vector3f x1,x2,x3,n,xp,xps,cm;
                float D1,D2;
                vector<Vector3f> verts;
                int flag_check_inside = 0;
                Vector4f pts;
                verts = obs.vertices; // verts is an 8-Vector of Vector3f positions of vertices

                for (int i=0; i<8; i++) {
                    minD = min( minD, (verts[i] - pos).norm() );
                }

                cm = verts[0];
                for(int i=1; i<8; i++) {
                    cm += verts[i];
                }
                cm = cm/8.0;

                // Is it inside?
                while (flag_check_inside < 6) {

                    switch (flag_check_inside) { //Check faces
                        case 0 :    pts << 0, 1, 2, 3; break;
                        case 1 :    pts << 4, 5, 6, 7; break;
                        case 2 :    pts << 0, 1, 5, 4; break;
                        case 3 :    pts << 1, 2, 6, 5; break;
                        case 4 :    pts << 2, 3, 7, 6; break;
                        case 5 :    pts << 3, 0, 4, 7; break;
                        default :   cout << "bad flag" << endl; break;
                    }

                    x1 = verts[pts[0]];
                    x2 = verts[pts[1]];
                    x3 = verts[pts[2]];

                    n = (x2-x1).cross(x3-x1) / ((x2-x1).cross(x3-x1)).norm();

                    D1 = n.dot(pos - x1);

                    D2 = n.dot(cm - x1);

                    if (D1*D2 < 0) {
                        flag_check_inside = 10;
                    }
                    else{
                        flag_check_inside++;
                    }
                }

                if (flag_check_inside == 6){
                    // pos is inside cuboid
                    minD = 0;
                    break;
                }
                else {
                    for (flag_check_inside = 0; flag_check_inside<6; flag_check_inside++) {
                        int flag_inside = 0;
                        float var_t;
                        float theta_1,theta_2,theta_3,theta_4;
                        Vector3f x1n,x2n;

                        switch (flag_check_inside) {
                            case 0 :    pts << 0, 1, 2, 3; break;
                            case 1 :    pts << 4, 5, 6, 7; break;
                            case 2 :    pts << 0, 1, 5, 4; break;
                            case 3 :    pts << 1, 2, 6, 5; break;
                            case 4 :    pts << 2, 3, 7, 6; break;
                            case 5 :    pts << 3, 0, 4, 7; break;
                            default :   cout << "bad flag" << endl; break;
                        }

                        x1 = verts[pts[0]];
                        x2 = verts[pts[1]];
                        x3 = verts[pts[2]];

                        // Dist from Point to Plane
                        // http://mathworld.wolfram.com/Point-PlaneDistance.html
                        n = (x2-x1).cross(x3-x1) / ((x2-x1).cross(x3-x1)).norm();

                        D1 = n.dot(pos - x1);

                        xp = pos - D1*n;

                        // find minimum distance to this side

                        x1n = verts[pts[0]];
                        x2n = verts[pts[1]];
                        theta_1 = acos( (xp-x1n).dot(xp-x2n)/((xp-x1n).norm()*(xp-x2n).norm()) );

                        x1n = verts[pts[1]];
                        x2n = verts[pts[2]];
                        theta_2 = acos( (xp-x1n).dot(xp-x2n)/((xp-x1n).norm()*(xp-x2n).norm()) );

                        x1n = verts[pts[2]];
                        x2n = verts[pts[3]];
                        theta_3 = acos( (xp-x1n).dot(xp-x2n)/((xp-x1n).norm()*(xp-x2n).norm()) );

                        x1n = verts[pts[0]];
                        x2n = verts[pts[3]];
                        theta_4 = acos( (xp-x1n).dot(xp-x2n)/((xp-x1n).norm()*(xp-x2n).norm()) );

                        if (abs(theta_1 + theta_2 + theta_3 + theta_4 - 2*M_PI) < 0.1){
                            // It is inside
                            minD = min( minD, abs(D1) );
                        }

                        for (int side_i=1; side_i<=4; side_i++) {

                            switch (side_i) {
                                case 1 :
                                    x1 = verts[pts[0]];
                                    x2 = verts[pts[1]];
                                    break;
                                case 2 :
                                    x1 = verts[pts[1]];
                                    x2 = verts[pts[2]];
                                    break;
                                case 3 :
                                    x1 = verts[pts[2]];
                                    x2 = verts[pts[3]];
                                    break;
                               case 4 :
                                    x1 = verts[pts[3]];
                                    x2 = verts[pts[0]];
                                    break;
                                default :
                                    cout << "Bad Input side_i" << endl;
                                    break;
                            }
                            // Dist from Point to Line
                            // http://mathworld.wolfram.com/Point-LineDistance3-Dimensional.html
                            var_t = -(x1 - xp).dot(x2 - x1)/ (x2-x1).squaredNorm();
                            if (var_t >= 0 && var_t <= 1) {
                                //flag_inside++;

                                xps = x1 + var_t*(x2-x1);

                                minD = min( minD, (xps - pos).norm() );
                            }

                        }

                        //if (flag_inside == 4) {
                        //    minD = min( minD, abs(D1) );
                        //}
                    }
                }
                break;
            }

            // face
            case 2  : {
                vector<Vector3f> verts;
                Vector3f x1,x2,x3,n,xp,xps,cm;
                float D1,D2;
                verts = obs.vertices; // 3-Vector of Vector3f vertex positions

                for (int i=0; i<3; i++) {
                    minD = min( minD, (verts[i] - pos).norm() );
                }

                x1 = verts[0];
                x2 = verts[1];
                x3 = verts[2];

                // Dist from Point to Plane
                // http://mathworld.wolfram.com/Point-PlaneDistance.html
                n = (x2-x1).cross(x3-x1) / ((x2-x1).cross(x3-x1)).norm();

                D1 = n.dot( pos - x1);

                xp = pos - D1*n;

                //int flag_inside = 0;

                float theta_1,theta_2,theta_3;

                theta_1 = acos( (xp-x1).dot(xp-x2)/((xp-x1).norm()*(xp-x2).norm()) );
                theta_2 = acos( (xp-x1).dot(xp-x3)/((xp-x1).norm()*(xp-x3).norm()) );
                theta_3 = acos( (xp-x3).dot(xp-x2)/((xp-x3).norm()*(xp-x2).norm()) );

                if (abs(theta_1+theta_2+theta_3 - 2*M_PI)<0.1) {
                    // It is inside
                    minD = min(minD,abs(D1));
                }

                for (int side_i=1; side_i<=3; side_i++) {

                    switch (side_i) {
                        case 1 :
                            x1 = verts[0];
                            x2 = verts[1];
                            break;
                        case 2 :
                            x1 = verts[1];
                            x2 = verts[2];
                            break;
                        case 3 :
                            x1 = verts[2];
                            x2 = verts[0];
                            break;
                        default :
                            cout << "Bad Input side_i" << endl;
                            break;
                    }
                    // Distance from Point to Line
                    // http://mathworld.wolfram.com/Point-LineDistance3-Dimensional.html
                    float var_t = - (x1 - xp).dot(x2 - x1)/ (x2-x1).squaredNorm();

                    if (var_t >= 0 && var_t <= 1) {
                        //flag_inside = flag_inside + 1;

                        xps = x1 + var_t*(x2-x1);

                        minD = min( minD, (xps - pos).norm() );
                    }
                }

                //if (flag_inside == 3){
                //    minD = min( minD, abs(D1) );
                //}
                break;
            }
            // cylinder
            case 3 : {
                // data = [x y z r h]
                Vector2f center;
                Vector2f posxy;
                Vector3f xpc,x1,x2,x3,n,xp;
                float D1;
                center << obs.data[0], obs.data[1];
                posxy << pos[0], pos[1];

                if (pos[2] >= obs.data[2] && pos[2] <= obs.data[2]+obs.data[4]) {
                    minD = ((center - posxy).norm() <= obs.data[3]) ? 0 : min(minD,(center - posxy).norm()-obs.data[3]);
                }
                else {
                    if (pos[2] < obs.data[2]){
                        x1 << obs.data[0], obs.data[1], obs.data[2];
                        x2 << obs.data[0]+obs.data[3], obs.data[1], obs.data[2];
                        x3 << obs.data[0], obs.data[1]+obs.data[3], obs.data[2];
                    }
                    else {
                        x1 << obs.data[0], obs.data[1], obs.data[2]+obs.data[4];
                        x2 << obs.data[0]+obs.data[3], obs.data[1], obs.data[2]+obs.data[4];
                        x3 << obs.data[0], obs.data[1]+obs.data[3], obs.data[2]+obs.data[4];
                    }
                    n = (x2-x1).cross(x3-x1) / ((x2-x1).cross(x3-x1)).norm();

                    D1 = n.dot(pos - x1);

                    xp = pos - D1*n;
                    xpc = x1 + obs.data[3]*(xp - x1)/(xp - x1).norm();
                    minD = ((xp - x1).norm() <= obs.data[3]) ? min( minD, abs(D1) ) : min( minD, (xpc - pos).norm() );
                }
                break;
            }
            // sphere
            case 4 : {
                Vector3f center;
                center[0] = obs.data[0]; // center = data[0:2], radius = data[3]
                center[1] = obs.data[1];
                center[2] = obs.data[2];
                minD = ((center - pos).norm() <= obs.data[3]) ? 0 : min( minD, (center - pos).norm() - obs.data[3]);
                break;
            }

            default :
                cout << "Bad Input side_i" << endl;
                break;

        }
    }
    return minD;
}

float SCP(Tree T, float U_max, Vector3f x_0, Vector3f x_f, geometry_msgs::PoseArray& this_optimal_sigma){

    // Begin Service Request
    hivemind::CVXpy opt;
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<hivemind::CVXpy>("CVXpy");
    opt.request.type_of_dynamics = type_of_dynamics;
    // Load into Messages for Service Request
    opt.request.U_max = U_max;

    int num_this_path = T.minTreeSet.size();
    int num_steps = 2*num_this_path-1;
    opt.request.num_this_path = num_this_path;
    opt.request.num_steps = num_steps;

    geometry_msgs::Point x_0m;
    x_0m.x = x_0[0];
    x_0m.y = x_0[1];
    x_0m.z = x_0[2];
    opt.request.x_0 = x_0m;

    geometry_msgs::Point x_fm;
    x_fm.x = x_f[0];
    x_fm.y = x_f[1];
    x_fm.z = x_f[2];
    opt.request.x_f = x_fm;


    std_msgs::Int64MultiArray this_pathm;
    this_pathm.data.clear();
    for (int i=0; i<num_steps; i++){
        this_pathm.data.push_back(T.minTreeSet[i]);
    }
    opt.request.this_path = this_pathm;

    //geometry_msgs::Point[] nodesm;
    std_msgs::Float64MultiArray radiim;
    radiim.data.clear();
    geometry_msgs::PoseArray nodesm;
    nodesm.poses.clear();

    for (int i=0; i<num_this_path; i++){
        geometry_msgs::Pose one_node;
        one_node.position.x = T.nodes[T.minTreeSet[i]].pos[0];
        one_node.position.y = T.nodes[T.minTreeSet[i]].pos[1];
        one_node.position.z = T.nodes[T.minTreeSet[i]].pos[2];
        nodesm.poses.push_back(one_node);
        radiim.data.push_back(T.nodes[T.minTreeSet[i]].minObs);
    }
    opt.request.nodes = nodesm;
    opt.request.radii = radiim;

    // Check for success
    if (client.call(opt)){
        cout << "Raw Cost " << opt.response.cost << endl;
        cout << "Cost: " << (float) opt.response.cost<< endl;
    }
    else {
        ROS_ERROR("Failed to call service CVXpy");
        return INFINITY;
    }

    // Read output
    float this_optimal_cost_new = (float) opt.response.cost;
    this_optimal_sigma = opt.response.x_opt;
    // cout << this_optimal_sigma.poses[0].position.x << endl;
    // for (int i=0; i<num_steps; i++){
    //     this_optimal_sigma[i] << opt.response.x_opt[i].x, opt.response.x_opt[i].y, opt.response.x_opt[i].z;
    // }

    return this_optimal_cost_new;
}

float SCP_Single_Int(int num_steps, Tree T, float U_max, Vector3f x_0, Vector3f x_f, geometry_msgs::PoseArray& this_optimal_sigma, vector<int>& which_radius_array, vector<int>& this_path, float delta_t){
    // Begin Service Request
    hivemind::CVXpy opt;
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<hivemind::CVXpy>("CVXpy");
    opt.request.type_of_dynamics = type_of_dynamics;
    // Load into Messages for Service Request
    opt.request.U_max = U_max;
    opt.request.delta_t = delta_t;
    int num_this_path = T.minTreeSet.size();

    opt.request.num_this_path = num_this_path;
    opt.request.num_steps = num_steps;


    geometry_msgs::Point x_0m;
    x_0m.x = x_0[0];
    x_0m.y = x_0[1];
    x_0m.z = x_0[2];
    opt.request.x_0 = x_0m;

    geometry_msgs::Point x_fm;
    x_fm.x = x_f[0];
    x_fm.y = x_f[1];
    x_fm.z = x_f[2];
    opt.request.x_f = x_fm;


    std_msgs::Int64MultiArray this_pathm;
    this_pathm.data.clear();
    for (int i=0; i<num_this_path; i++){
        this_pathm.data.push_back(T.minTreeSet[i]);
    }
    opt.request.this_path = this_pathm;

    std_msgs::Int64MultiArray which_radius_arraym;
    which_radius_arraym.data.clear();
    //which_radius_arraym.data.resize(which_radius_array.data.size());
    for(int i=0; i<which_radius_array.size(); i++){
        which_radius_arraym.data.push_back(which_radius_array[i]);
    }
    opt.request.which_radius_array = which_radius_arraym;

    //geometry_msgs::Point[] nodesm;
    std_msgs::Float64MultiArray radiim;
    radiim.data.clear();
    geometry_msgs::PoseArray nodesm;
    nodesm.poses.clear();

    for (int i=0; i<num_this_path; i++){
        geometry_msgs::Pose one_node;
        one_node.position.x = T.nodes[T.minTreeSet[i]].pos[0];
        one_node.position.y = T.nodes[T.minTreeSet[i]].pos[1];
        one_node.position.z = T.nodes[T.minTreeSet[i]].pos[2];
        nodesm.poses.push_back(one_node);
        radiim.data.push_back(T.nodes[T.minTreeSet[i]].minObs);
    }
    opt.request.nodes = nodesm;
    opt.request.radii = radiim;

    // Check for success
    if (client.call(opt)){
        cout << "Raw Cost " << opt.response.cost << endl;
        cout << "Cost: " << (float) opt.response.cost<< endl;
    }
    else {
        ROS_ERROR("Failed to call service CVXpy");
        return INFINITY;
    }

    if (opt.response.x_opt.poses.size() == 0){
        ROS_ERROR("Problem Infeasible");
        return INFINITY;
    }

    // Read output
    float this_optimal_cost_new = (float) opt.response.cost;
    this_optimal_sigma = opt.response.x_opt;


    return this_optimal_cost_new;
}

float SCP_Double_Int(int num_steps, Tree T, float U_max, Vector3f x_0, Vector3f x_f, geometry_msgs::PoseArray& this_optimal_sigma, vector<int>& which_radius_array, vector<int>& this_path, float delta_t){
    // Begin Service Request
    // cout << "Double Integrator" << endl;
    hivemind::CVXpy opt;
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<hivemind::CVXpy>("CVXpy");
    opt.request.type_of_dynamics = type_of_dynamics;

    // Load into Messages for Service Request
    opt.request.U_max = U_max;
    opt.request.delta_t = delta_t;
    int num_this_path = T.minTreeSet.size();

    opt.request.num_this_path = num_this_path;
    opt.request.num_steps = num_steps;


    geometry_msgs::Point x_0m;
    x_0m.x = x_0[0];
    x_0m.y = x_0[1];
    x_0m.z = x_0[2];
    opt.request.x_0 = x_0m;

    geometry_msgs::Point x_fm;
    x_fm.x = x_f[0];
    x_fm.y = x_f[1];
    x_fm.z = x_f[2];
    opt.request.x_f = x_fm;


    std_msgs::Int64MultiArray this_pathm;
    this_pathm.data.clear();
    for (int i=0; i<num_this_path; i++){
        this_pathm.data.push_back(T.minTreeSet[i]);
    }
    opt.request.this_path = this_pathm;

    std_msgs::Int64MultiArray which_radius_arraym;
    which_radius_arraym.data.clear();
    //which_radius_arraym.data.resize(which_radius_array.data.size());
    for(int i=0; i<which_radius_array.size(); i++){
        which_radius_arraym.data.push_back(which_radius_array[i]);
    }
    opt.request.which_radius_array = which_radius_arraym;

    //geometry_msgs::Point[] nodesm;
    std_msgs::Float64MultiArray radiim;
    radiim.data.clear();
    geometry_msgs::PoseArray nodesm;
    nodesm.poses.clear();

    for (int i=0; i<num_this_path; i++){
        geometry_msgs::Pose one_node;
        one_node.position.x = T.nodes[T.minTreeSet[i]].pos[0];
        one_node.position.y = T.nodes[T.minTreeSet[i]].pos[1];
        one_node.position.z = T.nodes[T.minTreeSet[i]].pos[2];
        nodesm.poses.push_back(one_node);
        radiim.data.push_back(T.nodes[T.minTreeSet[i]].minObs);
    }
    opt.request.nodes = nodesm;
    opt.request.radii = radiim;

    // Check for success
    // cout << "Call, " << client.call(opt) << endl;
    if (client.call(opt)){
        cout << "Raw Cost " << opt.response.cost << endl;
        cout << "Cost: " << (float) opt.response.cost<< endl;
    }
    else {
        ROS_ERROR("Failed to call service CVXpy");
        return INFINITY;
    }

    if (opt.response.x_opt.poses.size() == 0){
        ROS_ERROR("Problem Infeasible");
        return INFINITY;
    }

    // Read output
    float this_optimal_cost_new = (float) opt.response.cost;
    this_optimal_sigma = opt.response.x_opt;

    // cout<<"this_optimal_sigma.poses.size() line 1544: "<<this_optimal_sigma.poses.size()<<endl;
    // cout << this_optimal_sigma.poses[0].position.x << endl;
    // for (int i=0; i<num_steps; i++){
    //     this_optimal_sigma[i] << opt.response.x_opt[i].x, opt.response.x_opt[i].y, opt.response.x_opt[i].z;
    // }

    return this_optimal_cost_new;
}

float OptimizeSCP(vector<Node>& new_optimal_sigma, float U_max, Vector3f x_0, Vector3f x_f, geometry_msgs::PoseArray& this_optimal_sigma){

    // Begin Service Request
    hivemind::CVXpy opt;
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<hivemind::CVXpy>("CVXpy");
    opt.request.type_of_dynamics = type_of_dynamics;
    // Load into Messages for Service Request
    opt.request.U_max = U_max;
    opt.request.delta_t = delta_t;


    int num_this_path = new_optimal_sigma.size();
    int num_steps = 2*num_this_path-1;
    opt.request.num_steps = num_steps;
    opt.request.num_this_path = new_optimal_sigma.size();

    geometry_msgs::Point x_0m;
    x_0m.x = x_0[0];
    x_0m.y = x_0[1];
    x_0m.z = x_0[2];
    opt.request.x_0 = x_0m;

    geometry_msgs::Point x_fm;
    x_fm.x = x_f[0];
    x_fm.y = x_f[1];
    x_fm.z = x_f[2];
    opt.request.x_f = x_fm;

    // std_msgs::Int64MultiArray this_pathm;
    // this_pathm.data.clear();
    // for (int i=0; i<num_steps; i++){
    //     this_pathm.data.push_back(T.minTreeSet[i]);
    // }
    // opt.request.this_path = this_pathm;


    //geometry_msgs::Point[] nodesm;
    std_msgs::Float64MultiArray radiim;
    radiim.data.clear();
    geometry_msgs::PoseArray nodesm;
    nodesm.poses.clear();

    for (int i=0; i<num_this_path; i++){
        geometry_msgs::Pose one_node;
        one_node.position.x = new_optimal_sigma[i].pos[0];
        one_node.position.y = new_optimal_sigma[i].pos[1];
        one_node.position.z = new_optimal_sigma[i].pos[2];
        nodesm.poses.push_back(one_node);
        radiim.data.push_back(new_optimal_sigma[i].minObs);
    }
    // for (int i=0; i<num_this_path; i++){
    //     geometry_msgs::Pose one_node;
    //     one_node.position.x = T.nodes[T.minTreeSet[i]].pos[0];
    //     one_node.position.y = T.nodes[T.minTreeSet[i]].pos[1];
    //     one_node.position.z = T.nodes[T.minTreeSet[i]].pos[2];
    //     nodesm.poses.push_back(one_node);
    //     radiim.data.push_back(T.nodes[T.minTreeSet[i]].minObs);
    // }
    opt.request.nodes = nodesm;
    opt.request.radii = radiim;


    // Check for success
    if (client.call(opt)){
        cout << "Cost: " << (float) opt.response.cost<< endl;
    }
    else {
        ROS_ERROR("Failed to call service CVXpy");
        return INFINITY;
    }
    // Read output
    float this_optimal_cost_new = (float) opt.response.cost;
    this_optimal_sigma = opt.response.x_opt;
    // cout << this_optimal_sigma.poses[0].position.x << endl;
    // for (int i=0; i<num_steps; i++){
    //     this_optimal_sigma[i] << opt.response.x_opt[i].x, opt.response.x_opt[i].y, opt.response.x_opt[i].z;
    // }
    return this_optimal_cost_new;

}

float OptimizeSCP_Single_Int(vector<Node>& new_optimal_sigma, int num_steps, float U_max, Vector3f x_0, Vector3f x_f, geometry_msgs::PoseArray& this_optimal_sigma, vector<int>& which_radius_array, vector<int>& this_path){

    // Begin Service Request
    hivemind::CVXpy opt;
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<hivemind::CVXpy>("CVXpy");
    opt.request.type_of_dynamics = type_of_dynamics;
    // Load into Messages for Service Request
    opt.request.U_max = U_max;

    int num_this_path = new_optimal_sigma.size();

    opt.request.num_this_path = num_this_path;
    opt.request.num_steps = num_steps;
    opt.request.delta_t = delta_t;


    geometry_msgs::Point x_0m;
    x_0m.x = x_0[0];
    x_0m.y = x_0[1];
    x_0m.z = x_0[2];
    opt.request.x_0 = x_0m;

    geometry_msgs::Point x_fm;
    x_fm.x = x_f[0];
    x_fm.y = x_f[1];
    x_fm.z = x_f[2];
    opt.request.x_f = x_fm;

    std_msgs::Int64MultiArray this_pathm;
    this_pathm.data.clear();
    for (int i=0; i<num_this_path; i++){
        this_pathm.data.push_back(this_path[i]);
    }
    opt.request.this_path = this_pathm;

    std_msgs::Int64MultiArray which_radius_arraym;
    which_radius_arraym.data.clear();
    for(int i=0; i<which_radius_array.size(); i++){
        which_radius_arraym.data.push_back(which_radius_array[i]);
    }
    opt.request.which_radius_array = which_radius_arraym;

    //geometry_msgs::Point[] nodesm;
    std_msgs::Float64MultiArray radiim;
    radiim.data.clear();
    geometry_msgs::PoseArray nodesm;
    nodesm.poses.clear();

    for (int i=0; i<num_this_path; i++){
        geometry_msgs::Pose one_node;
        one_node.position.x = new_optimal_sigma[i].pos[0];
        one_node.position.y = new_optimal_sigma[i].pos[1];
        one_node.position.z = new_optimal_sigma[i].pos[2];
        nodesm.poses.push_back(one_node);
        radiim.data.push_back(new_optimal_sigma[i].minObs);
    }
    opt.request.nodes = nodesm;
    opt.request.radii = radiim;


    // Check for success
    if (client.call(opt)){
        cout << "Cost: " << (float) opt.response.cost<< endl;
    }
    else {
        ROS_ERROR("Failed to call service CVXpy");
        return INFINITY;
    }
    // Read output
    float this_optimal_cost_new = (float) opt.response.cost;
    this_optimal_sigma = opt.response.x_opt;
    // cout << this_optimal_sigma.poses[0].position.x << endl;
    // for (int i=0; i<num_steps; i++){
    //     this_optimal_sigma[i] << opt.response.x_opt[i].x, opt.response.x_opt[i].y, opt.response.x_opt[i].z;
    // }
    return this_optimal_cost_new;

}

float OptimizeSCP_Double_Int(vector<Node>& new_optimal_sigma, int num_steps, float U_max, Vector3f x_0, Vector3f x_f, geometry_msgs::PoseArray& this_optimal_sigma, vector<int>& which_radius_array, vector<int>& this_path){

    // Begin Service Request
    hivemind::CVXpy opt;
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<hivemind::CVXpy>("CVXpy");
    opt.request.type_of_dynamics = type_of_dynamics;
    // Load into Messages for Service Request
    opt.request.U_max = U_max;
    opt.request.delta_t = delta_t;

    int num_this_path = new_optimal_sigma.size();

    opt.request.num_this_path = num_this_path;
    opt.request.num_steps = num_steps;


    geometry_msgs::Point x_0m;
    x_0m.x = x_0[0];
    x_0m.y = x_0[1];
    x_0m.z = x_0[2];
    opt.request.x_0 = x_0m;

    geometry_msgs::Point x_fm;
    x_fm.x = x_f[0];
    x_fm.y = x_f[1];
    x_fm.z = x_f[2];
    opt.request.x_f = x_fm;

    std_msgs::Int64MultiArray this_pathm;
    this_pathm.data.clear();
    for (int i=0; i<num_this_path; i++){
        this_pathm.data.push_back(this_path[i]);
    }
    opt.request.this_path = this_pathm;

    std_msgs::Int64MultiArray which_radius_arraym;
    which_radius_arraym.data.clear();
    for(int i=0; i<which_radius_array.size(); i++){
        which_radius_arraym.data.push_back(which_radius_array[i]);
    }
    opt.request.which_radius_array = which_radius_arraym;

    //geometry_msgs::Point[] nodesm;
    std_msgs::Float64MultiArray radiim;
    radiim.data.clear();
    geometry_msgs::PoseArray nodesm;
    nodesm.poses.clear();

    for (int i=0; i<num_this_path; i++){
        geometry_msgs::Pose one_node;
        one_node.position.x = new_optimal_sigma[i].pos[0];
        one_node.position.y = new_optimal_sigma[i].pos[1];
        one_node.position.z = new_optimal_sigma[i].pos[2];
        nodesm.poses.push_back(one_node);
        radiim.data.push_back(new_optimal_sigma[i].minObs);
    }
    opt.request.nodes = nodesm;
    opt.request.radii = radiim;


    // Check for success
    if (client.call(opt)){
        cout << "Cost: " << (float) opt.response.cost<< endl;
        if (opt.response.cost == 0){
            cout << "Optimization Failed, exiting" << endl;
            return INFINITY;
        }
    }
    else {
        ROS_ERROR("Failed to call service CVXpy");
        return INFINITY;
    }
    // Read output
    float this_optimal_cost_new = (float) opt.response.cost;
    this_optimal_sigma = opt.response.x_opt;
    // cout << this_optimal_sigma.poses[0].position.x << endl;
    // for (int i=0; i<num_steps; i++){
    //     this_optimal_sigma[i] << opt.response.x_opt[i].x, opt.response.x_opt[i].y, opt.response.x_opt[i].z;
    // }
    return this_optimal_cost_new;

}
