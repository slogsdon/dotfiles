;;; base.el --- General settings.
;;; Commentary:
;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize t)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))
  (require 'use-package))

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      inhibit-splash-screen t
      inhibit-startup-buffer-menu t
      inhibit-startup-message t)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-hook 'after-init-hook
	  `(lambda ()
	     (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
	     (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
	     (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
	     ))

(when (display-graphic-p) (set-frame-font "Fira Code 10"))

(provide 'my/base)
;;; base.el ends here
