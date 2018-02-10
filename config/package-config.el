;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(require 'profile-config)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-user-dir "~/.emacs.d/packages")

;; Prevent auto-generated '(package-initialize)' from being added to init.el.
(setq package--init-file-ensured t)

;; Add missing trusted LibreSSL certificates on Mac OS X.
;; (https://blog.vifortech.com/posts/emacs-tls-fix/)
(do-if-profile 
 (require 'gnutls)
 (add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem"))

;; Initialize ELPA, but don't activate packages until later.
(package-initialize t)

(provide 'package-config)
