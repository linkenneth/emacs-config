;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YASnippet configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; YASnippet is a template system for Emacs. It speeds up development by
;; reducing the need for developers to type out boilerplate code manually.
(package-activate 'yasnippet)
(require 'yasnippet)

(yas-global-mode)

(defun yasnippet-keys-config ()
  (define-key evil-insert-state-map (kbd "<backtab>") 'company-yasnippet))
(add-hook 'after-init-hook 'yasnippet-keys-config)

(provide 'yasnippet-config)
