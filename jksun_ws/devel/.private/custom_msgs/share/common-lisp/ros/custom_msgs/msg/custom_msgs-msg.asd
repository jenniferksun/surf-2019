
(cl:in-package :asdf)

(defsystem "custom_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Thrusters8" :depends-on ("_package_Thrusters8"))
    (:file "_package_Thrusters8" :depends-on ("_package"))
  ))