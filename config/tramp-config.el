;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;;

; Tramp is Emacs's way of connecting remotely to files over SSH, FTP
; and other file systems. However, the setup I currently have is
; extremely slow. In addition, it's hard to connect reliably over
; anything than a simple SSH setup. Instead, consider copying the
; emacs config onto the remote side and working through a terminal
; connection.
(setq tramp-password-prompt-regexp "^.*\\([pP]assword\\|[pP]assphrase\\|[pP]asscode\\).*:\0? *")
