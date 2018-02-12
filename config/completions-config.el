;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company and YCMD Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; There are many libraries at work together here, so let's try to explain.


;; Company-mode (complete-any mode) is a completion middle-ware, a frontend, and
;; a few backends sources. Using it gives clean autocompletion for a variety of
;; modes. However, it itself comes with only a few limited backends.

;; YCMD (YouCompleteMeDaemon) is a server for autocompletion that works with any
;; language, with built-in semantic parsing for C++, Java, JavaScript, Python,
;; and Go. YCMD is also used for Flycheck syntax checking (see flycheck-config).

;; Company-mode supplies the frontend for completions, while YCMD's superior
;; parsing is used as a backend to company-mode. While company-mode completion
;; is strong by itself already, it is really YCMD that makes completion easy in
;; a large number of different scenarios.

;; If on OS X (corp or personal laptop). This setup requires a specific
;; installation of ycmd in a location I had determined.
(do-if-profile
 :mac-osx
 `(progn
   (package-activate 'company-ycmd)
   (require 'company-ycmd)
   (set-variable 'ycmd-server-command
                 '("python" "/usr/local/lib/ycmd/ycmd/__main__.py"))
   (set-variable 'ycmd-server-args
                 '("--log=warning" "--keep_logfile"
                   "--idle_suicide_seconds=108000"))

   (company-ycmd-setup)
   (add-hook 'after-init-hook 'global-company-mode)
   (add-hook 'prog-mode-hook 'ycmd-mode)))

;; TODO: can we merge backend lists?
;; TODO: can we add some language-aware lists?
;; TODO: remove completion in shell or at least make it so it doesn't interfere
;; with RET key run command
;; TODO: enable more backends? optimize speed?
;; TODO: remove unnecessary backends in different modes / buffers?

(eval-after-load 'company-ycmd
  (progn
    ;; Only need 2 characters and 0.1 seconds (near-instant) to begin completion
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 2)

    ;; Allow other user input that aren't completion candidates. The default is,
    ;; if you do any completion action (ie. hit TAB o RET), matching is
    ;; required. This disables it and makes auto-completion completely
    ;; non-intrusive.
    (setq company-require-match nil)))

(provide 'completions-config)
