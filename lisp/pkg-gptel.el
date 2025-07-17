;;; -*- lexical-binding: t; -*-

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
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "** ")

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

(provide 'pkg-gptel)
