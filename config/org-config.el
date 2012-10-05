;;;;;;;;;;;;;;;;
;; Org Config ;;
;;;;;;;;;;;;;;;;

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Agenda Files
(setq org-agenda-files (list "/media/Everything/Users/kenneth.lin/Org/want.org"
			     "/media/Everything/Users/kenneth.lin/Org/need.org"))
