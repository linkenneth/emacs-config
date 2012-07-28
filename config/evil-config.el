;;;;;;;;;;;;;;;;;
;; Evil Config ;;
;;;;;;;;;;;;;;;;;

(require 'evil)

; Evil-surround
(require 'surround)
(global-surround-mode 1)

; End of line visual selection to not include EOL character
(setq evil-want-visual-char-semi-exclusive t)

; jk as ESC
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
			   nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?k))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list evt))))))))

; C-w in insert mode as window map
(setq evil-want-C-w-delete nil)

; Cursor coloring
(setq evil-default-cursor '("green" t))
(setq evil-visual-state-cursor '("royalblue" t))
(setq evil-replace-state-cursor '("red" t))

; Initialize Evil
(evil-mode 1)
