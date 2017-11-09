;;;;;;;;;;;;;;;;;;;;;;;
;;; packages - general
;;;;;;;;;;;;;;;;;;;;;;;

;; evil
(use-package evil
  :config
  (evil-mode 1))

(use-package evil-escape
  :diminish evil-escape-mode
  :config
  (evil-escape-mode))

(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

;; theme
(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox t))

(use-package smart-mode-line
  :config
  (setq sml/theme 'respectful
        sml/no-confirm-load-theme t
        )
  (sml/setup))

(use-package diminish
  :config
  (diminish 'undo-tree-mode))

;;;###autoload
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;;;###autoload
(defun my/setup-evil-mode-keymaps ()
  (setq-default evil-escape-key-sequence "jk")
  (defvar leader "SPC")

  (define-key evil-normal-state-map (kbd (format "%s TAB" leader)) 'switch-to-previous-buffer)
  (evil-leader/set-key
    ; buffers
    "bd" ":bd"
    ; errors
    "el" 'helm-flycheck
    ; files
    "fs" ":w"
    ; git
    "gs" 'magit-status
    "gc" 'magit-commit
    "ga" 'magit-commit-amend
    "gd" 'magit-diff
    "gp" 'magit-pull
    "gf" 'magit-fetch
    "gl" 'magit-log
    ; projectile
    "pp" 'helm-projectile-find-file
    ; windows
    "wh" 'windmove-left
    "wj" 'windmove-up
    "wk" 'windmove-down
    "wl" 'windmove-right
    "wq" ":q")

  (which-key-add-key-based-replacements
    (format "%s b" leader) "buffer"
    (format "%s e" leader) "error"
    (format "%s f" leader) "file"
    (format "%s g" leader) "git"
    (format "%s p" leader) "project"
    (format "%s w" leader) "window"))

(use-package which-key
  :diminish
  :config
  (setq which-key-idle-delay 0.2)
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (add-hook 'after-init-hook 'my/setup-evil-mode-keymaps))

;; company
(use-package company
  :diminish
  :config
  (global-company-mode))

;; helm
(use-package helm
  :diminish)

;; flycheck
(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package helm-flycheck)

;; projectile
(use-package projectile
  :config
  (setq projectile-mode-line nil)
  (projectile-global-mode))

(use-package helm-projectile
  :config
  (helm-mode 1)
  (define-key helm-map (kbd "ESC") 'helm-keyboard-quit)
  (helm-projectile-on))

;;;;;;;;;;;;;;;;;;;;;;;
;; packages - languages
;;;;;;;;;;;;;;;;;;;;;;;

;; dotnet
(use-package fsharp-mode)

;; elixir
(use-package elixir-mode)

(use-package alchemist
  :config
  (add-hook 'elixir-mode-hook 'alchemist-mode))

;; haskell
(use-package haskell-mode)

(use-package intero
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

;; markdown
(use-package markdown-mode)

;; php
(use-package php-mode
  :config
  (add-hook 'php-mode-hook 'php-enable-psr2-coding-style))

(use-package ac-php
  :config
  (require 'company-php)
  (company-mode t)
  (ac-php-core-eldoc-setup)
  (add-to-list 'company-backends 'company-ac-php-backend))

(use-package php-extras)

;; typescript
;;;###autoload
(defun my/setup-tide-mode ()
  "Set up tide mode."
  (interactive)
  (setq company-tooltip-align-annotations t)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (setq typescript-indent-level 2)
  (setq js2-indent-level 2))

(use-package typescript-mode)

(use-package tide
  :config
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook 'my/setup-tide-mode)
  (add-hook 'js2-mode-hook 'my/setup-tide-mode))

;; yaml
(use-package yaml-mode)
