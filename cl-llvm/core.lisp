(in-package :llvm)

(export '(module-create-with-name))

(defctype module-ref :pointer)

(defcfun ("LLVMModuleCreateWithName" module-create-with-name) module-ref
  (name :string))
