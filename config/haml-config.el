;;;;;;;;;;;;;;;;;;;;;;
;; Haml Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

(autoload 'haml-mode "haml-mode.el" "Major mode for Haml." t)
(add-to-list 'auto-mode-alist '("\\.html\\.haml\\'" . haml-mode))
