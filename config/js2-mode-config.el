;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; js2-mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.babelrc\\'" . js2-mode))

;; Disables strict warnings on anonymous functions not returning a value
;; (ie. implicitly returning undefined).
(setq-default js2-strict-inconsistent-return-warning nil)

(provide 'js2-mode-config)
