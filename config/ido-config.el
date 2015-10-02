;;;;;;;;;;;;;;;;
;; IDO Config ;;
;;;;;;;;;;;;;;;;

; Works with Icomplete mode to be able to switch to partially
; autocompleted buffers / files
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-file-extension-order '(".py" ".el" ".java" ".c" ".R" ".txt"))
(ido-mode 1)
