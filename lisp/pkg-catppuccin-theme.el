;;; -*- lexical-binding: t; -*-

(use-package catppuccin-theme
  :straight t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-reload)
  )

(provide 'pkg-catppuccin-theme)
