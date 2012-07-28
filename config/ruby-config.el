;;;;;;;;;;;;;;;;;;;;;;
;; Ruby Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

;; Inf-Ruby for IRB Shell ;;
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook 'inf-ruby-keys)
