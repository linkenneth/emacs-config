;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Environment variables ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: hard-coding paths like this means I may have to continuously add paths
;; to both my .emacs config and my .profile. Consider fixing my .profile setups
;; to have paths correct, and import from there.

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/usr/local/bin")

(provide 'environment-config)
