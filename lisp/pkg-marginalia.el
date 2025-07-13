;;; -*- lexical-binding: t; -*-

;; ミニバッファの補完に注釈を追加
(use-package marginalia
  :straight t
  :hook (after-init . marginalia-mode))

(provide 'pkg-marginalia)
