;;; -*- lexical-binding: t; -*-

;; Asyc shell command のバッファに自動で移動してnormalモードにする
(defun my/async-shell-command-display (buffer _alist)
  (let ((win (display-buffer-pop-up-window buffer nil)))
    (select-window win)
    (evil-normal-state)
    win))

;; (add-to-list 'display-buffer-alist
;;              '("\\*Async Shell Command\\*.*" . (my/async-shell-command-display)))

(provide 'misc)
