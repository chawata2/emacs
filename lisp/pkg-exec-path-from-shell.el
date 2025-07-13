;;; -*- lexical-binding: t; -*-

(use-package exec-path-from-shell
  :straight t
  :config
  (when (memq window-system '(mac ns x))
	(exec-path-from-shell-initialize))
  (when (daemonp)
	(exec-path-from-shell-initialize))
  )

(provide 'pkg-exec-path-from-shell)
