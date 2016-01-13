;;;;;;;;;;;;;;;;;;;;;
;; Mac OS X Config ;;
;;;;;;;;;;;;;;;;;;;;;

; Change meta to be command (default alt / option)
(setq mac-command-modifier 'meta)

;;;;; Aquamacs-specific config ;;;;;
(if (featurep 'aquamacs)
    (progn
      ; Disable Aquamacs Autoface Mode
      (aquamacs-autoface-mode 0)
      ; Stop annoying "Options have changed" prompt
      (setq aquamacs-save-options-on-quit nil)))
