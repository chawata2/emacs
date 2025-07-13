;;; -*- lexical-binding: t; -*-

(use-package embark
  :straight t
  :defer t)

(use-package embark-consult
  :straight t
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode)) ;; Enable preview in Embark collect mode.

(provide 'pkg-embark)
