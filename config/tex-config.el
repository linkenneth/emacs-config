;;;;;;;;;;;;;;;
;; TeX Setup ;;
;;;;;;;;;;;;;;;

; OS X setup
(defun osx-tex-mode-setup ()
  (load "auctex.el" nil t t)
  (require  'tex-mik)

  (setq reftex-plug-into-AUCTeX t)

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (visual-line-mode)
  (LaTeX-math-mode)
  (turn-on-reftex)

  ; Fix preview-latex
  (setq preview-gs-options '("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4"))

  ; Easier TeX debugging
  (setq TeX-debug-bad-boxes t)
  (setq TeX-debug-warnings t))

(if (string-equal system-type "darwin")
    (add-hook 'LaTeX-mode-hook 'osx-tex-mode-setup))
