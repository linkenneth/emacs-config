;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Profile configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 's)

(defvar profile-config--profiles '()
  "List of profiles that the current emacs setup is using.")

(defun do-if-profile (has-profiles body)
  "Executes BODY if all of the profiles in HAS-PROFILES are
  currently being used. HAS-PROFILES can be a single symbol or a
  list of symbols."
  (let ((in-profile t)
        (profiles (if (listp has-profiles) has-profiles (list has-profiles))))
    (dolist (profile profiles)
      (if (not (memq profile profile-config--profiles))
          (setq in-profile nil)))
    (if in-profile (eval body))))

(defun do-if-not-profile (has-profiles body)
  "Executes BODY if not all of the profiles in HAS-PROFILES are
  currently being used. HAS-PROFILES can be a single symbol or a
  list of symbols."
  (let ((in-profile t)
        (profiles (if (listp has-profiles) has-profiles (list has-profiles))))
    (dolist (profile profiles)
      (if (not (memq profile profile-config--profiles))
          (setq in-profile nil)))
    (if (not in-profile) (eval body))))


;;;;;;;;;;;;;;;;;;;
;; Profile Setup ;;
;;;;;;;;;;;;;;;;;;;

;; Mac OS X
(if (string-equal "darwin" system-type)
    (add-to-list 'profile-config--profiles :mac-osx))

;; Google Corp
(if (s-suffix? ".corp.google.com" system-name)
    (add-to-list 'profile-config--profiles :corp))

;; GNU / Linux Desktop
(if (string-equal "gnu/linux" system-type)
    (progn
      (add-to-list 'profile-config--profiles :linux)
      (add-to-list 'profile-config--profiles :desktop)))

;; Terminal vs. GUI
(if (display-graphic-p)
    (add-to-list 'profile-config--profiles :gui)
  (add-to-list 'profile-config--profiles :terminal))

(provide 'profile-config)
