;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company-mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; There are many libraries at work together here, so let's try to explain.

;; Company-mode (complete-any mode) is a completion middle-ware, a frontend, and
;; a few backends sources. Using it gives clean autocompletion for a variety of
;; modes. However, it itself comes with only a few limited backends.

;; YCMD (YouCompleteMeDaemon) is a server for autocompletion that works with any
;; language, with built-in semantic parsing for C++, Java, JavaScript, Python,
;; and Go. These language-specific plugins themselves use a number of external,
;; language-specific parsers (like Jedi and Tern), so in a way YCMD is also a
;; completion middle-ware. YCMD is also used for Flycheck syntax checking (see
;; flycheck-config).

;; Company-mode supplies the frontend for completions, while YCMD's superior
;; parsing is used as a backend to company-mode. While company-mode completion
;; is strong by itself already, it is really YCMD that makes completion easy in
;; a large number of different scenarios.

(require 'package)

(package-activate 'company)
(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

;; ;; If on OS X (corp or personal laptop). This setup requires a specific
;; ;; installation of ycmd in a location I had determined.
;; (do-if-profile
;;  :mac-osx
;;  `(progn
;;    (package-activate 'company-ycmd)
;;    (require 'company-ycmd)
;;    (set-variable 'ycmd-server-command
;;                  '("python" "/usr/local/lib/ycmd/ycmd/__main__.py"))
;;    (set-variable 'ycmd-server-args
;;                  '("--log=warning" "--keep_logfile"
;;                    "--idle_suicide_seconds=108000"))

;;    (company-ycmd-setup)
;;    (add-hook 'after-init-hook 'global-company-mode)
;;    (add-hook 'prog-mode-hook 'ycmd-mode)))
;; TODO: consider carefully whether we even need YCMD? YCMD mainly provides an
;; non-semantic identifier engine (which is covered by company and semantic
;; modes already) as well as an API for other semantic engines (most of which
;; have native company modes anyways). Flycheck also uses YCMD but flycheck has
;; much more extensive lint-only analyzers as well. What is the purpose, then,
;; of YCMD, except as another layer of middle-ware?

;; TODO: can we merge backend lists?
;; TODO: can we add some language-aware lists?
;; TODO: remove completion in shell or at least make it so it doesn't interfere
;; with RET key run command
;; TODO: enable more backends? optimize speed?
;; TODO: remove unnecessary backends in different modes / buffers?

(eval-after-load 'company
  (progn
    ;; Only need 2 characters and 0.1 seconds (near-instant) to begin completion
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 2)

    ;; Allow other user input that aren't completion candidates. The default is,
    ;; if you do any completion action (ie. hit TAB o RET), matching is
    ;; required. This disables it and makes auto-completion completely
    ;; non-intrusive.
    (setq company-require-match nil)))

(provide 'company-config)
