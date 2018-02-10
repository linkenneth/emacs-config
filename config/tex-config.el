;;;;;;;;;;;;;;;;;;;;;;;
;; TeX configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: I suspect that all of this is broken, what with the new ELPA package
;; configuration amongst other things. Consider fixing this if I ever need to
;; do extensive work in TeX again.

; OS X setup
(defun osx-tex-mode-setup ()
  (load "auctex.el" nil t t)
  (require 'tex-mik)

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

(do-if-profile
 :mac-osx
 `(add-hook 'LaTeX-mode-hook 'osx-tex-mode-setup))

(provide 'tex-config)
