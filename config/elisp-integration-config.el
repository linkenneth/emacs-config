;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp Integration ;;
;;;;;;;;;;;;;;;;;;;;;;;

; allows interactive evaluation of elisp expressions; see keymap.el
(defun eval-and-replace-sexp-at-point ()
  (interactive)
  (let ((sexp (sexp-at-point)))
    (if sexp
	(kill-sexp)
      (progn
	;; Need to make this work on back parenthesis
	(setq sexp (preceding-sexp))
	(backward-kill-sexp)))
    (insert (format "%s" (eval sexp)))))
