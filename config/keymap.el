;;;;;;;;;;;;
;; Keymap ;;
;;;;;;;;;;;;

;;;;; EVIL ;;;;;
;; Function to undefine Evil commands
(defun evil-undefine ()
 (interactive)
 (let (evil-mode-map-alist)
   (call-interactively (key-binding (this-command-keys)))))

;; 'jk' as ESC in Evil Insert Mode 
(define-key evil-insert-state-map "j" #'cofi/maybe-exit-jk)
(define-key evil-insert-state-map "k" #'cofi/maybe-exit-kj)

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

;; C-e for end of line like normal
(define-key evil-insert-state-map (kbd "C-e") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-e") 'evil-undefine)

;; C-a for beginning of line like normal
(define-key evil-insert-state-map (kbd "C-a") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-a") 'evil-undefine)

;; C-k for kill-line like normal
(define-key evil-insert-state-map (kbd "C-k") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-k") 'evil-undefine)

;; M-n and M-p act like C-n and C-p in command mode
(define-key evil-ex-completion-map (kbd "M-n") #'next-complete-history-element)
(define-key evil-ex-completion-map (kbd "M-p") #'previous-complete-history-element)

;; ;; C-a in evil-ex mode to act normally (ie. go to beginning of line)
;; (define-key evil-ex-completion-map (kbd "C-a") #'move-beginning-of-line)

;; \\ is same as C-6 (switch to last used buffer)
(define-key evil-motion-state-map (kbd "\\") 'evil-switch-to-windows-last-buffer)

;;;;; HELM MODE ;;;;;
(global-set-key (kbd "<f7>") 'helm-occur)
(global-set-key (kbd "<f8>") 'helm-find)
(global-set-key (kbd "C-x c r") 'helm-resume)
(global-set-key (kbd "<f1> a") 'helm-apropos)
(global-set-key (kbd "C-h a") 'helm-apropos)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;;;;; SPEEDBAR ;;;;;
(global-set-key (kbd "<f2>") 'sr-speedbar-open-and-select-window)
(define-key speedbar-buffers-key-map " " 'scroll-up)
(define-key speedbar-file-key-map " " 'scroll-up)
(define-key speedbar-buffers-key-map (kbd "DEL") 'scroll-down)
(define-key speedbar-file-key-map (kbd "DEL") 'scroll-down)

;;;;; FLYCHECK ;;;;;
(global-set-key (kbd "<f9>") 'flycheck-previous-error)
(global-set-key (kbd "<f10>") 'flycheck-next-error)
(global-set-key (kbd "<f11>") 'flycheck-toggle-error-list-or-mode-off)

;;;;; ELISP INTEGRATION ;;;;;
(global-set-key (kbd "<f12>") 'eval-and-replace-sexp-at-point)

;;;;; COMPANY-YCMD MODE ;;;;;
(define-key company-mode-map (kbd "TAB") 'company-indent-or-complete-common)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; switch between available backends
(global-set-key (kbd "C-;") 'company-other-backend)

;;;;; RUBY MODE ;;;;;
(defun ruby-keys-setup ()
  (define-key 'ruby-mode-map "\C-c\C-c" 'ruby-send-definition-and-go)
  (define-key 'ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent))
(add-hook 'ruby-mode-hook 'ruby-keys-setup)

;;;;; CamelCase / under_score shortcuts ;;;;;
(global-set-key (kbd "C-c C--") 'dasherize-word-at-point)
(global-set-key (kbd "C-c C-_") 'underscore-word-at-point)
(global-set-key (kbd "C-c C-;") 'camelcase-word-at-point)
(global-set-key (kbd "C-c C-:") 'colonize-word-at-point)

;;;;; FINDING STUFF ;;;;;
(if (s-suffix? "mtv.corp.google.com" system-name)
    (global-set-key (kbd "<f8>") 'csearch)
    (global-set-key (kbd "<f8>") 'helm-do-grep))

;;;;;;;;;;;;;;;
;; Helm Mode ;;
;;;;;;;;;;;;;;;

(define-key helm-comp-read-must-match-map (kbd "RET")
  'helm-execute-persistent-action)
(define-key helm-comp-read-must-match-map (kbd "<return>")
  'helm-execute-persistent-action)
(define-key helm-comp-read-must-match-map (kbd "C-m")
  'helm-execute-persistent-action)
