;;;;;;;;;;;;;;;;;;;;;;;
;; CamelScore Config ;;
;;;;;;;;;;;;;;;;;;;;;;;

; allows easy CamelCasing or snake_casing
(global-set-key (kbd "C-c C--") 'dasherize-word-at-point)
(global-set-key (kbd "C-c C-_") 'underscore-word-at-point)
(global-set-key (kbd "C-c C-;") 'camelcase-word-at-point)
(global-set-key (kbd "C-c C-:") 'colonize-word-at-point)

(require 'camel-score)
