;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ReactJS / JSX mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.jsx.snap\\'" . rjsx-mode))

;; Currently ELPA autoloads all the necessary basic configurations, but any
;; additional configurations should be made here.

;; TODO: figure out how well this works with YCMD / flycheck etc.

(provide 'rjsx-mode-config)
