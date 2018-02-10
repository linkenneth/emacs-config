;;;;;;;;;;;;;;;;;
;; Evil Config ;;
;;;;;;;;;;;;;;;;;

;; Base vim emulation layer on Emacs
(package-activate 'evil)
(require 'evil)

;; Evil-surround (vim controls for 's' commands)
(package-activate 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Evil-numbers (increment / decrement numbers like in vim)
(package-activate 'evil-numbers)
(require 'evil-numbers)

;; Evil text object between (vim controls for 'i', 'a' commands)
;; (require 'evil-textobj-between)

;; End of line visual selection to not include EOL character
(setq evil-want-visual-char-semi-exclusive t)

;; 'jk' as ESC;; see keymap.el
(evil-define-command maybe-exit-jk ()
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

;; 'kj' as ESC;; see keymap.el
(evil-define-command maybe-exit-kj ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
			   nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list evt))))))))

;; C-w in insert mode as window map
(setq evil-want-C-w-delete nil)

;; Cursor coloring
(setq evil-default-cursor '("green" t))
(setq evil-normal-state-cursor '("green" t))
(setq evil-visual-state-cursor '("royalblue" t))
(setq evil-replace-state-cursor '("red" t))


(evil-define-command evil-switch-to-last-buffer-other-window ()
  "Switch to last open buffer in other window.

See evil-switch-to-windows-last-buffer for more info. This
function does the same thing in the other window."
  :repeat nil
  (let ((previous-place (evil-alternate-buffer)))
    (when previous-place
      (other-window 1)
      (switch-to-buffer (car previous-place))
      (goto-char (car (last previous-place))))))

;; Initialize Evil
(evil-mode 1)
