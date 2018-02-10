;;;;;;;;;;;;;;;;
;; Main Paths ;;
;;;;;;;;;;;;;;;;

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Do not add auto-generated "(package-initialize)" to my init file.
(setq package--init-file-ensured t)

(setq package-user-dir "~/.emacs.d/packages")

;; Mac OS X correct permissions handling
(do-if-profile 
 (require 'gnutls)
 (add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem"))

;; Initialize ELPA, but don't activate packages until later.
(package-initialize t)
