;;;;;;;;;;;;;;;;;;;;;
;; Flycheck Config ;;
;;;;;;;;;;;;;;;;;;;;;

;; All except corp desktop
(do-if-not-profile
 '(:linux :corp :desktop)
 `(progn
    (package-activate 'flycheck-ycmd)
    (require 'flycheck-ycmd)
    (flycheck-ycmd-setup)
    (add-hook 'prog-mode-hook 'flycheck-mode)))

;; Use the current load path to find symbols in elisp-mode
(setq flycheck-emacs-lisp-load-path 'inherit)

;; Toggles the Flycheck error list as well as flycheck-mode itself on
;; and off; see keymap.el
;; P.S. wrote this entirely myself!
(defun flycheck-toggle-error-list-or-mode-off ()
  (interactive)
  (cond
   ((not flycheck-mode)
    (progn
      (flycheck-mode 1)
      (message "flycheck-mode on")))
   ((and flycheck-mode (get-buffer-window "*Flycheck errors*"))
    (progn
      (delete-windows-on "*Flycheck errors*")
      (flycheck-mode 0)
      (message "flycheck-mode off")))
   ((progn
      (flycheck-list-errors)))))

(eval-after-load 'flycheck
  (progn
    ;; Make Flycheck show error in tooltip as opposed to bottom bar
    (package-activate 'flycheck-pos-tip)
    (require 'flycheck-pos-tip)
    (setq flycheck-display-errors-function 'flycheck-pos-tip-error-messages)

    ;; Fix bug with company-mode and flycheck-mode together (this will
    ;; be fixed in 24.5+)
    (when (not (display-graphic-p))
      (setq flycheck-indication-mode nil))))
