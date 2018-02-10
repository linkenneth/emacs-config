;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialization benchmarking ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-activate 'benchmark-init)
(require 'benchmark-init)
(add-hook 'after-init-hook 'benchmark-init/deactivate)

(provide 'benchmark-config)
