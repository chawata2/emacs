;;; -*- lexical-binding: t; -*-

(use-package which-key
  :straight t
  :defer 1
  :init
  (which-key-mode 1)
  :diminish which-key-mode
  :custom
  (which-key-idle-delay 0.5))

;; 補完ポップアップ
(keymap-global-set "C-SPC" #'completion-at-point)

(provide 'pkg-which-key)
