;;; lang-org.el --- Org-mode config -*- lexical-binding: t -*-
(use-package org
  :ensure nil
  :defer t
  :hook (org-mode . visual-line-mode)      ; 長い行を折り返す
  :custom
  (org-directory "~/org/")
  (org-default-notes-file (expand-file-name "inbox.org" org-directory))
  (org-agenda-files (list org-directory))
  :config
  (setq org-todo-keywords
	'((sequence "TODO(t)" "DOING(d)" "WAIT(w)" "|" "DONE(x)" "CANCELED(c)")))

  (setq org-log-done 'time) ;; DONEした日時を記録
  (setq org-log-into-drawer t)   ;; ログは :LOGBOOK: の中にしまう

  (setq org-capture-templates
		`(
          ;; とりあえずメモ
          ("i" "Quick Inbox" entry
           (file ,(expand-file-name "inbox.org" org-directory))
           "* %U %?\n")

		  ;; タスク
		  ("t" "Task" entry
           (file ,(expand-file-name "task.org" org-directory))
           "* TODO %?\nSCHEDULED: %^t\n")
          ))
  )

(provide 'lang-org)
