;;;;;;;;;;;;
;; Keymap ;;
;;;;;;;;;;;;

;;;;; EVIL ;;;;;
; jk as ESC in Evil Insert Mode 
(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

; scroll binding to SPC and DEL
(define-key evil-normal-state-map (kbd "DEL") (lambda ()
                     (interactive)
		     (scroll-down)
                     ))
(define-key evil-normal-state-map " " (lambda ()
                     (interactive)
		     (scroll-up)
                     ))
(define-key evil-motion-state-map (kbd "DEL") (lambda ()
                     (interactive)
		     (scroll-down)
                     ))
(define-key evil-motion-state-map " " (lambda ()
                     (interactive)
		     (scroll-up)
                     ))

; Function to undefine Evil commands
(defun evil-undefine ()
 (interactive)
 (let (evil-mode-map-alist)
   (call-interactively (key-binding (this-command-keys)))))

; C-y for paste/yank like normal
(define-key evil-insert-state-map "\C-y" 'evil-undefine)
(define-key evil-motion-state-map "\C-y" 'evil-undefine)

; C-e for end of line like normal
(define-key evil-insert-state-map "\C-e" 'evil-undefine)
(define-key evil-motion-state-map "\C-e" 'evil-undefine)

;;;;; FLYMAKE ;;;;;
(defun flymake-goto-prev-error-and-display ()
  (interactive)
  (flymake-goto-prev-error)
  (credmp/flymake-display-err-minibuf))
(defun flymake-goto-next-error-and-display ()
  (interactive)
  (flymake-goto-next-error)
  (credmp/flymake-display-err-minibuf))
(global-set-key (kbd "<f9>") 'flymake-goto-prev-error-and-display)
(global-set-key (kbd "<f10>") 'flymake-goto-next-error-and-display)

;;;;; ELISP INTEGRATION ;;;;;
(global-set-key (kbd "<f12>") 'eval-and-replace-sexp-at-point)

;;;;; RUBY MODE ;;;;;
(defun ruby-keys-setup ()
  (define-key ruby-mode-map "\C-c\C-c" 'ruby-send-definition-and-go)
  (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent))
(add-hook 'ruby-mode-hook 'ruby-keys-setup)
