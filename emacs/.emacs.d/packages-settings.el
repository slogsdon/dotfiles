;;; packages-settings.el --- declare settings for packages
;;; Commentary:
;;; Code:
(require 'evil)
(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(add-hook 'after-init-hook 'global-evil-leader-mode)
(add-hook 'after-init-hook 'evil-escape-mode)
(evil-mode 1)

; ui
(add-hook 'after-init-hook (lambda ()
  (load-theme 'base16-eighties t)
  ;; Set the cursor color based on the evil state
  (defvar my/base16-colors base16-eighties-colors)
  (setq evil-emacs-state-tag    (propertize " E" 'face `((:foreground ,(plist-get my/base16-colors :base0D))))
	evil-insert-state-tag   (propertize " I" 'face `((:foreground ,(plist-get my/base16-colors :base0D))))
	evil-motion-state-tag   (propertize " M" 'face `((:foreground ,(plist-get my/base16-colors :base0E))))
        evil-normal-state-tag   (propertize " N" 'face `((:foreground ,(plist-get my/base16-colors :base0B))))
        evil-replace-state-tag  (propertize " R" 'face `((:foreground ,(plist-get my/base16-colors :base08))))
	evil-visual-state-tag   (propertize " V" 'face `((:foreground ,(plist-get my/base16-colors :base09)))))
  ))

; flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)

; company
(add-hook 'after-init-hook 'global-company-mode)

; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence t
      guide-key/idle-delay 0.5
      guide-key/popup-window-position 'bottom
      )
(guide-key-mode 1)

; helm
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(add-hook 'after-init-hook (lambda ()
  (define-key helm-map (kbd "ESC") 'helm-keyboard-quit)
  ))
(require 'helm-projectile)
(helm-projectile-on)

; projectile
(projectile-global-mode)

; smart-mode-line
(require 'smart-mode-line)
(setq sml/theme 'respectful
      sml/no-confirm-load-theme t
      )
(add-hook 'after-init-hook 'sml/setup)

; languages
(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'haskell-mode-hook 'intero-mode)

(when (require 'diminish nil 'noerror)
  (eval-after-load "company"
    '(diminish 'company-mode "Cmp"))
  (eval-after-load "evil-escape"
    '(diminish 'evil-escape-mode))
  (diminish 'projectile-mode "Prj")
  (diminish 'guide-key-mode)
  (diminish 'undo-tree-mode)
  )
;;; packages-settings.el ends here
