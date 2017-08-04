;;;;;;;;;;;;
;; nXhtml ;;
;;;;;;;;;;;;

(setq css-indent-offset 2)
;; ;; TODO fix this and make this fast when I start using it
;; (load "~/.emacs.d/plugins/nxhtml/autostart.el")

;; ;; Mumamo is making newer emacs freak out - remove obsolete variable warning
;; (when (and (equal emacs-major-version 23)
;;            (equal emacs-minor-version 3))
;;   (eval-after-load "bytecomp"
;;     '(add-to-list 'byte-compile-not-obsolete-vars
;;                   'font-lock-beginning-of-syntax-function))
;;   ;; tramp-compat.el clobbers this variable!
;;   (eval-after-load "tramp-compat"
;;     '(add-to-list 'byte-compile-not-obsolete-vars
;;                   'font-lock-beginning-of-syntax-function)))

;; ;; Fix for nXhtml mode freakout, but also a general change to make
;; ;; sure linum-mode is on.
;; (add-hook 'after-change-major-mode-hook 'linum-on)

;; ;; Normal nxhtml-mode bugged out so use this instead
;; (add-to-list 'auto-mode-alist '("\\.html\\'" . eruby-nxhtml-mumamo-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))
