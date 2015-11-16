;;; packages-settings.el --- Declare settings for packages.
;;; Commentary:
;;; Code:
; evil
(require 'evil)
(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(add-hook 'after-init-hook 'global-evil-leader-mode)
(add-hook 'after-init-hook 'evil-escape-mode)
(evil-mode 1)

; solarized
(load-theme 'solarized t)

; flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)

; company
(add-hook 'after-init-hook 'global-company-mode)

; alchemist
(add-hook 'elixir-mode-hook 'alchemist-mode)

; helm
(require 'helm-config)
(helm-mode 1)

; projectile
(projectile-global-mode)
;;; packages-settings.el ends here
