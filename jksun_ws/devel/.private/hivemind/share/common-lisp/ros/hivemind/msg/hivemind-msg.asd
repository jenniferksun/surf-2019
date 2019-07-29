
(cl:in-package :asdf)

(defsystem "hivemind-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "SATO_controller" :depends-on ("_package_SATO_controller"))
    (:file "_package_SATO_controller" :depends-on ("_package"))
    (:file "Thrusters16" :depends-on ("_package_Thrusters16"))
    (:file "_package_Thrusters16" :depends-on ("_package"))
    (:file "Thrusters8" :depends-on ("_package_Thrusters8"))
    (:file "_package_Thrusters8" :depends-on ("_package"))
    (:file "Velocity3" :depends-on ("_package_Velocity3"))
    (:file "_package_Velocity3" :depends-on ("_package"))
  ))