;;; -*- lexical-binding: t; -*-

;; NOTE: Magitを開いた後に、delete-othier-windiw(C-w C-o)で最大化

(use-package magit
  :straight t
  :defer t
  :bind
  ("C-c C-i" . magit-status)
;;  :commands (magit-status magit-blame-addition)
;;  :custom
;;  (magit-bury-buffer-function #'magit-restore-window-configuration)          ;; windowの配置を戻す
;;  (magit-diff-refine-hunk 'all)
  )

(provide 'pkg-magit)
