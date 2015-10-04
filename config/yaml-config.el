;;;;;;;;;;;;;;;;;
;; YAML Config ;;
;;;;;;;;;;;;;;;;;

(autoload 'yaml-mode "yaml-mode.el" "Major mode for YAML." t)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
