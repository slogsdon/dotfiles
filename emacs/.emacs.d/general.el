;;; general.el --- General settings.
;;; Commentary:
;;; Code:
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      inhibit-splash-screen t
      inhibit-startup-buffer-menu t
      inhibit-startup-message t)
(add-hook 'after-init-hook
	  `(lambda ()
	     (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
	     (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
	     (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
	     ))
;;; general.el ends here
