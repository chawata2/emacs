;;; -*- lexical-binding: t; -*-

(use-package activities
  :straight t
  :bind
  (("C-c C-a n" . activities-new)
   ("C-c C-a d" . activities-define)
   ("C-c C-a s" . activities-suspend)
   ("C-c C-a k" . activities-kill)
   ("C-c C-a l" . activities-list)
   ("C-c C-a r" . activities-resume)
   ("C-c C-a RET" . activities-switch))
  :init
  (activities-mode)
  (activities-tabs-mode)
  ;; Prevent `edebug' default bindings from interfering.
  (setq edebug-inhibit-emacs-lisp-mode-bindings t)
  )

(provide 'pkg-activities)
