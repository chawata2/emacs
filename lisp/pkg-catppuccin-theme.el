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
  :disabled t
  :config
  (load-theme 'spacemacs-light)
  )

(use-package leuven-theme
  :straight t
  :config
  (load-theme 'leuven t)
  )

;; (use-package nord-theme
;;   :straight t)

;; (use-package gruvbox-theme
;;   :straight t)

;; (use-package solarized-theme
;;   :straight  t)

(provide 'pkg-catppuccin-theme)
