;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun c-mode-setup ()
  (setq c-default-style
        '((java-mode . "java") (awk-mode . "awk") (other . "gnu"))))

(add-hook 'c-mode-hook 'c-mode-setup)

(provide 'c-mode-config)
