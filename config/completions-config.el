;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AutoComplete Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories
;; 	     "~/.emacs.d/plugins/autocomplete/ac-dict")

;; ;; ; Make ac-common-setup put ac-source-yasnippet at beginning of ac-sources
;; ;; (defadvice ac-common-setup (after give-yasnippet-highest-priority activate)
;; ;;   (setq ac-sources (delq 'ac-source-yasnippet ac-sources))
;; ;;   (add-to-list 'ac-sources 'ac-source-yasnippet))

;; ; LaTeX mode
;; (defun ac-latex-mode-setup ()
;;   (require 'ac-math)
;;   (setq ac-sources (append '(ac-source-math-latex
;; 			     ac-source-latex-commands) ac-sources)))
;; (add-to-list 'ac-modes 'latex-mode)  ; make ac aware of latex-mode
;; (add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;; (ac-config-default)

(require 'company-ycmd)
(set-variable 'ycmd-server-command '("python" "/usr/lib/ycmd/ycmd/__main__.py"))

;; Only need one character and 0.2 seconds to begin completion
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)

(company-ycmd-setup)
(add-hook 'after-init-hook #'global-ycmd-mode)
(add-hook 'after-init-hook #'global-company-mode)
