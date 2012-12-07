;;;;;;;;;;;;
;; nXhtml ;;
;;;;;;;;;;;;

(load "~/.emacs.d/plugins/nxhtml/autostart.el")

;; Mumamo is making newer emacs freak out - remove obsolete variable warning
(when (and (equal emacs-major-version 23)
           (equal emacs-minor-version 3))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function)))

(add-hook 'after-change-major-mode-hook 'linum-on)
;; Get proper syntax highlighting for html files
(add-to-list 'auto-mode-alist '("\\.html\\'" . asp-html-mumamo-mode))
