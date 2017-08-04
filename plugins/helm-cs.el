;; helm-cs.el --- cs interface for helm
;;
;; Original credit goes to Jaeyoon Jeong for the code. Made some small
;; adjustments to fit myself.

(require 'helm-plugin)

(defface helm-cs-finish
    '((t (:foreground "green")))
  "Face used in mode line when codesearch process is finish.")

(defvar helm-cs-command "cs --nostats --enable_local_proxy --max_num_results=20 -n --local -- %s")

(defun helm-cs-init ()
  (let (process-connection-type)
    (prog1
        (start-process-shell-command
         "cs-process" helm-buffer
         (format helm-cs-command helm-pattern))
      (set-process-sentinel
       (get-buffer-process helm-buffer)
       #'(lambda (_process event)
           (if (string= event "finished\n")
               (with-helm-window
                 (setq mode-line-format
                       '(" " mode-line-buffer-identification " "
                         (:eval (format "L%s" (helm-candidate-number-at-point))) " "
                         (:eval (propertize
                                 (format "[Codesearch Process Finish- (%s results)]"
                                         (max (1- (count-lines
                                                   (point-min) (point-max)))
                                              0))
                                 'face 'helm-cs-finish))))
                 (force-mode-line-update))
             (helm-log "Error: Codesearch %s"
                       (replace-regexp-in-string "\n" "" event))))))))

(defvar helm-source-cs
  `((name . "Codesearch")
    (candidates-process . helm-cs-init)
    (requires-pattern . 3)
    (history . ,'helm-cs-history)
    (help-message . helm-generic-file-help-message)
    (candidate-number-limit . 9999)
    (action . ,(delq
                nil
                `(("Find File" . helm-grep-action)
                  ("Find file other frame" . helm-grep-other-frame)
                  ("Save results in grep buffer" . helm-grep-save-results)
                  ("Find file other window" . helm-grep-other-window))))
    (persistent-action . helm-grep-persistent-action)
    (persistent-help . "Jump to line (`C-u' Record in mark ring)")
    (no-matchplugin))
  "Find files matching the current input pattern with codesearch.")

(defvar helm-cs-history nil)
(defun helm-cs-1 (&optional initial-input default)
  (require 'helm-mode)
  (require 'helm-grep)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm :sources 'helm-source-cs
          :buffer "*helm cs*"
          :input initial-input
          :default default
          :history helm-cs-history)))

(defun helm-cs ()
  (interactive)
  (and (fboundp 'gtags-push-tag) (gtags-push-tag))
  (setq helm-ff-default-directory default-directory)
  (helm-cs-1 (concat "-f:test.cc ")))

(provide 'helm-cs)
;;; helm-cs.el ends here
