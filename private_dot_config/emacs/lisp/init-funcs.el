;;; init-funcs.el --- core functions -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(with-no-warnings
  (defun +insert-cp-templates ()
    "Insert cp templates at point."
    (interactive)
    (let* ((default-directory "~/workspace/algorithm/templates/")
           (filename (read-file-name "Insert file: " default-directory)))
      (insert-file filename)
      (goto-char (mark)))))

(keymap-global-set "C-c i" '+insert-cp-templates)

;; Auto create parent dirs when using find-file
(defun +make-directory-maybe (FILENAME &optional _)
  "Create parent directory if not exists while visiting FILENAME."
  (unless (file-exists-p FILENAME)
    (let ((dir (file-name-directory FILENAME)))
      (unless (file-exists-p dir)
        (make-directory dir t)))))
(advice-add 'find-file :before #'+make-directory-maybe)

;;;###autoload
(defun +rename-current-file (newname)
  "Rename current visiting file to NEWNAME.
If NEWNAME is a directory, move file to it."
  (interactive
   (progn
     (unless buffer-file-name
       (user-error "No file is visiting"))
     (let ((name (read-file-name "Rename to: " nil buffer-file-name 'confirm)))
       (when (equal (file-truename name)
                    (file-truename buffer-file-name))
         (user-error "Can't rename file to itself"))
       (list name))))
  ;; NEWNAME is a directory
  (when (equal newname (file-name-as-directory newname))
    (setq newname (concat newname (file-name-nondirectory buffer-file-name))))
  (rename-file buffer-file-name newname)
  (set-visited-file-name newname))

;;;###autoload
(defun +delete-current-file (file)
  "Delete current visiting FILE."
  (interactive
   (list (or buffer-file-name
             (user-error "No file is visiting"))))
  (when (y-or-n-p (format "Really delete '%s'? " file))
    (kill-this-buffer)
    (delete-file file)))

(provide 'init-funcs)
;;; init-funcs.el ends here
