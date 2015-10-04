;;;;;;;;;;;;;;;;;;;;;;;;
;; Cython Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'cython-mode "cython-mode.el" "Major mode for Cython." t)
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))
