;;; -*- lexical-binding: t; -*-

(use-package projectile
  :straight t
  :init
  (setq projectile-completion-system 'default)  ; Vertico/Consult を使うなら 'default
  :config
  (projectile-mode 1))

(use-package consult-projectile
  :straight t
  :after (projectile consult)
  :config
  )

(provide 'pkg-projectile)
