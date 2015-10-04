;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Jade Mode (HTML Markup) Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'jade-mode "jade-mode.el" "Major mode for Jade." t)
(autoload 'stylus-mode "stylus-mode.el" "Major mode for Stylus." t)
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.styl\\'" . stylus-mode))
