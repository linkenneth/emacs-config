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
(do-if-profile
 :mac-osx
 `(progn
   (package-activate 'company-ycmd)
   (require 'company-ycmd)
   (set-variable 'ycmd-server-command '("python" "/usr/local/lib/ycmd/ycmd/__main__.py"))

   (company-ycmd-setup)
   (add-hook 'after-init-hook 'global-company-mode)
   (add-hook 'prog-mode-hook 'ycmd-mode)))

;; TODO: can we merge backend lists?
;; TODO: can we add some language-aware lists?

(eval-after-load 'company-ycmd
  (progn
    ;; Only need one character and 0 seconds (instant) to begin completion
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 1)

    ;; Allow other user input that aren't completion candidates. The
    ;; default is, if you do any completion action (ie. hit TAB o
    ;; RET), matching is required. This disables it and makes
    ;; auto-completion completely non-intrusive.
    (setq company-require-match nil)))

(provide 'completions-config)
