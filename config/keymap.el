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
(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

;; scroll binding to SPC and DEL
(define-key evil-normal-state-map (kbd "DEL")
  (lambda () (interactive) (scroll-down)))
(define-key evil-normal-state-map " "
  (lambda () (interactive) (scroll-up)))
(define-key evil-motion-state-map (kbd "DEL")
  (lambda () (interactive) (scroll-down)))
(define-key evil-motion-state-map " "
  (lambda () (interactive) (scroll-up)))

;; Evil numbers
(define-key evil-normal-state-map (kbd "z u") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "z d") 'evil-numbers/dec-at-pt)

;; C-y for paste/yank like normal
(define-key evil-insert-state-map (kbd "C-y") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-y") 'evil-undefine)

;; C-e for end of line like normal
(define-key evil-insert-state-map (kbd "C-e") 'evil-undefine)
(define-key evil-motion-state-map (kbd "C-e") 'evil-undefine)

;; M-n and M-p act like C-n and C-p in command mode
(define-key evil-ex-completion-map (kbd "M-n") #'next-complete-history-element)
(define-key evil-ex-completion-map (kbd "M-p") #'previous-complete-history-element)

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
    (global-set-key (kbd "<f8>") 'rgrep))
