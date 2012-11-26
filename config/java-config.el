;;;;;;;;;;;;;;;;;;;;;;
;; Java Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'java-mode-hook (lambda ()
			    (setq indent-tabs-mode nil)))

;; JDEE ;;
; Defers loading JDE until a java file is opened
(setq defer-loading-jde t)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde))

(setq jde-jdk-registry '(("1.7.0_09" . "/usr/lib/jvm/java-7-openjdk-amd64")))

; Flymake for Java
(require 'jde-eclipse-compiler-server)
(add-hook 'jde-mode-hook 'flymake-mode-on)

(setq jde-sourcepath '("." ".."))
(setq jde-compiler '(("eclipse java compiler server" "/usr/share/java/ecj.jar")))

