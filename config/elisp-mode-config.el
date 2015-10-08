;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Lisp Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun emacs-lisp-mode-setup ()
  ;; TODO has problems with flycheck's elisp checker. Also, consider
  ;; using package manager sometime in the future?
  (setq flycheck-emacs-lisp-initialize-packages nil)
  (setq flycheck-emacs-lisp-package-user-dir nil)

  ;; emacs-lisp-checkdoc is too intense for the types of config
  ;; files I work with...
  (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-setup)
