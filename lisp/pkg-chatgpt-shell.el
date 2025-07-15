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
                              (auth-source-pass-get 'secret "openai-key"))))

(provide 'pkg-chatgpt-shell)
