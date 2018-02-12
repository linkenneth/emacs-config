;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'profile-config)

(setq user-full-name "Kenneth Lin"
      user-mail-address "linkenneth@live.com")

;; Set title to be name of document
(setq frame-title-format '("Emacs @ " system-name ": %b %+%+ %f"))

;; Undo-tree mode
;; TODO: appears to be a dependency. Can we call this elsewhere?
;(require 'undo-tree)
;(undo-tree-mode 1)

(setq inhibit-startup-screen t)
(setq-default fill-column 80)
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width. 90))

;; Scrolling context lines
(setq next-screen-context-lines 5)

;; Make emacs use clipboard for cross-program copying
(setq x-select-enable-clipboard t)

;; Don't ask for killing server buffers and processes (like shells)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(remove-hook 'kill-buffer-query-functions 'process-kill-buffer-query-function)

;; Disable version control through emacs. It's much easier to use it through
;; any command line, and version control for emacs with big projects is also
;; impossible to work with.
(setq vc-handled-backends ())

;; Delete selection when typing with text selected
(delete-selection-mode 1)

;; Indent spaces BY DEFAULT
(setq-default indent-tabs-mode nil)

;; Icomplete mode - autocompletion in the minibuffer
(icomplete-mode 1)

;; Disable tool bars
(tool-bar-mode -1)

;; Disable scroll bars
(scroll-bar-mode -1)

;; Global line number mode
(global-linum-mode 1)

;; Automatically reloads buffer on changes to a file
(global-auto-revert-mode 1)

;; Automatically indents current line and previous line when RET is hit
(electric-indent-mode)

;; Automatically insert ')' when '(' is inserted
(electric-pair-mode)

;; Uniquify same-name files. If two files d/a1/b/c and d/a2/b/c, give filenames
;; c|a1\b and c|a2\b.
(toggle-uniquify-buffer-names)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix t)

;; Allow use of mouse in terminal (X window)
(do-if-profile
 :terminal
 `(xterm-mouse-mode 1))

;; Allows cursors to follow along with compilation logs.
(setq compilation-scroll-output t)

(provide 'miscellaneous-config)
