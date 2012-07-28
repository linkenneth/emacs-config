;;;;;;;;;;;;;;;;
;; Org Config ;;
;;;;;;;;;;;;;;;;

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Agenda Files
(setq org-agenda-files (list "C:/Users/kenneth.lin/Org/want.org"
			     "C:/Users/kenneth.lin/Org/need.org"))
