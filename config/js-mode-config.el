;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun js-select-flycheck-linter ()
  "Selects the correct JS linter for Flycheck.
If eslint is a local dependency, use eslint as Flycheck linter. Otherwise, use
the 'semistandard' standard. Modified from
https://stackoverflow.com/q/33382928/."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (if (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint)
      (setq-local flycheck-javascript-standard-executable "semistandard"))))

(defun js-mode-setup ()
  (setq-default js-indent-level 2)
  (setq-local evil-shift-width 2)
  (js-select-flycheck-linter))
(add-hook 'js-mode-hook 'js-mode-setup)

;; TODO: also consider web-mode (better replacement to nxhtml-mode)
;; TODO: is a json-mode necessary?

(provide 'js-mode-config)
