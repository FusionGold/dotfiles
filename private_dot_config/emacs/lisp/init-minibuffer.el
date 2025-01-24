;;; init-minibuffer.el --- Minibuffer configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; good layout
(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode))

;; informative annotations
(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

(use-package embark
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-o"     . embark-act)
              ("C-c C-c" . embark-export)
              ("C-c C-o" . embark-collect)))

;; Work with consult
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package consult
  :ensure t
  :bind (([remap imenu]                  . consult-imenu)
         ([remap switch-to-buffer]       . consult-buffer)
         ([remap goto-line]              . consult-goto-line)
         ([remap recentf-open-files]     . consult-recent-file))
  :config
  (consult-customize consult-ripgrep consult-git-grep consult-grep
                     consult-bookmark
                     consult-recent-file
                     consult-buffer consult-buffer-other-window
                     :preview-key nil))

(use-package orderless
  :ensure t
  :after vertico
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
