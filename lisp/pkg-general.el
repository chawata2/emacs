;;; -*- lexical-binding: t; -*-

(use-package general
  :straight t
  :demand t
  :config

  (general-create-definer my/leader-keys
    :states '(normal visual emacs)
	:keymaps 'override
    :prefix "SPC"
    :non-normal-prefix "M-SPC")

  (my/leader-keys
    ;; ファイル操作
    "f"  '(:ignore t :which-key "files")
    "ff" '(find-file :which-key "find file")

   ;; バッファfiles
    "b"  '(:ignore t :which-key "buffers")
    "bb" '(consult-buffer :which-key "switch")
    "bk" '(kill-buffer      :which-key "kill")

    ;; git
    "g"  '(:ignore t :which-key "git")
    "gg" '(magit-status      :which-key "status (here)")
    "gb" '(magit-blame-addition :which-key "blame")
    "gl" '(magit-log-buffer-file :which-key "file log")

    ;; project
    "p"  '(:ignore t :which-key "project")
    "pp" '(consult-projectile-switch-project :which-key "switch")
    "pf" '(consult-projectile-find-file     :which-key "find file")
    "e" '(consult-projectile-find-file     :which-key "project find file")
    "pg" '(consult-ripgrep                  :which-key "grep")

	;; embark
	"a"  '(embark-act     :which-key "embark act")
	"A"  '(embark-dwim    :which-key "embark dwim")

	;; activities
	"TAB" '(:ignore t :which-key "activities")
	"TAB TAB" '(activities-resume :which-key "resume")
	"TAB n" '(activities-new :which-key "new")
	"TAB d" '(activities-define :which-key "define")
	"TAB s" '(activities-suspend :which-key "suspend")
	"TAB k" '(activities-kill :whitch-key "kill")
	"TAB RET" '(activities-switch :whitch-key "switch")
	"TAB l" '(activities-list :whitch-key "list")

	;; org
	"o" '(:ignore t :which-key "org")
	"oc" '(org-capture :which-key "org-capture")
	"oa" '(org-capture :which-key "org-agenda")

	;; eat
	"t" '(:ignore t :which-key "eat terminal")
	"to" '(eat :which-key "eat")
	"tj" '(my/open-eat-below :which-key "open-eat-below")

	;; chatgpt-shell
	"c" '(:ignore t :which-key "chatgpt-shell")
	"cc" '(chatgpt-shell :which-key "chatgpt-shell")
	"cp" '(chatgpt-shell-prompt-compose :which-key "prompt-compose")
    )

  ;; eat terminal のキーバインド
  (with-eval-after-load 'eat
	;;
	(general-def
      :states '(insert normal visual)
      :keymaps 'eat-semi-char-mode-map
      "C-c p" #'eat-yank))

  ;; chatgpt-shell-prompt-compose のキーバインド
  (with-eval-after-load 'chatgpt-shell-prompt-compose
	(general-def
      :states '(insert normal visual)
      :keymaps 'chatgpt-shell-prompt-compose-mode-map
      "C-c C-c" #'chatgpt-shell-prompt-compose-send-buffer
      "C-c C-k" #'chatgpt-shell-prompt-compose-cancel
      "C-c C-s" #'chatgpt-shell-prompt-compose-swap-system-prompt
      "C-c C-v" #'chatgpt-shell-prompt-compose-swap-model-version
      "C-c C-o" #'chatgpt-shell-prompt-compose-other-buffer
      "M-r" #'chatgpt-shell-prompt-compose-search-history
      "M-p" #'chatgpt-shell-prompt-compose-previous-history
      "M-n" #'chatgpt-shell-prompt-compose-next-history)

	;; chatgpt-shell-prompt-compose-view-mode のキーバインド
	(general-def
      :states '(normal visual)
      :keymaps 'chatgpt-shell-prompt-compose-view-mode-map
      "n" #'chatgpt-shell-prompt-compose-next-item
      "p" #'chatgpt-shell-prompt-compose-previous-item
      "TAB" #'chatgpt-shell-prompt-compose-next-item
      "S-TAB" #'chatgpt-shell-prompt-compose-previous-item
      "r" #'chatgpt-shell-prompt-compose-reply
      "m" #'chatgpt-shell-prompt-compose-request-more
      "q" #'chatgpt-shell-prompt-compose-quit-and-close-frame
      "e" #'chatgpt-shell-prompt-compose-request-entire-snippet))
)

(provide 'pkg-general)
