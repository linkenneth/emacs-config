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

(add-to-list 'helm-boring-file-regexp-list "\\.$")
(add-to-list 'helm-boring-file-regexp-list "\\..$")

;; Behave a bit like IDO mode:
;; -- RET on directories continues search of it
;; -- backspace on beginning of directory goes back a whole directory

;; (defadvice helm-execute-persistent-action
;;   (around fu/helm-find-files-navigate-forward first (&rest args) activate)
;;   (if (file-directory-p (helm-get-selection))
;;       (apply helm-execute-persistent-action args)
;;     (helm-maybe-exit-minibuffer)))
;; ;; (advice-add 'helm-execute-persistent-action :around #'fu/helm-find-files-navigate-forward)
;; (define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)

;; (defun fu/helm-find-files-navigate-back (orig-fun &rest args)
;;   (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
;;       (helm-find-files-up-one-level 1)
;;     (apply orig-fun args)))
;; (advice-add 'helm-ff-delete-char-backward :around #'fu/helm-find-files-navigate-back)
