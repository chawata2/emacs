;;; -*- lexical-binding: t; -*-

(use-package shell-maker
  :straight (:type git :host github :repo "xenodium/shell-maker"))

(use-package chatgpt-shell
  :straight (:type git :host github :repo "xenodium/chatgpt-shell" :files ("chatgpt-shell*.el"))
  :defer t
  :config
  ;; Emacs でパスフレーズを訊く
  (setq epa-pinentry-mode 'loopback
		epg-pinentry-mode 'loopback)

  ;; pass にも loopback を伝える
  (setenv "PASSWORD_STORE_GPG_OPTS" "--pinentry-mode=loopback")

  (setq chatgpt-shell-openai-key (lambda ()
								   (auth-source-pass-get 'secret "openai-key")))

  ;; chatgpt-shell のログファイルの保存先
  (setq shell-maker-transcript-default-path
		(expand-file-name "chatgpt-logs/" user-emacs-directory))

  ;; 常に新しいシェルを作成しない
  ;; chatgpt-shellで二重にシェルを作成しないようにする
  (setq chatgpt-shell-always-create-new nil)

  ;; ディレクトリが存在しない場合は作成する
  (unless (file-exists-p shell-maker-transcript-default-path)
	(make-directory shell-maker-transcript-default-path t))
  )

(use-package gptel
  :straight t
  :config
  ;; Emacs でパスフレーズを訊く
  (setq epa-pinentry-mode 'loopback
		epg-pinentry-mode 'loopback)

  ;; pass にも loopback を伝える
  (setenv "PASSWORD_STORE_GPG_OPTS" "--pinentry-mode=loopback")

  (setq gptel-api-key (lambda ()
						(auth-source-pass-get 'secret "openai-key")))
  )

(provide 'pkg-chatgpt-shell)
