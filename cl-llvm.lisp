(defpackage :llvm (:use :cl :cffi))
(in-package :llvm)

; TODO: determine more intelligently what libs to load (via llvm-config?)
(defparameter *libs* '("libLLVMSystem.so"
                       "libLLVMSupport.so"
                       "libLLVMCore.so"
                       "libLLVMMC.so"
                       "libLLVMTarget.so"
                       "libLLVMAnalysis.so"
                       "libLLVMExecutionEngine.so"
                       "libLLVMipa.so"
                       "libLLVMTransformUtils.so"
                       "libLLVMScalarOpts.so"
                       "libLLVMCodeGen.so"
                       "libLLVMJIT.so"
                       "libLLVMInterpreter.so"
                       "libLLVMX86Info.so"
                       "libLLVMAsmPrinter.so"
                       "libLLVMSelectionDAG.so"
                       "libLLVMX86CodeGen.so"
                       "libLLVMX86AsmPrinter.so"
                       "libLLVMX86AsmParser.so"
                       "libLLVMX86Disassembler.so"))

(pushnew #P"/usr/local/lib/" *foreign-library-directories* :test #'equal)

(dolist (l *libs*)
  (load-foreign-library l))



(defctype module-ref :pointer)

(defcenum verifier-failure-action
  :abort-process
  :print-message
  :return-status)

(defcfun ("LLVMModuleCreateWithName" module-create-with-name) module-ref
  (name :string))

(defcfun ("LLVMVerifyModule" verify-module) :int
  (module module-ref) (action verifier-failure-action) (out-message :pointer))
