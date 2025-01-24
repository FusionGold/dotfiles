;;; init-org.el --- Org mode configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org
  :ensure nil
  :hook (org-mode . visual-line-mode)
  :custom
  (org-directory "~/org/")
  (org-default-notes-file (expand-file-name "notes.org" org-directory))
  (org-startup-indented t)
  (org-insert-heading-respect-content t)
  (org-agenda-files (list (expand-file-name "tasks.org.gpg" org-directory))))

(use-package org-capture
  :ensure nil
  :after org
  :custom
  (org-capture-use-agenda-date t)
  (org-capture-templates '(;; Tasks
                           ("t" "Tasks")
                           ("tt" "Today" entry (file+headline "tasks.org" "Today")
                            "* TODO %?\n%i\n")
                           ("ti" "Inbox" entry (file+headline "tasks.org" "Inbox")
                            "* %?\n%i\n")
                           ;; Capture
                           ("c" "Capture")
                           ("cn" "Notes" entry (file+headline "capture.org" "Notes")
                            "* %? %^G\n%i\n")
                           ("ct" "Thoughts" plain (file "thoughts.org")
                            "" :empty-lines 1))))

(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :custom
  (org-modern-star nil)
  (org-modern-list '((?* . "◦") (?+ . "•") (?- . "–")))
  (org-modern-tag t)
  (org-modern-priority nil)
  (org-modern-todo nil)
  (org-modern-timestamp t))

(provide 'init-org)
;;; init-org.el ends here
