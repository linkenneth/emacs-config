;;;;;;;;;;;;;;;;;;
;; CEDET Config ;;
;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")

; EDE mode
(global-ede-mode t)

; Other semantics stuff loading?
(semantic-load-enable-excessive-code-helpers)

; Get rid of annoying headline bar
(global-semantic-stickyfunc-mode 0)

; Adding system include paths for semantic
(semantic-add-system-include (jde-get-jdk-dir) 'jde-mode)

