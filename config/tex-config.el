;;;;;;;;;;;;;;;
;; TeX Setup ;;
;;;;;;;;;;;;;;;

(if (string-equal system-type "darwin")
  (progn
    (load "auctex.el" nil t t)
    (require  'tex-mik)

    (setq reftex-plug-into-AUCTeX t)

    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)

    (add-hook 'LaTeX-mode-hook 'visual-line-mode)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

    ; Fix preview-latex
    (setq preview-gs-options '("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4"))

    ; Easier TeX debugging
    (setq TeX-debug-bad-boxes t)
    (setq TeX-debug-warnings t)))
