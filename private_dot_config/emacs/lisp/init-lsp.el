;;; init-lsp.el --- The completion engine and lsp client -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; company-mode
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind (:map company-mode-map
         ([remap completion-at-point] . company-complete)
         :map company-active-map
         ("C-s"     . company-filter-candidates)
         ([tab]     . company-complete-common-or-cycle)
         ([backtab] . company-select-previous-or-abort))
  :config
  (define-advice company-capf--candidates (:around (func &rest args))
    "Try default completion styles."
    (let ((completion-styles '(basic partial-completion)))
      (apply func args)))
  :custom
  (company-idle-delay 0)
  ;; no icons
  (company-format-margin-function nil))

;; lsp-mode
(use-package lsp-mode
  :ensure t
  :hook (c++-mode . lsp-deferred)
  :bind (:map lsp-mode-map
         ("C-c f" . lsp-format-region)
         ("C-c d" . lsp-describe-thing-at-point)
         ("C-c a" . lsp-execute-code-action)
         ("C-c r" . lsp-rename))
  :config
  (with-no-warnings
    (lsp-enable-which-key-integration t))
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-auto-guess-root t)
  ;; auto kill lsp server
  (lsp-keep-workspace-alive nil)
  ;; do not hightlight same symbols around
  (lsp-enable-symbol-highlighting nil)
  ;; keep headline clean
  (lsp-headerline-breadcrumb-enable nil))

(use-package cc-mode
  :ensure nil
  :mode ("\\.cxx\\'" . c++-mode)
  :config
  (with-no-warnings
    (defconst ccls-args nil)
    (defconst clangd-args '("-j=2"
                            "--malloc-trim"
                            "--background-index"
                            "--clang-tidy"
                            "--completion-style=bundled"
                            "--pch-storage=disk"
                            "--header-insertion=never"
                            "--header-insertion-decorators"
                            "--include-cleaner-stdlib"))
    (with-eval-after-load 'lsp-mode
      ;; Prefer `clangd' over `ccls'
      (cond ((executable-find "clangd") (setq lsp-clients-clangd-executable "clangd"
                                              lsp-clients-clangd-args clangd-args))
            ((executable-find "ccls") (setq lsp-clients-clangd-executable "ccls"
                                            lsp-clients-clangd-args ccls-args))))))

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

(provide 'init-lsp)
;;; init-lsp.el ends here
