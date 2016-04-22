;;;;;;;;;;;;;;;;;;;;;;
;; Helm Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

(require 'helm)
(require 'helm-config)

;; Initialize Helm mode. This is for incremental narrowing of M-x, C-x C-f,
;; etc., and applies to all Emacs functions that use `completing-read'.
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
