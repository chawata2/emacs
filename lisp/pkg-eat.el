;;; -*- lexical-binding: t; -*-
;; 初回のみ `M-x eat-compile-terminfo'が必要
(use-package eat
  :straight
  (eat :type git
       :host codeberg
       :repo "akib/emacs-eat"
       :files ("*.el" ("term" "term/*.el") "*.texi"
               "*.ti" ("terminfo/e" "terminfo/e/*")
               ("terminfo/65" "terminfo/65/*")
               ("integration" "integration/*")
               (:exclude ".dir-locals.el" "*-tests.el"))))

(defun my/open-eat-below ()
  "現在のウィンドウを上下に分割し、下側で `eat' を起動する。"
  (interactive)
  (split-window-below)
  (other-window 1)
  (eat))

(provide 'pkg-eat)
