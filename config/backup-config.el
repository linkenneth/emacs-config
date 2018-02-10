;;;;;;;;;;;;;;;;;;;
;; Backup Config ;;
;;;;;;;;;;;;;;;;;;;

(setq backup-directory-alist `(("" . "~/.saves/"))
      version-control t
      delete-old-versions t
      backup-by-copying t)

(provide 'backup-config)
