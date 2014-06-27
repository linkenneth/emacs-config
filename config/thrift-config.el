;;;;;;;;;;;;;;;;;;;;;;;;
;; Thrift Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(require 'thrift-mode)
(add-to-list 'auto-mode-alist '("\\.thrift$" . thrift-mode))

(add-hook 'thrift-mode-hook (lambda ()
			    (setq indent-tabs-mode nil)
			    ))
