;;; -*- lexical-binding: t; -*-

(use-package indent-guide
  :straight t
  :disabled t
  :defer t
  :custom
  (indent-guide-char      "│")
  :hook
  (prog-mode . indent-guide-mode)
  )

(provide 'pkg-indent-guide)
