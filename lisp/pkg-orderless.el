;;; -*- lexical-binding: t; -*-

;; 補完候補とのマッチング
(use-package orderless
  :straight t
  :defer t
  :after vertico
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides nil))

(provide 'pkg-orderless)
