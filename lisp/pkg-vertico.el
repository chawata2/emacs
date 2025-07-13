;;; -*- lexical-binding: t; -*-

(use-package vertico
  :straight t
  :defer t
  :custom
  (vertico-count 20) ; 候補をを最大20行まで表示
  :hook (after-init . vertico-mode)
  :config
  (advice-add #'vertico--format-candidate :around
              (lambda (orig cand prefix suffix index _start)
                (setq cand (funcall orig cand prefix suffix index _start))
                (concat
                 (if (= vertico--index index)
                     (propertize "» " 'face '(:foreground "#80adf0" :weight bold))
                   "  ")
                 cand))))

(provide 'pkg-vertico)
