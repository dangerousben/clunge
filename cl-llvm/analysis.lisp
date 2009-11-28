(in-package :llvm)

(export '(verify-module))

(defcenum verifier-failure-action
  :abort-process
  :print-message
  :return-status)

(defcfun ("LLVMVerifyModule" verify-module) :int
  (module module-ref) (action verifier-failure-action) (out-message :pointer))
