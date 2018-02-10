;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set load paths and environment variables ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/config")
(load "load-path-config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Profile configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'profile-config)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package-config)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialization benchmarking ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Benchmark startup time! Comment out while not testing.
;;
;; NOTE: benchmark-init relies on its package being loaded, which means that
;; benchmark won't track the amount of time spent in package-loading itself.
(require 'benchmark-config)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file "~/.emacs.d/config/custom-config.el")
(load custom-file)

(require 'miscellaneous-config)
(require 'color-theme-config)
(require 'backup-config)

(require 'speedbar-config)
;; TODO figure out if Semantic's SymRef (C-c , g) conflicts with Grok
(require 'semantic-config)


;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(require 'evil-config)


;;;;;;;;;;;;;;;;;;;;
;; Setup IDO mode ;;
;;;;;;;;;;;;;;;;;;;;

;; Temporarily turn off IDO mode to try out Helm mode
;; (load "ido-config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'helm-mode-config)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up YaSnippet ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO until I can figure out how to make Yasnippet work well with
;; company, no more yasnippet (not that it's been useful).

;; (load "yasnippet-config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up Company-YCMD Mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'completions-config)


;;;;;;;;;;;;;;;;;;;
;; Flycheck Mode ;;
;;;;;;;;;;;;;;;;;;;

(require 'flycheck-config)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp Integration into Editing ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO make this work anywhere in the sexp
(require 'elisp-integration-config)


;;;;;;;;;;;;;;;;
;; CamelScore ;;
;;;;;;;;;;;;;;;;

;; TODO make the keybindings work in terminal
(load "camel-score-config.el")


;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;

(require 'tramp-config)


;;;;;;;;;;;;;;;;;;;;;;;;;
;; Various major modes ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Markup modes
;; (require 'tex-config)
(require 'text-mode-config)
;; (require 'jade-mode-config)
;; (require 'stylus-mode-config)
;; (require 'haml-mode-config)
;; (require 'yaml-mode-config)
;; (require 'sass-mode-config)
;; (require 'scss-mode-config)

;; Emacs Lisp mode
(require 'elisp-mode-config)

;; C mode
(require 'c-mode-config)

;; Python mode
(require 'python-mode-config)

;; Cython mode
(require 'cython-mode-config)

;; Ruby mode
(load "ruby-config.el")

;; Rails config
(load "rails-config.el")

;; Java mode
(load "java-config.el")

;; Emacs Speaks Statistics (ESS mode)
(load "ess-config.el")

;; Javascript mode
(require 'js-mode-config)

;; CSV mode
(require 'csv-mode-config)

;; Scala mode
(require 'scala-mode-config)


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


;;;;;;;;;;;;;;;;;;
;; Emacs server ;;
;;;;;;;;;;;;;;;;;;

;; Run emacs as a server so that startup cost is paid once per session.
;;
;; NOTE: (server-start) should reside at the bottom of the configuration so
;; that any misconfiguration should not be starting in server mode.
;; TODO: attempt to enable server mode only when not already up?
(server-start)
