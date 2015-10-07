;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company and YCMD Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Company-mode (complete-any mode) is a middle-ware / frontend / a
;; few backends for autocompletion. Using it gives clean
;; autocompletion for a variety of modes. Most importantly, YCMD
;; (YouCompleteMeDaemon) is a server for autocompletion that works
;; with any language, with built-in semantic parsing for C++, Java,
;; Python, and Go. Company-mode supplies the frontend for YCMD
;; completion capabilities, and while company-mode completion by
;; itself is strong already, combined with YCMD makes it a full-scale
;; autocompletion machine.

;; If on OS X (corp or personal laptop). This setup requires a
;; specific installation of ycmd in a location I had determined.
(if (string-equal system-type "darwin")
    (progn
      (require 'company-ycmd)
      (set-variable 'ycmd-server-command '("python" "/usr/lib/ycmd/ycmd/__main__.py"))

      ;; Only need one character and 0 seconds (instant) to begin completion
      (setq company-idle-delay 0)
      (setq company-minimum-prefix-length 1)

      (company-ycmd-setup)
      (add-hook 'after-init-hook #'global-ycmd-mode)
      (add-hook 'after-init-hook #'global-company-mode)))
