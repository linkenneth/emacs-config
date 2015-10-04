;;;;;;;;;;;;;;;;;;;;;;;;
;; Python Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(defun python-mode-setup ()
  ; Reinstate current directory
  (setq python-remove-cwd-from-path nil))

(add-hook 'python-mode-hook 'python-mode-setup)

; Tupperware = Python
(add-to-list 'auto-mode-alist '("\\.tw" . python-mode))
