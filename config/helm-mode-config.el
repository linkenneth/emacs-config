;;;;;;;;;;;;;;;;;;;;;;
;; Helm Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

(require 'helm)
(require 'helm-config)

(helm-mode 1)

(helm-autoresize-mode t)

;; Fuzzy matching (like flex-matching in IDO)
(setq helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)

;; Behave a bit like IDO mode:
;; -- RET on directories continues search of it
;; -- backspace on beginning of directory goes back a whole directory

(setq original-helm-execute-persistent-action
      (symbol-function 'helm-execute-persistent-action))
(defadvice helm-execute-persistent-action
  (around helm-find-files-navigate-forward first (&rest args) activate)
  (if (file-directory-p (helm-get-selection))
      (apply original-helm-execute-persistent-action args)
    (helm-maybe-exit-minibuffer)))
(define-key helm-map (kbd "RET") 'helm-execute-persistent-action)
(define-key helm-map (kbd "<return>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-m") 'helm-execute-persistent-action)

(setq original-helm-ff-delete-char-backward
      (symbol-function 'helm-ff-delete-char-backward))
(defadvice helm-ff-delete-char-backward
    (around helm-ff-delete-char-backward first (&rest args) activate)
  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
      (helm-find-files-up-one-level 1)
    (apply original-helm-ff-delete-char-backward args)))
