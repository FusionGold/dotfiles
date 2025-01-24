;;; init-tools.el --- Useful tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :hook (after-init . which-key-mode)
  :config
  (which-key-add-key-based-replacements
    "C-c !" "flycheck")
  :custom
  (which-key-idle-delay 0.3))

;; Press C-c s to search
(use-package rg
  :ensure t
  :hook (after-init . rg-enable-default-bindings))

;; Writable grep buffer
(use-package wgrep
  :ensure t
  :after grep
  :custom
  (wgrep-change-readonly-file t))

;; GC optimization
(use-package gcmh
  :ensure t
  :hook (after-init . gcmh-mode)
  :custom
  (gcmh-idle-delay 10)
  ;; 100 MB
  (gcmh-high-cons-threshold #x6400000))

;; Buffer manager
;;
;; `sR': switch to saved filter groups
(use-package ibuffer
  :ensure nil
  :hook (ibuffer-mode . ibuffer-auto-mode)
  :bind ([remap list-buffers] . ibuffer)
  :custom
  (ibuffer-expert t)
  (ibuffer-movement-cycle nil)
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-saved-filter-groups
   '(("Default"
      ("Emacs" (or (name . "\\*scratch\\*")
                   (name . "\\*dashboard\\*")
                   (name . "\\*compilation\\*")
                   (name . "\\*Backtrace\\*")
                   (name . "\\*Packages\\*")
                   (name . "\\*Messages\\*")
                   (name . "\\*Customize\\*")))
      ("Browser" (or (mode . eww-mode)
                     (mode . xwidget-webkit-mode)))
      ("Help" (or (name . "\\*Help\\*")
                  (name . "\\*Apropos\\*")
                  (name . "\\*info\\*")
                  (mode . Man-mode)
                  (mode . woman-mode)))
      ("Repl" (or (mode . gnuplot-comint-mode)
                  (mode . inferior-emacs-lisp-mode)
                  (mode . inferior-python-mode)))
      ("Term" (or (mode . term-mode)
                  (mode . shell-mode)
                  (mode . eshell-mode)))
      ("Mail" (or (mode . mail-mode)
                  (mode . message-mode)
                  (derived-mode . gnus-mode)))
      ("Conf" (or (mode . yaml-mode)
                  (mode . conf-mode)))
      ("Dict" (or (mode . fanyi-mode)
                  (mode . dictionary-mode)))
      ("Text" (and (derived-mode . text-mode)
                   (not (starred-name))))
      ("Magit" (or (mode . magit-repolist-mode)
                   (mode . magit-submodule-list-mode)
                   (mode . git-rebase-mode)
                   (derived-mode . magit-section-mode)
                   (mode . vc-annotate-mode)))
      ("VC" (or (mode . diff-mode)
                (derived-mode . log-view-mode)))
      ("Prog" (and (derived-mode . prog-mode)
                   (not (starred-name))))
      ("Dired" (mode . dired-mode))
      ("IRC" (or (mode . rcirc-mode)
                 (mode . erc-mode)))))))

(use-package isearch
  :ensure nil
  :custom
  ;; have a counter like (3/12) on the left
  (isearch-lazy-count t)
  (isearch-lazy-count-prefix-format "(%s%s) ")
  (isearch-lazy-count-suffix-format nil)
  ;; interpret whitespace as non-greedy matching
  (search-whitespace-regexp ".*?"))

;; Jump to arbitrary positions
(use-package avy
  :ensure t
  ;; integrate with isearch and others
  ;; C-' to select isearch-candidate with avy
  :hook (after-init . avy-setup-default)
  :bind (("M-g M-l" . avy-goto-line)
         ("M-g M-j" . avy-goto-char-timer))
  :custom
  (avy-background t)
  (avy-all-windows nil)
  (avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?q ?w ?e ?r ?u ?i ?o ?p)))

;; Try out emacs packages without installing
(use-package try
  :ensure t
  :commands try try-and-refresh)

(provide 'init-tools)
;;; init-tools.el ends here
