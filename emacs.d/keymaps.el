;;; keymaps.el --- Set keymaps
;;; Commentary:
;;; Code:
(setq-default evil-escape-key-sequence "jk")

(evil-leader/set-key
  ; buffers
  "bd" ":bd"
  ; git
  "gs" 'magit-status
  "gc" 'magit-commit
  "ga" 'magit-commit-amend
  "gd" 'magit-diff
  "gp" 'magit-pull
  "gf" 'magit-fetch
  "gl" 'magit-log
  ; projectile
  "pp" 'projectile-find-file
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
  "wj" 'windmove-down
  "wk" 'windmove-up
  "wl" 'windmove-right
  "wq" ":q")
;;; keymaps.el ends here
