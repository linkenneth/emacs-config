;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Marks and Region Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Delete Selection mode -- used while in typing mode with selected text
(delete-selection-mode t)

;; C-u C-SPC or C-x C-SPC allows more C-SPC for cycling through mark ring
(setq set-mark-command-repeat-pop 1)

;; Set fill column to be almost 80
(setq-default fill-column 79)
