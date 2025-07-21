;;; -*- lexical-binding: t; -*-

(use-package copilot
 :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
 :ensure t
 :hook (prog-mode . copilot-mode)
 :config
 (with-eval-after-load 'copilot
   (define-key copilot-completion-map (kbd "C-c t") #'copilot-mode)
   (define-key copilot-completion-map (kbd "C-c c") #'copilot-accept-completion)
   (define-key copilot-completion-map (kbd "C-c l") #'copilot-accept-completion-by-line)
   (define-key copilot-completion-map (kbd "C-c w") #'copilot-accept-completion-by-word)
   )
 )

(provide 'pkg-copilot)
