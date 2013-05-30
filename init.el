;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set load paths and environment variables ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/config")
(load "load-path-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous Convenience Setup ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "miscellaneous-config.el")
(setq custom-file "custom-config.el")
(load custom-file)
(load "marks-and-region-config.el")
(load "color-theme-config.el")
(load "backup-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up Evil Mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "evil-config.el")

;;;;;;;;;;;;;;;;;;;;
;; Setup IDO mode ;;
;;;;;;;;;;;;;;;;;;;;

(load "ido-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up YaSnippet ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "yasnippet-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up AutoComplete Mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "ac-config.el")

;;;;;;;;;;;;;;;;;;
;; Flymake Mode ;;
;;;;;;;;;;;;;;;;;;

(load "flymake-config.el")

;;;;;;;;;;;
;; CEDET ;;
;;;;;;;;;;;

(load "cedet-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp Integration into Editing ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "elisp-integration-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Various major modes ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Markup modes
(load "tex-config.el")
(load "org-config.el")
(load "text-mode-config.el")
(load "jade-stylus-config.el")
(load "sass-config.el")
(load "scss-config.el")

; C-family modes
(load "c-family-config.el")

; Python mode
(load "python-config.el")

; Cython mode
(load "cython-config.el")

; Ruby mode
(load "ruby-config.el")

; Rails config
(load "rails-config.el")

; Java mode
(load "java-config.el")

; Emacs Speaks Statistics (ESS mode)
(load "ess-config.el")

; Javascript mode
(load "js-config.el")

; nXhtml mode
(load "nxhtml-config.el")

; Scala mode
(load "scala-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Various OS-specific Configs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "mac-config.el")

;;;;;;;;;;;;;
;; Keymaps ;;
;;;;;;;;;;;;;

(load "keymap.el")
