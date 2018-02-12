;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: consider binding some semantic refactoring commands to Evil bindings
;; for ease of use
;; TODO: consider changing evil-shift-width on each major mode change to reflect
;; the specific mode indentation
;; TODO: make evil integration better on certain pages (mostly read-only pages)

;; Evil is a Vi emulation layer built on top of Emacs. The main benefit of Evil
;; is that it combines the best parts of Vi (notably faster movement and
;; processing of characters) and combines it with the best parts of Emacs
;; (notably more complex, semantic manipulation of code). Evil also has a
;; number of plugins to either make Emacs feel more like Vim, or allows me to
;; use the power of Emacs functions with Vi bindings.
(package-activate 'evil)
(require 'evil)

;; Evil-surround is a plugin that allows manipulating text within (), {}, "",
;; '' etc. in a Vi-esque way.
(package-activate 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Evil-numbers is a plugin that allows one to increment / decrement numbers
;; like in Vim. Very useful in combination with macros.
(package-activate 'evil-numbers)
(require 'evil-numbers)

;; End of line visual selection to not include EOL character
(setq evil-want-visual-char-semi-exclusive t)

;; C-w in insert mode as window map
(setq evil-want-C-w-delete nil)

;; Cursor coloring
(setq evil-default-cursor '("green" t))
(setq evil-normal-state-cursor '("green" t))
(setq evil-visual-state-cursor '("royalblue" t))
(setq evil-replace-state-cursor '("red" t))

(defun replace-2-chars-with-esc (start-char end-char)
  "Replaces a sequential entry of two characters with the ESC key."
  (let ((modified (buffer-modified-p)))
    (insert start-char)
    (let ((event (read-event
                   (format "Insert %c to exit insert state" end-char)
                   nil 0.5)))
      (cond
       ((null event) (message ""))
       ((and (integerp event) (char-equal event end-char))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list event))))))))

(evil-define-command maybe-exit-kj ()
  :repeat change
  (interactive)
  (replace-2-chars-with-esc ?k ?j))

(evil-define-command maybe-exit-jk ()
  :repeat change
  (interactive)
  (replace-2-chars-with-esc ?j ?k))

(defun evil-undefine ()
  "Undefines an Evil command."
 (interactive)
 (let (evil-mode-map-alist)
   (call-interactively (key-binding (this-command-keys)))))

(defun evil-keys-config ()
  ;; Rebind jk and kj to function as ESC in insert state.
  (define-key evil-insert-state-map "j" #'maybe-exit-jk)
  (define-key evil-insert-state-map "k" #'maybe-exit-kj)

  ;; Bind SPC and DEL to scroll keys.
  (define-key evil-motion-state-map " " 'scroll-up)
  (define-key evil-normal-state-map " " 'scroll-up)
  (define-key evil-motion-state-map (kbd "DEL") 'scroll-down)
  (define-key evil-normal-state-map (kbd "DEL") 'scroll-down)

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

  ;; M-. for go-to-definition like normal
  (define-key evil-motion-state-map (kbd "M-.") 'evil-undefine)
  (define-key evil-normal-state-map (kbd "M-.") 'evil-undefine)

  ;; M-n and M-p act like C-n and C-p in command mode
  (define-key evil-ex-completion-map (kbd "M-n") #'next-complete-history-element)
  (define-key evil-ex-completion-map (kbd "M-p") #'previous-complete-history-element)

  ;; C-a in evil-ex mode to act normally (ie. go to beginning of line)
  (define-key evil-ex-completion-map (kbd "C-a") #'move-beginning-of-line)

  ;; \ is same as C-6 (switch to last used buffer)
  (define-key evil-motion-state-map (kbd "\\") 'evil-switch-to-windows-last-buffer)

  ;; C-\ to switch to other window (same as C-x o)
  (define-key evil-motion-state-map (kbd "C-\\") 'other-window))

(evil-mode 1)
(evil-keys-config)

(provide 'evil-config)
