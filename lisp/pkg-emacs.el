;;; -*- lexical-binding: t; -*-

(use-package emacs
  :ensure nil
  :custom
  (column-number-mode t)                    ;; Diplay the column number in the mode line.
  (auto-save-default nil)                   ;; Disable automatic saving of buffers.
  (create-lockfiles nil)                    ;; Prevent the creation of lock files when editing.
  (delete-by-moving-to-trash t)             ;; Move deleted files to the trash instead of permanently deleting them.
  (delete-selection-mode 1)                 ;; Enable replacing selected text with typed text.
  (display-line-numbers-type t)             ;; Use absolute line numberig in programming modes.
  (global-auto-revert-non-file-buffers t)   ;; Automatically refresh non-file buffers.
  (history-length 25)                       ;; Set the length of the command history.
  (inhibit-startup-message t)               ;; Disable the startup message when Emacs launches.
  (initial-scratch-message "")              ;; Clear the initial message in the *scratch* buffer.
  (ispell-dictionary "en_US")               ;; Set the default dictionary for spell checking.
  (make-backup-files nil)                   ;; Disable creation of backup files.
  (pixel-scroll-precision-mode t)           ;; Enable precise pixel scrolling.
  (pixel-scroll-precision-use-momentum nil) ;; Disable momentum scrolling.
  (ring-bell-function 'ignore)              ;; Disable the audible bell.
  (split-width-threshold 300)               ;; Prevent automatic window splitting if the window width exceeds 300 pixels.
  (switch-to-buffer-obey-display-actions t) ;; Make buffer switching respect display actions.
  (tab-always-indent nil)                   ;; Make the TAB key complete text instead of just indenting.
  (tab-width 4)                             ;; Set the tab width to 4 spaces.
  (treesit-font-lock-level 4)               ;; Use advanced font locking for Treesit mode.
  (truncate-lines t)                        ;; Enable line truncation to avoid wrapping long lines.
  (use-dialog-box nil)                      ;; Disable dialog boxes in favor of minibuffer prompts.
  (use-short-answers t)                     ;; Use short answers in prompts for quicker responses (y instead of yes)
  (warning-minimum-level :emergency)        ;; Set the minimum level of warning to display.
  (confirm-kill-emacs #'y-or-n-p)           ;; Enable confirm when kill Emacs.
  (confirm-kill-processes nil)              ;; Disable confirm when kill Emacs with child process.
  (frame-resize-pixelwise t)                ;; ピクセル単位でフレームをリサイズ
  (frame-inhibit-implied-resize t)          ;; 文字サイズ変更などで勝手に縮まないようにする（任意）
  :hook
  (before-save . delete-trailing-whitespace) ;; Delete trailing whitespacs with save.
  ;; (prog-mode . display-line-numbers-mode)    ;; Enable line numbers in prog mode.
  :init
  (menu-bar-mode  -1)          ;; Disable the menu bar.
  (tool-bar-mode  -1)          ;; Disable the tool bar.
  (scroll-bar-mode -1)         ;; Disable the scroll bar
  (global-hl-line-mode 1)      ;; Enable highlight of the current line.
  (global-auto-revert-mode 1)  ;; Enable global auto-revert mode to keep buffers up to date with their corresponding files.
  (indent-tabs-mode -1)        ;; Disable the use of tabls for indentation (use spaces instead).
  (recentf-mode 1)             ;; Enable tracking of recently opened files.
  (savehist-mode 1)            ;; Enable saving of command history.
  (save-place-mode 1)          ;; Enable saving the place in files for easier return.
  (winner-mode 1)              ;; Enable winner mode to easily undo window configration changes.
  (xterm-mouse-mode 1)         ;; Enable mouse support in terminal mode.
  (file-name-shadow-mode 1)    ;; Enable shadowing of filenames for clarity.
  (show-paren-mode 1)          ;; 括弧をハイライト
  (electric-pair-mode 1)       ;; 括弧を補完

  ;; Set the default coding system for files to UTF-8.
  (modify-coding-system-alist 'file "" 'utf-8)

  ;; Fullscreen when startup.
  ;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; Save custom setting in custom.el.
  (setq custom-file (locate-user-emacs-file "custom.el"))
  (load custom-file :noerror)

  :config
  ;; (set-face-attribute 'default nil :family "更紗等幅ゴシック J"  :Height 130)
  (set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 120)
  (when (eq system-type 'darwin)       ;; Check if the system is macOS.
    (setq mac-command-modifier 'meta)  ;; Set the Command key to act as the Meta key.
    (set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 120))

  ;; 高速化の設定
  (setq vc-handled-backends '(Git))                     ;; vcのバックエンドをGitのみに変更
  (setq auto-mode-case-fold nil)                        ;; ファイル検索を2回行わないようにする
  (setq idle-update-delay 1.0)                          ;; UIの更新頻度を下げる
  (setq-default bidi-display-reordering 'left-to-right) ;; 双方向の並び替えを抑制する
  (setq bidi-inhibit-bpa t)                             ;; 長い行の双方向スキャン
  (setq-default cursor-in-non-selected-windows nil)     ;; フォーカスされていないウィンドウのカーソルを削除
  (setq highlight-nonselected-windows nil)
  (setq fast-but-imprecise-scrolling t)                 ;; 高速なスクロール
  (setq ffap-machine-p-known 'reject)                   ;; ドメインにpingを送信しない
  )

(provide 'pkg-emacs)
