;;; init.el --- Emacs config -*- lexical-binding: t; -*-
(setq user-emacs-directory (file-name-directory load-file-name))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ガベージコレクションの閾値を上げる
(setq gc-cons-threshold #x40000000)

;; Set the maximum output size for reading process output, allowing for larger data transfers.
(setq read-process-output-max (* 1024 1024 4))

(setq package-enable-at-startup nil) ;; Disables the default package manager.

;; Bootstraps `straight.el'
(setq straight-check-for-modifications nil)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
  ;; :type '(repeat symbol))
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package '(project :type built-in))
(straight-use-package 'use-package)

(require 'package)
(add-to-list 'package-archives
 '(("melpa"  . "https://melpa.org/packages/")
   ("nongnu" . "https://elpa.nongnu.org/nongnu/")
   ("gnu"    . "https://elpa.gnu.org/packages/")))
;; Buildin packages
(require 'pkg-emacs)
(require 'pkg-isearch)
(require 'pkg-smerge-mode)
(require 'pkg-eldoc)
(require 'pkg-desktop)

;; Load path
(require 'pkg-exec-path-from-shell)

;; UI
(require 'pkg-catppuccin-theme)
(require 'pkg-doom-modeline)

;; Core packages
(require 'pkg-vertico)
(require 'pkg-orderless)
(require 'pkg-marginalia)
(require 'pkg-consult)
(require 'pkg-embark)
(require 'pkg-corfu)
(require 'pkg-projectile)
(require 'pkg-activities)
(require 'pkg-eat)
(require 'pkg-undo-fu)
(require 'pkg-undo-fu-session)
(require 'pkg-rainbow-delimiters)
(require 'pkg-rg)
(require 'pkg-wgrep)

;; External package
(require 'pkg-magit)
(require 'pkg-diff-hl)
(require 'pkg-indent-guide)
(require 'pkg-copilot)
(require 'pkg-gptel)

;; Language config
(require 'lang-org)

;; Keybindings
(require 'pkg-evil)
(require 'pkg-general)
(require 'pkg-which-key)
