; A collection of functions to help with switching between snake_case and
; CamelCase.

(defun split-name (s)
  (split-string
   (let ((case-fold-search nil))
     (downcase
      (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s)))
   "[^A-Za-z0-9]+"))

(defun camelcase  (s) (mapconcat 'capitalize (split-name s) ""))
(defun underscore (s) (mapconcat 'downcase   (split-name s) "_"))
(defun dasherize  (s) (mapconcat 'downcase   (split-name s) "-"))
(defun colonize   (s) (mapconcat 'capitalize (split-name s) "::"))

; General function to do `f` for that word.
(defun stylize-word-at-point (f)
  (let* ((case-fold-search nil)
	 (beg (and (skip-chars-backward "[:alnum:]:_-") (point)))
	 (end (and (skip-chars-forward  "[:alnum:]:_-") (point)))
	 (txt (buffer-substring beg end))
	 (cml (funcall f txt)) )
    (if cml (progn (delete-region beg end) (insert cml))) ))

(defun camelcase-word-at-point ()
  (interactive)
  (stylize-word-at-point 'camelcase))
(defun underscore-word-at-point ()
  (interactive)
  (stylize-word-at-point 'underscore))
(defun dasherize-word-at-point ()
  (interactive)
  (stylize-word-at-point 'dasherize))
(defun colonize-word-at-point ()
  (interactive)
  (stylize-word-at-point 'colonize))

(provide 'camel-score)
