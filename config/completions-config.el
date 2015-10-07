;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AutoComplete Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'company-ycmd)
(set-variable 'ycmd-server-command '("python" "/usr/lib/ycmd/ycmd/__main__.py"))

;; Only need one character and 0 seconds (instant) to begin completion
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

(company-ycmd-setup)
(add-hook 'after-init-hook #'global-ycmd-mode)
(add-hook 'after-init-hook #'global-company-mode)
