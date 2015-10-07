;;;;;;;;;;;;
;; Keymap ;;
;;;;;;;;;;;;

;;;;; EVIL ;;;;;
; Function to undefine Evil commands
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

;;;;; FLYMAKE ;;;;;
(global-set-key (kbd "<f9>") 'flymake-goto-prev-error-and-display)
(global-set-key (kbd "<f10>") 'flymake-goto-next-error-and-display)

;;;;; ELISP INTEGRATION ;;;;;
(global-set-key (kbd "<f12>") 'eval-and-replace-sexp-at-point)

;;;;; COMPANY-YCMD MODE ;;;;;
(define-key company-mode-map (kbd "TAB") 'company-indent-or-complete-common)

;;;;; RUBY MODE ;;;;;
(defun ruby-keys-setup ()
  (define-key ruby-mode-map "\C-c\C-c" 'ruby-send-definition-and-go)
  (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent))

(add-hook 'ruby-mode-hook 'ruby-keys-setup)

;;;;; CamelCase / under_score shortcuts ;;;;;
(global-set-key (kbd "C-c C--") 'dasherize-word-at-point)
(global-set-key (kbd "C-c C-_") 'underscore-word-at-point)
(global-set-key (kbd "C-c C-;") 'camelcase-word-at-point)
(global-set-key (kbd "C-c C-:") 'colonize-word-at-point)

;;;;; FINDING STUFF ;;;;;
; available with 'gf' in evil-mode
;; (global-set-key (kbd "C-x M-f") 'ffap)
(global-set-key (kbd "<f8>") 'rgrep)
