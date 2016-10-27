;; packages.el --- define packages to load and load them
;;; Commentary:
;;; Code:

;;;###autoload
(defun my/global-helm-mode-with-settings ()
  (helm-mode 1)
  (define-key helm-map (kbd "ESC") 'helm-keyboard-quit))

;;;###autoload
(defun my/set-smart-mode-line-settings ()
  (setq sml/theme 'respectful
        sml/no-confirm-load-theme t
        ))

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

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-eighties t)
  ;; Set the cursor color based on the evil state
  (defvar my/base16-colors base16-eighties-colors)
  (setq evil-emacs-state-tag    (propertize " E" 'face `((:foreground ,(plist-get my/base16-colors :base0D))))
        evil-insert-state-tag   (propertize " I" 'face `((:foreground ,(plist-get my/base16-colors :base0D))))
        evil-motion-state-tag   (propertize " M" 'face `((:foreground ,(plist-get my/base16-colors :base0E))))
        evil-normal-state-tag   (propertize " N" 'face `((:foreground ,(plist-get my/base16-colors :base0B))))
        evil-replace-state-tag  (propertize " R" 'face `((:foreground ,(plist-get my/base16-colors :base08))))
        evil-visual-state-tag   (propertize " V" 'face `((:foreground ,(plist-get my/base16-colors :base09))))))

; smart-mode-line
(use-package smart-mode-line
  :ensure t
  :config
  (my/set-smart-mode-line-settings)
  (sml/setup))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (use-package which-key
    :ensure t
    :diminish
    :config
    (setq which-key-idle-delay 0.2)
    (which-key-mode)
    (which-key-setup-side-window-bottom)
    (add-hook 'after-init-hook 'my/setup-evil-mode-keymaps)))

(use-package evil-escape
  :ensure t
  :diminish evil-escape-mode
  :config
  (evil-escape-mode))

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

(use-package magit
  :ensure t
  :defer 1.5)

(use-package evil-magit
  :ensure t
  :defer 1.5)

; flycheck
(use-package flycheck
  :ensure t
  :defer 1.5
  :config
  (global-flycheck-mode))

; company
(use-package company
  :ensure t
  :defer 1.5
  :diminish
  :config
  (global-company-mode))


; projectile
(use-package projectile
  :ensure t
  :defer 1.5
  :config
  (setq projectile-mode-line nil)
  (projectile-global-mode))

; helm
(use-package helm
  :ensure t
  :defer 1.5
  :diminish)

(use-package helm-flycheck
  :ensure t
  :defer 1.5)

(use-package helm-projectile
  :ensure t
  :defer 1.5
  :config
  (my/global-helm-mode-with-settings)
  (helm-projectile-on))

; languages
(use-package elixir-mode
  :ensure t
  :defer .5)

(use-package alchemist
  :ensure t
  :defer 3
  :config
  (add-hook 'elixir-mode-hook 'alchemist-mode))

(use-package haskell-mode
  :ensure t
  :defer .5)

(use-package intero
  :ensure t
  :defer 3
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package typescript-mode
  :ensure t
  :defer .5)

(use-package tide
  :ensure t
  :defer 3
  :config
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook 'my/setup-tide-mode)
  (add-hook 'js2-mode-hook 'my/setup-tide-mode))

(use-package fsharp-mode
  :ensure t
  :defer .5)

(use-package markdown-mode
  :ensure t
  :defer .5)

(use-package php-mode
  :ensure t
  :defer .5)

(use-package php-extras
  :ensure t
  :defer 3)

(use-package yaml-mode
  :ensure t
  :defer .5)

(use-package diminish
  :ensure t
  :config
  (diminish 'undo-tree-mode))
;;; packages.el ends here

