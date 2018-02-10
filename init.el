;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialization benchmarking ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Benchmark startup time! Comment while not testing.
;; (add-to-list 'load-path "~/.emacs.d/plugins/benchmark-init")
;; (require 'benchmark-init-loaddefs)
;; (benchmark-init/activate)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set load paths and environment variables ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/config")
(load "load-path-config.el")


;;;;;;;;;;;;;;;;;;;;
;; Profiles setup ;;
;;;;;;;;;;;;;;;;;;;;

(require 'profile-config)


;;;;;;;;;;;;;;;;;;;;;;;;
;; ELPA package setup ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(load "package-config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous setup ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(load "miscellaneous-config.el")
(setq custom-file "~/.emacs.d/config/custom-config.el")
(load custom-file)
(load "color-theme-config.el")
(load "backup-config.el")
(load "speedbar-config.el")
;; TODO figure out if Semantic's SymRef (C-c , g) conflicts with Grok
(load "semantic-config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up Evil Mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "evil-config.el")


;;;;;;;;;;;;;;;;;;;;
;; Setup IDO mode ;;
;;;;;;;;;;;;;;;;;;;;

;; Temporarily turn off IDO mode to try out Helm mode
;; (load "ido-config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up Helm Mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "helm-mode-config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up YaSnippet ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO until I can figure out how to make Yasnippet work well with
;; company, no more yasnippet (not that it's been useful).

;; (load "yasnippet-config.el")


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

;; TODO make this work anywhere in the sexp
(load "elisp-integration-config.el")


;;;;;;;;;;;;;;;;
;; CamelScore ;;
;;;;;;;;;;;;;;;;

;; TODO make the keybindings work in terminal
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

;; Emacs Lisp mode
(load "elisp-mode-config.el")

;; C-family modes
(load "c-family-config.el")

;; Python mode
(load "python-config.el")

;; Cython mode
(load "cython-config.el")

;; Ruby mode
(load "ruby-config.el")

;; Rails config
(load "rails-config.el")

;; Java mode
(load "java-config.el")

;; Emacs Speaks Statistics (ESS mode)
(load "ess-config.el")

;; Javascript mode
(load "js-config.el")

;; nXhtml mode
(load "nxhtml-config.el")

;; CSV mode
(load "csv-config.el")

;; Scala mode
(load "scala-config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Various OS-specific Configs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; OS X
(do-if-profile
 :mac-osx
 `(progn (load "osx-config.el")))

;; Corp desktop
(do-if-profile
 '(:linux :corp :desktop)
 `(progn (load "google-config.el")))

;;;;;;;;;;;;;
;; Keymaps ;;
;;;;;;;;;;;;;

(load "keymap.el")
