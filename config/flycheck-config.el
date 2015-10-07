;;;;;;;;;;;;;;;;;;;;;
;; Flycheck Config ;;
;;;;;;;;;;;;;;;;;;;;;

;; TODO has problems with flycheck's elisp checker. Also, consider
;; using package manager sometime in the future?
(setq flycheck-emacs-lisp-initialize-packages nil)
(setq flycheck-emacs-lisp-package-user-dir nil)

;; TODO figure out if this has problems
(setq package-user-dir "~/.emacs.d/elpa")

;; Wrote this myself!
(defun flycheck-toggle-error-list-or-mode-off ()
  (interactive)
  (cond
   ((not flycheck-mode) (flycheck-mode 1))
   ((and flycheck-mode (get-buffer-window "*Flycheck errors*"))
    (progn
      (delete-windows-on "*Flycheck errors*")
      (flycheck-mode 0)))
   ((flycheck-list-errors))))
