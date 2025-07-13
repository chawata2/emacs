;;; -*- lexical-binding: t; -*-

(use-package consult
  :straight t
  :defer t
  :config
  ;; バッファ、ファイル、ブックマークなどをまとめて絞り込めるようにする
  (defcustom consult-buffer-sources
    '(consult--source-hidden-buffer

      consult--source-file
      consult--source-bookmark
      consult--source-project-buffer
      consult--source-project-file)
	;; ミニバッファで?を入力して接頭辞のヘルプを表示する
	(define-key consult-narrow-map
				(vconcat consult-narrow-key "?") #'consult-narrow-help)
	)
  )

(provide 'pkg-consult)
