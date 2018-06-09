;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialization benchmarking ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-activate 'benchmark-init)
(require 'benchmark-init)

;; Activate benchmarking. Comment out when not using.
(benchmark-init/activate)
(add-hook 'after-init-hook 'benchmark-init/deactivate)

(provide 'benchmark-config)
