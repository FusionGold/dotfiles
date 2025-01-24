;;; init.el --- The main entry for emacs
;;; Commentary:
;;; Code:

;; A big contributor to startup times is garbage collection. We up the gc
;; threshold to temporarily prevent it from running, and then reset it by the
;; `gcmh' package.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Initialize package sources
(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)

;; Keep ~/.emacs.d/ clean.
(use-package no-littering
  :ensure t
  :demand t)

(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir)))
(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-base)
(require 'init-ui)
(require 'init-funcs)
(require 'init-tools)
(require 'init-minibuffer)
(require 'init-evil)
(require 'init-dev)
(require 'init-lsp)
(require 'init-git)
(require 'init-dired)

;; standalone apps
(require 'init-org)

;;; init.el ends here
