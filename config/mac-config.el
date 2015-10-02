;;;;;;;;;;;;;;;;;;;;;
;; Mac OS X Config ;;
;;;;;;;;;;;;;;;;;;;;;

; TODO check using Aquamacs on Mac

(setq mac-command-modifier 'meta)

; Disable Aquamacs Autoface Mode if Aquamacs
(if (fboundp 'aquamacs-autoface-mode)
    (aquamacs-autoface-mode 0))

; Stop annoying "Options have changed" prompt
(setq aquamacs-save-options-on-quit nil)

; Sets default font on OS X
; TODO probably check font exists
(add-to-list 'default-frame-alist '(font . "Monaco"))
