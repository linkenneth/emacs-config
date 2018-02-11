;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Speaks Statistics (ESS) mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Only need R-mode at the moment. If other modes are needed add to
; auto-mode-alist appropriately.

(autoload 'R-mode "ess-site.el" "R mode, part of the ESS package." t)
(add-to-list 'auto-mode-alist '("\\.[rR]\\'" . R-mode))
(add-to-list 'auto-mode-alist '("\\.[rR]profile\\'" . R-mode))
(add-to-list 'auto-mode-alist '("NAMESPACE\\'" . R-mode))

(defun ess-mode-setup ()
  ; Convenience setup
  (setq ess-eval-visibly-p nil) ; otherwise C-c C-r (eval region) takes forever
  (setq ess-ask-for-ess-directory nil)) ; otherwise you are prompted each time you start an interactive R session

(eval-after-load "ess-site" '(ess-mode-setup))

(provide 'ess-mode-config)
