(defpackage :llvm-system (:use :cl :asdf))
(in-package :llvm-system)

(defsystem :cl-llvm
  :depends-on (:cffi)
  :serial t
  :components ((:file "cl-llvm")
               (:file "core")
               (:file "analysis")))

