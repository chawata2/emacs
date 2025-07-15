;;; -*- lexical-binding: t; -*-

(use-package copilot
 :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
 :ensure t
 :hook (prog-mode . copilot-mode)
 :config
 (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
 (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
 )

(provide 'pkg-copilot)
