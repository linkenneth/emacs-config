;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; js2-mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.babelrc\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js.snap\\'" . js2-mode))

;; Disables strict warnings on anonymous functions not returning a value
;; (ie. implicitly returning undefined).
(setq-default js2-strict-inconsistent-return-warning nil)

;; Assume these variables are always defined globally, and even if not, let more
;; advanced syntax checker check this.
;; TODO: set up test and browser environment to recognize these, or turn these
;; all off and hand over checking to flycheck
(setq js2-global-externs
      '("setTimeout" "setInterval" "clearTimeout" "clearInterval" "module"
        "expect" "describe" "test" "it" "jest" "beforeEach" "beforeAll"
        "global" "requestAnimationFrame" "require"))

(provide 'js2-mode-config)
