;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set load paths and environment variables ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/config")
(require 'load-path-config)
(require 'environment-config)

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

;; TODO: consider byte-compiling init / configuration files / non-ELPA plugins

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file "~/.emacs.d/config/custom-config.el")
(load custom-file)

(require 'miscellaneous-config)
(require 'color-theme-config)
(require 'backup-config)

(require 'speedbar-config)
;; TODO: figure out if Semantic's SymRef (C-c , g) conflicts with Grok
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YASnippet configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'yasnippet-config)

;;;;;;;;;;;;;;;;;;
;; company-mode ;;
;;;;;;;;;;;;;;;;;;

(require 'company-config)

;;;;;;;;;;;;;;;;;;;
;; flycheck-mode ;;
;;;;;;;;;;;;;;;;;;;

(require 'flycheck-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp integration into editing ;;
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

;; (require 'tex-config)
(require 'text-mode-config)
;; (require 'jade-mode-config)
;; (require 'stylus-mode-config)
;; (require 'haml-mode-config)
;; (require 'yaml-mode-config)
;; (require 'sass-mode-config)
;; (require 'scss-mode-config)
(require 'css-mode-config)
(require 'csv-mode-config)
(require 'elisp-mode-config)
(require 'c-mode-config)
(require 'python-mode-config)
(require 'cython-mode-config)
(require 'ruby-mode-config)
(require 'java-mode-config)
(require 'ess-mode-config)
(require 'js-mode-config)
(require 'js2-mode-config)
(require 'rjsx-mode-config)
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

;;;;;;;;;;;;;;;;;;
;; Emacs server ;;
;;;;;;;;;;;;;;;;;;

;; Run emacs as a server so that startup cost is paid once per session.
;;
;; NOTE: (server-start) should reside at the bottom of the configuration so
;; that any misconfiguration should not be starting in server mode.
;; TODO: attempt to enable server mode only when not already up?
(server-start)
