;;; packages.el --- Define packages to load and load them.
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    ; languages
    elixir-mode alchemist
    fsharp-mode
    haskell-mode
    markdown-mode
    php-mode php-extras
    typescript-mode tide
    yaml-mode
    ; utility
    color-theme-solarized
    company
    editorconfig
    emamux
    evil evil-leader evil-escape
    flycheck
    helm
    magit
    projectile
   ) "Packages to install.")

(require 'cl)
(defun packages-installed-p ()
  "Helper function to test install state of `required-packages`."
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" "done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
;;; packages.el ends here
