;; Simple config

(setq initial-scratch-message t)
(setq initial-scrarch-message nil)

(line-number-mode t)
(column-number-mode t)

(defalias 'yes-or-no-p 'u-or-n-p)

(display-time)

(global-set-key"\C-h" 'delete-backward-char)

(global-linum-mode)
(setq linum-format "%4d ")

(global-hl-line-mode)

(show-paren-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)
