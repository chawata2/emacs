;;; -*- lexical-binding: t; -*-

;; 補完ポップアップ
(use-package corfu
  :straight t
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 1)           ; 1 文字入力で自動ポップ
  (corfu-auto-delay 0)
  (corfu-cycle t)                 ; TAB で循環
  (corfu-preselect-first nil)     ; 候補を自動選択しない
  (corfu-quit-no-match t)
  :init
  (global-corfu-mode 1)           ; すべてのバッファで有効
  ;; TTY の場合は corfu-terminal を追加で
  (unless (display-graphic-p)
    (use-package corfu-terminal
      :straight t
      :config (corfu-terminal-mode 1)))

  :config
  ;; RETで選択候補を確定しない
  (keymap-set corfu-map "RET" `( menu-item "" nil :filter
                                 ,(lambda (&optional _)
                                    (and (derived-mode-p 'eshell-mode 'comint-mode)
                                         #'corfu-send))))
  )

(use-package corfu-popupinfo
  :ensure nil
  :hook (corfu-mode . corfu-popupinfo-mode))

(use-package cape
  :straight t
  :init
  (dolist (fn '(cape-file            ; ファイル名
				cape-dabbrev         ; バッファ内単語
                cape-keyword         ; major / minor 専用キーワード
                cape-tex             ; TeX コマンド (Tex-mode系)
				))
    (add-to-list 'completion-at-point-functions fn)))

(provide 'pkg-corfu)
