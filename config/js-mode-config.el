;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript Config ;;
;;;;;;;;;;;;;;;;;;;;;;;

(defun js-mode-setup ()
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'js-mode-setup)

(provide 'js-mode-config)
