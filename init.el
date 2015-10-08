;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set load paths and environment variables ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Benchmark startup time! Comment while not testing.
(add-to-list 'load-path "~/.emacs.d/plugins/benchmark-init")
(require 'benchmark-init-loaddefs)
(benchmark-init/activate)

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
;; Setting up Company-YCMD Mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "completions-config.el")

;;;;;;;;;;;;;;;;;;;
;; Flycheck Mode ;;
;;;;;;;;;;;;;;;;;;;

(load "flycheck-config.el")

;;;;;;;;;;;
;; CEDET ;;
;;;;;;;;;;;

(load "cedet-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp Integration into Editing ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "elisp-integration-config.el")

;;;;;;;;;;;;;;;;
;; CamelScore ;;
;;;;;;;;;;;;;;;;

(load "camel-score-config.el")

;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;

(load "tramp-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Various major modes ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Markup modes
(load "tex-config.el")
(load "text-mode-config.el")
(load "jade-stylus-config.el")
(load "haml-config.el")
(load "yaml-config.el")
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

; CSV mode
(load "csv-config.el")

; Scala mode
(load "scala-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Various OS-specific Configs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; OS X
(if (string-equal system-type "darwin")
    (load "osx-config.el"))

; Corp desktop
(if (s-suffix? "mtv.corp.google.com" system-name)
    (load "google-config.el"))

;;;;;;;;;;;;;
;; Keymaps ;;
;;;;;;;;;;;;;

(load "keymap.el")
