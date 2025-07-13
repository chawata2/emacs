;;; -*- lexical-binding: t; -*-

(use-package isearch
  :ensure nil
  :custom
  (isearch-lazy-count t)                  ;; Enable lazy counting to show current match information.
  (lazy-count-prefix-format "(%s/%s) ")   ;; Format for displaying current match count.
  (lazy-count-suffix-format nil)          ;; Disable suffix formatting for match count.
  (search-whitespace-regexp ".*?")        ;; Allow searching across whitespace.
  )

(provide 'pkg-isearch)
