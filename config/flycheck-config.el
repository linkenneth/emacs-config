;;;;;;;;;;;;;;;;;;;;;
;; Flycheck Config ;;
;;;;;;;;;;;;;;;;;;;;;

;; All except corp desktop
(if (not (s-suffix? "mtv.corp.google.com" system-name))
    (progn
      (require 'flycheck-ycmd)
      (flycheck-ycmd-setup)
      (add-hook 'prog-mode-hook 'flycheck-mode)))

;; TODO has problems with flycheck's elisp checker. Also, consider
;; using package manager sometime in the future?
(setq flycheck-emacs-lisp-initialize-packages nil)
(setq flycheck-emacs-lisp-package-user-dir nil)

;; TODO figure out if this has problems
(setq package-user-dir "~/.emacs.d/elpa")

;; Use the current load path to find symbols in elisp-mode
(setq flycheck-emacs-lisp-load-path 'inherit)

;; Toggles the Flycheck error list as well as flycheck-mode itself on
;; and off; see keymap.el
;; P.S. wrote this entirely myself!
(defun flycheck-toggle-error-list-or-mode-off ()
  (interactive)
  (cond
   ((not flycheck-mode) (flycheck-mode 1))
   ((and flycheck-mode (get-buffer-window "*Flycheck errors*"))
    (progn
      (delete-windows-on "*Flycheck errors*")
      (flycheck-mode 0)))
   ((flycheck-list-errors))))

(eval-after-load 'flycheck
  (progn
    ;; Make Flycheck show error in tooltip as opposed to bottom bar
    (require 'flycheck-pos-tip)
    (setq flycheck-display-errors-function 'flycheck-pos-tip-error-messages)

    ;; Fix bug with company-mode and flycheck-mode together (this will
    ;; be fixed in 24.5+)
    (when (not (display-graphic-p))
      (setq flycheck-indication-mode nil))))
