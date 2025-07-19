;;; -*- lexical-binding: t; -*-

(use-package catppuccin-theme
  :straight t
  :disabled t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-reload)
  )

(use-package spacemacs-theme
  :straight t
  :config
  (load-theme 'spacemacs-light)
  )

(provide 'pkg-catppuccin-theme)
