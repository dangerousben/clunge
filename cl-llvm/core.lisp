(in-package :llvm)

(export '(int1-type
          int8-type
          int16-type
          int32-type
          int64-type
          int-type
          get-int-type-width
          float-type
          double-type
          x86-fp80-type
          fp128-type
          ppc-fp128-type
          array-type
          pointer-type
          vector-type
          module-create-with-name))

(defctype module-ref :pointer)
(defctype type-ref :pointer)

(defcfun ("LLVMInt1Type" int1-type) type-ref)
(defcfun ("LLVMInt8Type" int8-type) type-ref)
(defcfun ("LLVMInt16Type" int16-type) type-ref)
(defcfun ("LLVMInt32Type" int32-type) type-ref)
(defcfun ("LLVMInt64Type" int64-type) type-ref)
(defcfun ("LLVMIntType" int-type) type-ref
  (num-bits :unsigned-int))
(defcfun ("LLVMGetIntTypeWidth" get-int-type-width) :unsigned-int
  (type type-ref))

(defcfun ("LLVMFloatType" float-type) type-ref)
(defcfun ("LLVMDoubleType" double-type) type-ref)
(defcfun ("LLVMX86FP80Type" x86-fp80-type) type-ref)
(defcfun ("LLVMFP128Type" fp128-type) type-ref)
(defcfun ("LLVMPPCFP128Type" ppc-fp128-type) type-ref)

(defcfun ("LLVMArrayType" array-type) type-ref
  (element-type type-ref) (element-count :unsigned-int))
(defcfun ("LLVMPointerType" pointer-type) type-ref
  (element-type type-ref) (address-space :unsigned-int))
(defcfun ("LLVMVectorType" vector-type) type-ref
  (element-type type-ref) (element-count :unsigned-int))

(defcfun ("LLVMModuleCreateWithName" module-create-with-name) module-ref
  (name :string))
