;;; keymaps.el --- set keymaps
;;; Commentary:
;;; Code:

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

(provide 'my/keymaps)
;;; keymaps.el ends here
