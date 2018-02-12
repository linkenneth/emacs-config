;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Helm mode is a plugin for incremental narrowing of M-x, C-x C-f, etc., and
;; applies to all Emacs functions that use `completing-read'. There are also
;; additional custom interfaces for specific workflows (like changing buffers,
;; choosing files).
(package-activate 'helm)
(require 'helm)
(require 'helm-config)

(helm-mode 1)

;; Automatically resizes Helm buffer if fewer candidates
(helm-autoresize-mode t)

;; Fuzzy matching (like flex-matching in IDO)
(setq helm-mode-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)

;; Make helm react faster to my fast typing...
(setq helm-exit-idle-delay 0)

;; Set the maximum buffer name length to be longer (20 is default).
(setq helm-buffer-max-length 40)

;; Behave a bit like IDO mode:
;; -- RET on directories continues search of it
;; -- backspace on beginning of directory goes back a whole directory

;; This is bound to all forms of RET. See keymap.el.
(setq original-helm-execute-persistent-action
       (symbol-function 'helm-execute-persistent-action))
(defadvice helm-execute-persistent-action
    (around helm-find-files-navigate-forward first (&rest args) activate)
  (let ((selection (helm-get-selection)))
    (if (and (stringp (helm-get-selection))
             (file-directory-p (helm-get-selection)))
        (apply original-helm-execute-persistent-action args)
      (helm-maybe-exit-minibuffer))))

(setq original-helm-ff-delete-char-backward
       (symbol-function 'helm-ff-delete-char-backward))
(defadvice helm-ff-delete-char-backward
    (around helm-ff-delete-char-backward first (&rest args) activate)
  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
      (helm-find-files-up-one-level 1)
    (apply original-helm-ff-delete-char-backward args)))

(defun helm-keys-config ()
  ;; Use g h as alternate helm-command-prefix
  (define-key evil-normal-state-map (kbd "g h") 'helm-command-prefix)
  (define-key evil-motion-state-map (kbd "g h") 'helm-command-prefix)

  (define-key helm-command-map (kbd "o") 'helm-occur)
  (define-key helm-command-map (kbd "O") 'helm-occur-from-isearch)
  (define-key helm-command-map (kbd "g") 'helm-grep-do-git-grep)
  (define-key helm-command-map (kbd "l") 'helm-locate)

  ;; Don't need helm-regexp -- rebind r to helm-resume
  (define-key helm-command-map (kbd "r") 'helm-resume)

  ;; Helm-specific files and buffer commands. These are basically strictly better
  ;; version of C-x C-f and C-x b.
  (define-key helm-command-map (kbd "f") 'helm-find-files)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (define-key helm-command-map (kbd "b") 'helm-mini)
  (global-set-key (kbd "C-x b") 'helm-mini)

  (global-set-key (kbd "M-x") 'helm-M-x)

  ;; General apropos always use helm-apropos
  (global-set-key (kbd "<f1> a") 'helm-apropos)
  (global-set-key (kbd "C-h a") 'helm-apropos)

  ;; Make opening directories behave like IDO mode: enter to go into next
  ;; directory.
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)

  (define-key helm-map (kbd "RET") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "<return>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-m") 'helm-execute-persistent-action)

  (define-key helm-map (kbd "C-z") 'helm-select-action)
  (define-key helm-map (kbd "<f1>") 'help-command))
(helm-keys-config)

(provide 'helm-mode-config)
