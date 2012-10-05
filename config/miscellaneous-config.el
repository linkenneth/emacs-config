;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

; Make emacs work with emacsclient and server files
(server-start)

; My name and email
(setq user-full-name "Kenneth Lin"
      user-mail-address "linkenneth@live.com")

; Set title to be name of document
(setq frame-title-format '("Emacs @ " system-name ": %b %+%+ %f"))

; Icomplete mode
(icomplete-mode t)

; Disable tool bars
(tool-bar-mode -1)

; Disable scroll bars
(scroll-bar-mode -1)

; Global line number mode
(global-linum-mode t)

; Inhibit startup screen
(setq inhibit-startup-screen t)

; Undo-tree mode
(require 'undo-tree)
(undo-tree-mode 1)

; Scrolling context lines
(setq next-screen-context-lines 5)

; Make emacs use clipboard - cross-program copying
(setq x-select-enable-clipboard t)

; Automatically reloads buffer on change in file
(global-auto-revert-mode t)

; Don't ask for killing server buffers and processes (like shells)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(remove-hook 'kill-buffer-query-functions 'process-kill-buffer-query-function)

; Enable a backtrace when a problem occurs
(setq debug-on-error t)

