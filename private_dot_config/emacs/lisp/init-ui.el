;;; init-ui.el --- Theme, modeline and dashboard -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; beautiful themes
(use-package ef-themes
  :ensure t
  :demand t
  :config
  (load-theme 'ef-cyprus t))

(use-package doom-themes
  :ensure t
  :defer t
  :config
  (load-theme 'doom-one-light t))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(use-package nerd-icons
  :ensure t
  :config
  (when (and (display-graphic-p)
             (not (font-installed-p nerd-icons-font-family)))
    (nerd-icons-install-fonts t)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner 'logo))

(provide 'init-ui)
;;; init-ui.el ends here
