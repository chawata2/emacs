;;; -*- lexical-binding: t; -*-

(use-package doom-modeline
  :straight t
  :init
  (add-hook 'after-init-hook #'doom-modeline-mode)
  )

(provide 'pkg-doom-modeline)
