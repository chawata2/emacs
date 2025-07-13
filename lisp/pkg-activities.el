;;; -*- lexical-binding: t; -*-

(use-package activities
  :straight t
  :init
  (activities-mode)
  (activities-tabs-mode)
  ;; Prevent `edebug' default bindings from interfering.
  (setq edebug-inhibit-emacs-lisp-mode-bindings t)
  )

(provide 'pkg-activities)
