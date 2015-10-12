;;;;;;;;;;;;;;;;;;;;;
;; Speedbar Config ;;
;;;;;;;;;;;;;;;;;;;;;

;; A bar on the side of the frame to display file directory info, and
;; other info. sr-speedbar is the version that doesn't create an extra
;; frame.
(require 'sr-speedbar)

;; Don't use file images as icons, just text
(setq speedbar-use-images nil)

;; Skip the speedbar window when using C-x C-o (other-window)
(setq sr-speedbar-skip-other-window-p t)

;; Opens speedbar if not open and selects the speedbar window; see
;; keymap.el
(defun sr-speedbar-open-and-select-window ()
  (interactive)
  (if (not (sr-speedbar-exist-p))
      (sr-speedbar-toggle))
  (sr-speedbar-select-window))
