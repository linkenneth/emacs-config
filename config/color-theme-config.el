;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color Theme Customization ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'monokai-theme)

(do-if-profile
 :mac-osx
 `(add-to-list 'default-frame-alist '(font . "Monaco 12")))

(do-if-profile
 :linux
 `(add-to-list 'default-frame-alist '(font . "Ubuntu Mono 12")))

(provide 'color-theme-config)
