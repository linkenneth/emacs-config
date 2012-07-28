;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AutoComplete Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/plugins/autocomplete/ac-dict")

; Make ac-common-setup put ac-source-yasnippet at beginning of ac-sources
(defadvice ac-common-setup (after give-yasnippet-highest-priority activate)
  (setq ac-sources (delq 'ac-source-yasnippet ac-sources))
  (add-to-list 'ac-sources 'ac-source-yasnippet))

; LaTeX mode
(require 'ac-math)
(defun ac-latex-mode-setup ()
  (setq ac-sources (append '(ac-source-math-latex
			     ac-source-latex-commands) ac-sources)))
(add-to-list 'ac-modes 'latex-mode)  ; make ac aware of latex-mode
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

(ac-config-default)
