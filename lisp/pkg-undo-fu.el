;;; -*- lexical-binding: t; -*-
(use-package undo-fu
  :straight t
  :config
  (with-eval-after-load 'evil
    (setq evil-undo-system 'undo-fu)))

(provide 'pkg-undo-fu)
