;;;;;;;;;;;;
;; Keymap ;;
;;;;;;;;;;;;

;; It's much easier to put all keybindings in one place at the end of
;; initialization so that
;; 1) it doesn't interfere with certain modes setting keys
;; 2) it's easier to find keys
;;
;; Unfortunately, corp keybindings should not be shared so they exist in a
;; separate configuration not tracked by git.

;; TODO organize this a bit and comment a bit more.


;;;;;;;;;;;;;;;
;; Evil Mode ;;
;;;;;;;;;;;;;;;

;; Function to undefine Evil commands
(defun evil-undefine ()
 (interactive)
 (let (evil-mode-map-alist)
   (call-interactively (key-binding (this-command-keys)))))

;; j k / k j as ESC Evil Insert Mode
(define-key evil-insert-state-map "j" #'maybe-exit-jk)
(define-key evil-insert-state-map "k" #'maybe-exit-kj)

;; scroll binding to SPC and DEL
(define-key evil-normal-state-map (kbd "DEL") 'scroll-down)
(define-key evil-normal-state-map " " 'scroll-up)
(define-key evil-motion-state-map (kbd "DEL") 'scroll-down)
(define-key evil-motion-state-map " " 'scroll-up)

;; Evil numbers
(define-key evil-normal-state-map (kbd "z u") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "z d") 'evil-numbers/dec-at-pt)

;; C-y for paste/yank like normal
(define-key evil-insert-state-map (kbd "C-y") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-y") 'evil-undefine)

;; C-a for beginning of line like normal
(define-key evil-insert-state-map (kbd "C-a") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-a") 'evil-undefine)

;; C-e for end of line like normal
(define-key evil-insert-state-map (kbd "C-e") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-e") 'evil-undefine)

;; C-k for kill-line like normal
(define-key evil-insert-state-map (kbd "C-k") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-k") 'evil-undefine)

;; M-n and M-p act like C-n and C-p in command mode
(define-key evil-ex-completion-map (kbd "M-n") #'next-complete-history-element)
(define-key evil-ex-completion-map (kbd "M-p") #'previous-complete-history-element)

;; C-a in evil-ex mode to act normally (ie. go to beginning of line)
(define-key evil-ex-completion-map (kbd "C-a") #'move-beginning-of-line)

;; \ to switch to other window (same as C-x o)
(define-key evil-motion-state-map (kbd "\\") 'other-window)

;; C-\ is same as C-6 (switch to last used buffer)
(define-key evil-motion-state-map (kbd "C-\\") 'evil-switch-to-windows-last-buffer)


;;;;;;;;;;;;;;;
;; Helm Mode ;;
;;;;;;;;;;;;;;;

;; Use g h as alternate helm-command-prefix
(define-key evil-normal-state-map (kbd "g h") 'helm-command-prefix)
(define-key evil-motion-state-map (kbd "g h") 'helm-command-prefix)

;; g h o as helm-occur (highlights all occurences in file)
(define-key helm-command-map (kbd "o") 'helm-occur)
(define-key helm-command-map (kbd "O") 'helm-occur-from-isearch)

(global-set-key (kbd "<f8>") 'helm-do-grep)

;; Don't need helm-regexp -- rebind r to helm-resume
(define-key helm-command-map (kbd "r") 'helm-resume)

;; Helm-specific files and buffer commands. These are basically strictly better
;; version of C-x C-f and C-x b.
(define-key helm-command-map (kbd "f") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-command-map (kbd "b") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-mini)

;; General apropos always use helm-apropos
(global-set-key (kbd "<f1> a") 'helm-apropos)
(global-set-key (kbd "C-h a") 'helm-apropos)

;; Make opening directories behave like IDO mode: enter to go into next
;; directory.
(define-key helm-map (kbd "<tab>")
  'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i")  ;; Terminal-TAB
  'helm-execute-persistent-action)

(define-key helm-map (kbd "RET")
  'helm-execute-persistent-action)
(define-key helm-map (kbd "<return>")
  'helm-execute-persistent-action)
(define-key helm-map (kbd "C-m")  ;; Terminal-RET
  'helm-execute-persistent-action)

(define-key helm-map (kbd "C-z")
  'helm-select-action)  ;; list possible actions using C-z

;; Need to specifically define these keys here because generically using
;; helm-mode does something strange with comp-read. It rebinds another key-map
;; on top of helm-map, and this key-map doesn't have C-m bindings (so terminal
;; RET does not work).
(define-key helm-comp-read-must-match-map (kbd "RET")
  'helm-execute-persistent-action)
(define-key helm-comp-read-must-match-map (kbd "<return>")
  'helm-execute-persistent-action)
(define-key helm-comp-read-must-match-map (kbd "C-m")  ;; Terminal-RET
  'helm-execute-persistent-action)


;;;;;;;;;;;;;;
;; Speedbar ;;
;;;;;;;;;;;;;;

(global-set-key (kbd "<f2>") 'sr-speedbar-open-and-select-window)
(define-key speedbar-buffers-key-map " " 'scroll-up)
(define-key speedbar-file-key-map " " 'scroll-up)
(define-key speedbar-buffers-key-map (kbd "DEL") 'scroll-down)
(define-key speedbar-file-key-map (kbd "DEL") 'scroll-down)


;;;;;;;;;;;;;;
;; Flycheck ;;
;;;;;;;;;;;;;;

(global-set-key (kbd "<f9>") 'flycheck-previous-error)
(global-set-key (kbd "<f10>") 'flycheck-next-error)
(global-set-key (kbd "<f11>") 'flycheck-toggle-error-list-or-mode-off)


;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp Integration ;;
;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "<f12>") 'eval-and-replace-sexp-at-point)


;;;;;;;;;;;;;;;;;;;;;;;
;; Company-YCMD Mode ;;
;;;;;;;;;;;;;;;;;;;;;;;

(define-key company-mode-map (kbd "TAB") 'company-indent-or-complete-common)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; switch between available backends
;; TODO C-; doesn't work well in terminal
(global-set-key (kbd "C-;") 'company-other-backend)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CamelCase or snake_case ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO C-; doesn't work well in terminal
(global-set-key (kbd "C-c C--") 'dasherize-word-at-point)
(global-set-key (kbd "C-c C-_") 'underscore-word-at-point)
(global-set-key (kbd "C-c C-;") 'camelcase-word-at-point)
(global-set-key (kbd "C-c C-:") 'colonize-word-at-point)


;;;;;;;;;;;;;;;
;; Ruby Mode ;;
;;;;;;;;;;;;;;;

(defun ruby-keys-setup ()
  (define-key 'ruby-mode-map "\C-c\C-c" 'ruby-send-definition-and-go)
  (define-key 'ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent))
(add-hook 'ruby-mode-hook 'ruby-keys-setup)
