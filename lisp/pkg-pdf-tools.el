;;; -*- lexical-binding: t; -*-

;; https://github.com/vedang/pdf-tools
;; MacOS ->  brew install poppler automake
(use-package pdf-tools
  :straight t
  :config
  (pdf-loader-install) ; On demand loading, leads to faster startup time
  )

(provide 'pkg-pdf-tools)
