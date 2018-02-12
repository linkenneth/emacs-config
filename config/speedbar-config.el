;;;;;;;;;;;;;;;;;;;;;
;; Speedbar Config ;;
;;;;;;;;;;;;;;;;;;;;;

;; A bar on the side of the frame to display file directory info, and
;; other info. sr-speedbar is the version that doesn't create an extra
;; frame.
(package-activate 'sr-speedbar)
(require 'sr-speedbar)

;; Don't use file images as icons, just text
(setq speedbar-use-images nil)

;; Skip the speedbar window when using C-x C-o (other-window)
(setq sr-speedbar-skip-other-window-p t)

;; TODO: set speedbar to the left on init
;; TODO: set speedbar to not affect default window splitting behavior (looks
;; like it makes it default horizontal split instead)
;; TODO: set speedbar to switch back to other window after hitting enter
;; TODO: fix some strange keybindings for evil and speedbar

;; Opens speedbar if not open and selects the speedbar window; see
;; keymap.el
(defun sr-speedbar-open-and-select-window ()
  (interactive)
  (if (not (sr-speedbar-exist-p))
      (sr-speedbar-toggle))
  (sr-speedbar-select-window))

(defun speedbar-keys-config ()
  (global-set-key (kbd "<f2>") 'sr-speedbar-open-and-select-window)
  (define-key speedbar-buffers-key-map " " 'scroll-up)
  (define-key speedbar-file-key-map " " 'scroll-up)
  (define-key speedbar-buffers-key-map (kbd "DEL") 'scroll-down)
  (define-key speedbar-file-key-map (kbd "DEL") 'scroll-down))
(speedbar-keys-config)

(provide 'speedbar-config)
