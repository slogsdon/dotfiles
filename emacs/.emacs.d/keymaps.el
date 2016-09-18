;;; keymaps.el --- set keymaps
;;; Commentary:
;;; Code:
(setq-default evil-escape-key-sequence "jk")

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(define-key evil-normal-state-map (kbd "SPC TAB") 'switch-to-previous-buffer)
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
  ; tmux
  "ts" 'emamux:send-command
  "tr" 'emamux:run-command
  "tl" 'emamux:run-last-command
  "tz" 'emamux:zoom-runner
  "ti" 'emamux:inspect-runner
  "tk" 'emamux:interrupt-runner
  "tK" 'emamux:close-runner-pane
  "tc" 'emamux:clear-runner-history
  ; windows
  "wh" 'windmove-left
  "wj" 'windmove-up
  "wk" 'windmove-down
  "wl" 'windmove-right
  "wq" ":q")
;;; keymaps.el ends here
