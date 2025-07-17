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
  (require 'gptel-org)
  ;; Emacs でパスフレーズを訊く
  (setq epa-pinentry-mode 'loopback
		epg-pinentry-mode 'loopback)

  ;; pass にも loopback を伝える
  (setenv "PASSWORD_STORE_GPG_OPTS" "--pinentry-mode=loopback")

  (setq gptel-api-key (lambda ()
						(auth-source-pass-get 'secret "openai-key")))

  (setq gptel-default-mode 'org-mode)
  ;; (setq gptel-org-branching-context t)
  ;; (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
  ;; (setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n")

  (gptel-make-tool
   :name "read_buffer"
   :function (lambda (buffer)
			   (unless (buffer-live-p (get-buffer buffer))
				 (error "Buffer %s does not exist" buffer))
			   (with-current-buffer buffer
				 (buffer-substring-no-properties (point-min) (point-max))))
   :description "return the contents of an emacs buffer"
   :args (list '(:name "buffer"
					   :type string
					   :description "the name of the buffer whose containts ar to be retrieved"
					   ))
   :category "emacs")

  )

(provide 'pkg-chatgpt-shell)
