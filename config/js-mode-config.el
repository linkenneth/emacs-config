;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun js-mode-setup ()
  (setq js-indent-level 2)
  (setq-local evil-shift-width 2)
  (setq flycheck-javascript-standard-executable "semistandard"))

(add-hook 'js-mode-hook 'js-mode-setup)

;; TODO: also consider web-mode (better replacement to nxhtml-mode)

(provide 'js-mode-config)
