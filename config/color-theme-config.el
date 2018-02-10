;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color Theme Customization ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-activate 'color-theme)
(require 'monokai-theme)

; Sets default font on OS X
(do-if-profile
 :mac-osx
 `(add-to-list 'default-frame-alist '(font . "Monaco 12")))

; Sets default font on Ubuntu
(do-if-profile
 :linux
 `(add-to-list 'default-frame-alist '(font . "Ubuntu Mono 12")))
