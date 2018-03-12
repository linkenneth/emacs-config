;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CSS mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; CSS (Cascading StyleSheets) is the default language for styling HTML elements
;; on web.

(defun css-mode-setup ()
  (setq-default css-indent-offset 2)
  (setq-local evil-shift-width 2))
(add-hook 'css-mode-hook 'css-mode-setup)

(provide 'css-mode-config)
