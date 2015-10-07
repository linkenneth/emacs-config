;;;;;;;;;;;;;;;;;;;;;
;; Flycheck Config ;;
;;;;;;;;;;;;;;;;;;;;;

;; TODO has problems with flycheck's elisp checker. Also, consider
;; using package manager sometime in the future?
(setq flycheck-emacs-lisp-initialize-packages nil)
(setq flycheck-emacs-lisp-package-user-dir nil)

;; TODO figure out if this has problems
(setq package-user-dir "~/.emacs.d/elpa")
