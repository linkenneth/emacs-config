;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Lisp mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun emacs-lisp-mode-setup ()
  ;; TODO has problems with flycheck's elisp checker. Also, consider
  ;; using package manager sometime in the future?
  (setq flycheck-emacs-lisp-initialize-packages nil)

  ;; Use the current load path to find symbols in elisp-mode
  (setq flycheck-emacs-lisp-load-path 'inherit)

  ;; emacs-lisp-checkdoc is too intense for the types of config
  ;; files I work with...
  (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc)))


(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-setup)

(provide 'elisp-mode-config)
