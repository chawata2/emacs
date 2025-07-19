;;; -*- lexical-binding: t; -*-
(use-package rust-ts-mode
  :ensure nil
  :mode
  ("\\.rs\\'" . rust-ts-mode)
  :hook
  (rust-ts-mode . eglot-ensure)
  :config
  (setq rust-indent-offset 4)
  )

(provide 'lang-rust)
