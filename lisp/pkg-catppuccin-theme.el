;;; -*- lexical-binding: t; -*-

(use-package catppuccin-theme
  :straight t
  :disabled t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-reload)
  )

(use-package leuven-theme
  :straight t
  :disabled t
  :config
  (load-theme 'leuven t)
  )

(setq modus-themes-bold-constructs t
	  modus-themes-mixed-fonts nil
	  modus-themes-variable-pitch-ui t
	  modus-themes-custom-auto-reload t
	  modus-themes-disable-other-themes t

      ;; Options for `modus-themes-prompts' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `italic', `WEIGHT'
      modus-themes-prompts '(italic bold)
      )
;; Load the theme of your choice.
(load-theme 'modus-operandi)
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(provide 'pkg-catppuccin-theme)
