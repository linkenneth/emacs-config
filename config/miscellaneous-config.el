;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

; Make emacs work with emacsclient and server files
(server-start)

; Some basic string manipulation, for rest of the ocnfig
(require 's)

; My name and email
(setq user-full-name "Kenneth Lin"
      user-mail-address "linkenneth@live.com")

; Set title to be name of document
(setq frame-title-format '("Emacs @ " system-name ": %b %+%+ %f"))

; Icomplete mode - autocompletion in the minibuffer
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

; Disable version control through emacs (DO IT THROUGH COMMAND LINE!) (much much faster)
(setq vc-handled-backends ())

; Indent spaces BY DEFAULT
(setq-default indent-tabs-mode nil)
