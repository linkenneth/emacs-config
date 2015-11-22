;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make emacs work with emacsclient and server files
(server-start)

;; My name and email
(setq user-full-name "Kenneth Lin"
      user-mail-address "linkenneth@live.com")

;; Set title to be name of document
(setq frame-title-format '("Emacs @ " system-name ": %b %+%+ %f"))

;; Icomplete mode - autocompletion in the minibuffer
(icomplete-mode t)

;; Disable tool bars
(tool-bar-mode -1)

;; Disable scroll bars
(scroll-bar-mode -1)

;; Global line number mode
(global-linum-mode t)

;; Inhibit startup screen
(setq inhibit-startup-screen t)

;; Undo-tree mode
(require 'undo-tree)
(undo-tree-mode 1)

;; Scrolling context lines
(setq next-screen-context-lines 5)

;; Make emacs use clipboard - cross-program copying
(setq x-select-enable-clipboard t)

;; Automatically reloads buffer on change in file
(global-auto-revert-mode t)

;; Don't ask for killing server buffers and processes (like shells)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(remove-hook 'kill-buffer-query-functions 'process-kill-buffer-query-function)

;; Disable version control through emacs (DO IT THROUGH COMMAND LINE!) (much much faster)
(setq vc-handled-backends ())

;; Indent spaces BY DEFAULT
(setq-default indent-tabs-mode nil)

;; Automatically insert ')' when '(' is inserted
(electric-pair-mode)

;; Automatically indents current line and previous line when RET is hit
(electric-indent-mode)

;; Uniquify same-name files
(toggle-uniquify-buffer-names)

;; If two files d/a1/b/c and d/a2/b/c, give filenames c|a1\b and c|a2\b
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix t)
