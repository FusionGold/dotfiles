;;; init-evil.el --- Evil configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package evil
  :ensure t
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-fine-undo t)
  (setq evil-want-Y-yank-to-eol t)
  :hook (after-init . evil-mode)
  ;; Rebind `f'/`s' using avy
  :bind (([remap evil-quit] . kill-current-buffer)
         :map evil-motion-state-map
         ("f" . evil-avy-goto-char-in-line)
         :map evil-normal-state-map
         ("s" . evil-avy-goto-char-timer))
  :custom
  (evil-undo-system 'undo-redo)
  (evil-shift-width tab-width)
  (evil-respect-visual-line-mode t))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(defun +insert-problem-title-primary-selection ()
  "Insert a template with the primary selection content as title."
  (interactive)
  (let ((title (evil-get-register ?*)))
    (insert (format "/**\n *    title: %s\n**/\n" title))))

(use-package general
  :ensure t
  :after evil
  :config
  (general-evil-setup t)
  (general-define-key
   :states '(normal motion)
   :keymaps 'override
   :prefix "SPC"
   ;; unbind SPC
   "" '(nil :which-key "evil leader key")
   ;; buffer
   "b" '(:ignore t :which-key "buffer")
   "bb" '(consult-buffer :which-key "consult-buffer")
   "bB" '(consult-buffer-other-window :which-key "consult-buffer-other-window")
   "bc" '((lambda () (interactive) (kill-new (buffer-string)) (message "Buffer copied!")) :which-key "copy buffer contents")
   "bv" '(revert-buffer :which-key "revert-buffer")
   ;; code
   "c" '(:ignore t :which-key "code")
   "cw" '(delete-trailing-whitespace :which-key "delete-trailing-whitespace")
   "cx" '(quickrun-shell :which-key "quickrun-shell")
   ;; file
   "f" '(:ignore t :which-key "file")
   "ff" '(find-file :which-key "find-file")
   "fF" '(find-file-other-window :which-key "find-file-other-window")
   "fj" '(dired-jump :which-key "dired-jump")
   "fr" '(recentf-open-files :which-key "recentf-open-files")
   "fR" '(+rename-current-file :which-key "+rename-current-file")
   "fD" '(+delete-current-file :which-key "+delete-current-file")
   ;; insert
   "i" '(:ignore t :which-key "insert")
   "it" '(+insert-problem-title-primary-selection :which-key "insert title")
   ;; window
   "w" '(evil-window-map :which-key "evil-window-map")
   "wd" '(delete-other-windows :which-key "delete-other-windows")
   "wo" '(other-window :which-key "other-window")
   ;; search
   "s" '(:ignore t :which-key "search")
   "sg" '(consult-ripgrep :which-key "consult-ripgrep")
   "si" '(imenu :which-key "consult-imenu")
   "ss" '(consult-line :which-key "consult-line")
   ;; open
   "o" '(:ignore t :which-key "open")
   "oc" '(org-capture :which-key "org-capture")
   "ot" '(ansi-term :which-key "ansi-term")
   "oe" '(eshell :which-key "ansi-term")))

(provide 'init-evil)
;;; init-evil.el ends here
