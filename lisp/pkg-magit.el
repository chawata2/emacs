;;; -*- lexical-binding: t; -*-

(use-package magit
  :straight t
  :defer t
  :commands (magit-status magit-blame-addition)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1) ;; 最大化して開く
  (magit-bury-buffer-function #'magit-restore-window-configuration)          ;; windowの配置を戻す
  (magit-diff-refine-hunk 'all)
  )

(provide 'pkg-magit)
