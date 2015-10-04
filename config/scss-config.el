;;;;;;;;;;;;;;;;;
;; SCSS Config ;;
;;;;;;;;;;;;;;;;;

(autoload 'scss-mode "scss-mode.el" "Major mode for SCSS." t)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

; Don't compile into CSS every time I save
(setq scss-compile-at-save nil)
