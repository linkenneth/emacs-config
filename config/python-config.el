;;;;;;;;;;;;;;;;;;;;;;;;
;; Python Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; ; Use Python 3 by default unless specified
;; (setq python-python-command "python3")

; Reinstate current directory
(setq python-remove-cwd-from-path nil)

(add-hook 'python-mode-hook (lambda ()
			      (setq indent-tabs-mode nil)
			      ))

; Tupperware = Python
(add-to-list 'auto-mode-alist '("\\.tw" . python-mode))
