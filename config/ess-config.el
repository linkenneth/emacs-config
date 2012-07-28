;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Speaks Statistics (ESS Mode Config) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "ess-site.el")

; Conveniences
(setq ess-eval-visibly-p nil) ; otherwise C-c C-r (eval region) takes forever
(setq ess-ask-for-ess-directory nil) ; otherwise you are prompted each time you start an interactive R session
