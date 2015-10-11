;;;;;;;;;;;;;;;
;; Text Mode ;;
;;;;;;;;;;;;;;;

;; Navigate by "visual lines" (irrelevant of wrapping)
(add-hook 'text-mode-hook 'visual-line-mode)

;; Automatically wraps as you type
(add-hook 'text-mode-hook 'auto-fill-mode)
