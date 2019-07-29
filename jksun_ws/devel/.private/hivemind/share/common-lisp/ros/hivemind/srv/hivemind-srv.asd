
(cl:in-package :asdf)

(defsystem "hivemind-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CVXpy" :depends-on ("_package_CVXpy"))
    (:file "_package_CVXpy" :depends-on ("_package"))
    (:file "SATO" :depends-on ("_package_SATO"))
    (:file "_package_SATO" :depends-on ("_package"))
    (:file "plotting" :depends-on ("_package_plotting"))
    (:file "_package_plotting" :depends-on ("_package"))
    (:file "reaction_wheel" :depends-on ("_package_reaction_wheel"))
    (:file "_package_reaction_wheel" :depends-on ("_package"))
  ))