;;;;;;;;;;;;;;;;;;;;;;
;; Helm Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

(require 'helm)
(require 'helm-config)
(helm-autoresize-mode t)

(setq helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)
(helm-mode 1)
