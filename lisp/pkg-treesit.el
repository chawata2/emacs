;;; -*- lexical-binding: t; -*-

;; 以下のリポジトリから必要な言語の文法を取得する
;; https://github.com/emacs-tree-sitter/tree-sitter-langs/tree/master/repos
;; 自動でsrc/ディレクトリを探してくれる
(setq treesit-language-source-alist
      '(
		(json "https://github.com/tree-sitter/tree-sitter-json")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
		(rust "https://github.com/tree-sitter/tree-sitter-rust")
        ))

;; Treesitの言語をインストールする
;; 参考: https://zenn.dev/glassonion1/articles/20752bb8d2cf98
(dolist (element treesit-language-source-alist)
  (let* ((lang (car element)))
    (if (treesit-language-available-p lang)
        (message "treesit: %s is already installed" lang)
      (message "treesit: %s is not installed" lang)
      (treesit-install-language-grammar lang))))

(use-package treesit
  :ensure nil
  :config
  (setq treesit-font-lock-level 4)
  )

(provide 'pkg-treesit)
