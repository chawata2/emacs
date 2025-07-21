;;; -*- lexical-binding: t; -*-

(use-package evil
  :straight t
  :init
  (setq evil-want-integration t            ; evil-collection 連携用
        evil-want-keybinding nil           ; 同上（C-h で HELP を残す）
        evil-search-module 'isearch        ; / 検索に isearch UI
        evil-vsplit-window-right t         ; :vsp は右側に開く
        evil-split-window-below  t         ; :sp  は下に開く
        evil-undo-system 'undo-redo		   ; Emacs 28+ の native undo を使用
		evil-want-C-u-scroll t             ; C-u でスクロール
		)
  :config
  (evil-mode 1)
  ;; バッファ全体を選択するテキストオブジェクトを定義
  (evil-define-text-object evil-buffer-text-object (count &optional beg end type)
    "Select entire buffer."
    (evil-range (point-min) (point-max) type))
  (define-key evil-inner-text-objects-map "e" 'evil-buffer-text-object)
  (define-key evil-outer-text-objects-map "e" 'evil-buffer-text-object)

  (define-key evil-normal-state-map "x" 'delete-forward-char)
  (define-key evil-normal-state-map "X" 'delete-backward-char)
  )

(use-package evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :straight t
  :after evil
  :config
  (global-evil-surround-mode 1)
  )

(use-package evil-commentary
  :straight t
  :after evil
  :config
  (evil-commentary-mode)
  )

(provide 'pkg-evil)
