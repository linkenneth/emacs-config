;;;;;;;;;;;;;;;;;;;;
;; Flymake Config ;;
;;;;;;;;;;;;;;;;;;;;

; consider changing to flycheck, a modern / updated service?

; On-the-fly syntax checking. Need to connect with external compilers
(require 'flymake)

; Change color of fonts
'(flymake-errline ((((class color)) (:underline "OrangeRed"))))
'(flymake-warnline ((((class color)) (:underline "yellow"))))

; Go to next error and display in minibuffer
(defun credmp/flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))

; see keymap.el
(defun flymake-goto-prev-error-and-display ()
  (interactive)
  (flymake-goto-prev-error)
  (credmp/flymake-display-err-minibuf))

; see keymap.el
(defun flymake-goto-next-error-and-display ()
  (interactive)
  (flymake-goto-next-error)
  (credmp/flymake-display-err-minibuf))

(flymake-mode-on)
