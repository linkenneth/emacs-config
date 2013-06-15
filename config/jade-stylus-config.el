;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Jade Mode (HTML Markup) Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'jade-mode)
(require 'stylus-mode)
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.styl\\'" . stylus-mode))
