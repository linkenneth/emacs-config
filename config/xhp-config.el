;;;;;;;;;;;;;;;;;;;;;
;; XHP Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;

(require 'xhp-mode)

(add-to-list 'auto-mode-alist '("\\.php" . xhp-mode))

; Facebook style PHP
(require 'cc-mode)
(add-to-list 'c-default-style '(xhp-mode . "fb"))
(c-add-style "fb" '("k&r"
                    (c-basic-offset . 2)
                    (c-hanging-braces-alist
                     (defun-open after)
                     (substatement-open after))
                    (c-offsets-alist
                     (arglist-close . 0)
                     (arglist-intro . +))))
(add-hook 'xhp-mode-hook
          (function (lambda ()
                      (c-set-style "fb")
                      (setq indent-tabs-mode nil))))
