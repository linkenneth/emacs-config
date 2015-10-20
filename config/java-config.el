;;;;;;;;;;;;;;;;;;;;;;
;; Java Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

(defun java-mode-setup ()
  (setq c-basic-offset 4))

(add-hook 'java-mode-hook 'java-mode-setup)

;;;;;;;;;;;;;;;;;;;;;;
;; JDEE Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

; TODO fix the setups
;; Backtick instead of quote to allow comma to force evaluation
;; (setq jde-jdk-registry '(("1.7.0_09" . "/usr/lib/jvm/java-openjdk-7-amd64")))
;; (setq jde-jdk-registry `(("1.6.0_65" . ,(getenv "JAVA_HOME"))))
;; (setq jde-jdk-registry `(("1.7.0_51" . ,(getenv "JAVA_HOME"))))

;; (autoload 'jde-mode "jde" "JDE mode." t)
;; (setq auto-mode-alist (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

(defun jde-mode-setup ()
  ;; Flymake for Java
  (require 'jde-eclipse-compiler-server)

  ;; (setq jde-sourcepath (sourcepath-colon-path (getenv "PATH")))
  (setq jde-sourcepath nil)
  (setq jde-compiler '(("eclipse java compiler server" "/usr/share/java/ecj.jar")))

  ;; Use Java 1.7 compliance for ecj
  (setq jde-ecj-command-line-args '("-d" "none" "-1.7")))

(eval-after-load "jde" '(jde-mode-setup))
