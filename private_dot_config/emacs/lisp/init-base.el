;;; init-base.el --- The necessary settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Suppress GUI features and more
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-x-resources t
      inhibit-default-init t
      inhibit-startup-screen t)
;; Disable scrollbars
(scroll-bar-mode -1)
;; Disable toolbar
(tool-bar-mode -1)
;; Disable tooltips
(tooltip-mode -1)
;; Disable menu bar
(menu-bar-mode -1)
;; No annoying bell
(setq ring-bell-function 'ignore)

;; Keep init.el clean
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; No backup files
(setq make-backup-files nil
      auto-save-default nil)
;; No lock files
(setq create-lockfiles nil)
;; No tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Enable line numbers
(global-display-line-numbers-mode t)
;; Enable column numbers
(column-number-mode)
;; Disable line numbers for certain modes
(dolist (mode '(org-mode-hook
                shell-mode-hook
                eshell-mode-hook
                term-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Pixelwise resize
(setq frame-resize-pixelwise t)

;; Use y or n for decisions
(setopt use-short-answers t)

;; Font size
(set-face-attribute 'default nil :height 120)

;; auto pairs
(electric-pair-mode t)

;; Highlight parenthesises
(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :custom
  (show-paren-when-point-inside-paren t)
  (show-paren-when-point-in-periphery t))

;; Highlight current line in GUI
(use-package hl-line
  :ensure nil
  :when (display-graphic-p)
  :hook (after-init . global-hl-line-mode))

;; Server mode.
;; Use emacsclient to connect
(use-package server
  :ensure nil
  :hook (after-init . server-mode))

;; Back to the previous position
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; Recently opened files
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-max-saved-items 300)
  (recentf-auto-cleanup 'never))

;; Encrypt .gpg files
(use-package epa-file
  :ensure nil
  :config
  (epa-file-enable))

(provide 'init-base)
;;; init-base.el ends here
