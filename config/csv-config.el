;;;;;;;;;;;;;;;;;;;;;
;; CSV Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;

(autoload 'csv-mode "csv-mode" "Major mode for editing CSV files." t)
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
