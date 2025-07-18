;;; -*- lexical-binding: t; -*-
(use-package json-ts-mode
  :ensure nil
  :mode
  ("\\.json\\'" . json-ts-mode)
  ("\\.jsonc\\'" . json-ts-mode)
  :config
  (setq json-ts-mode-indent-offset 2)
  )

(provide 'lang-json)
