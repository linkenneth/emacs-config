;;;;;;;;;;;;;;;;
;; IDO Config ;;
;;;;;;;;;;;;;;;;

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-file-extension-order '(".py" ".el" ".java" ".c" ".R" ".txt"))
(ido-mode 1)