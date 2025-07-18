;;; -*- lexical-binding: t; -*-
(use-package typescript-ts-mode
  :ensure nil
  :mode
  ("\\.ts[x]?\\'" . tsx-ts-mode)
  ("\\.[m]ts\\'" . tsx-ts-mode)
  ("\\.js[x]?\\'" . tsx-ts-mode)
  ("\\.[mc]js\\'" . tsx-ts-mode)
  :config
  (setq typescript-ts-mode-indent-offset 2)
  )

(provide 'lang-typescript)
