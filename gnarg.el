(setq ns-command-modifier 'meta)
(setq-default tab-width 4)

(defun comment-or-uncomment-line (&optional lines)
  "Comment current line. Argument gives the number of lines
forward to comment"
  (interactive "P")
  (comment-or-uncomment-region
   (line-beginning-position)
   (line-end-position lines)))

(defun comment-or-uncomment-region-or-line (&optional lines)
  "If the line or region is not a comment, comments region
if mark is active, line otherwise. If the line or region
is a comment, uncomment."
  (interactive "P")
  (if mark-active
      (if (< (mark) (point))
	  (comment-or-uncomment-region (mark) (point))
	(comment-or-uncomment-region (point) (mark))
	)
    (comment-or-uncomment-line lines)))

(global-set-key [(meta /)] 'comment-or-uncomment-region-or-line)
(global-set-key [(meta \\)] 'hippie-expand)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/jump.el"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/rinari"))
(require 'rinari)

;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/erlang.el"))
(setq load-path (cons  "/usr/local/Cellar/erlang/R15B03-1/lib/erlang/lib/tools-2.6.8/emacs"
                       load-path))
(setq erlang-root-dir "/usr/local/Cellar/erlang/R15B03-1")
(setq exec-path (cons "/usr/local/Cellar/erlang/R15B03-1/bin" exec-path))
(require 'erlang-start)

(global-auto-revert-mode)

(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)

(require 'minimap)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/yeti-mode.el"))
(autoload 'yeti-mode "yeti-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yeti$" . yeti-mode))

(add-to-list 'load-path (concat dotfiles-dir "/vendor/emacs-eclim/"))
(require 'eclim)
(global-eclim-mode)
(require 'eclimd)

;; regular auto-complete initialization
(add-to-list 'load-path (concat dotfiles-dir "/vendor/auto-complete/"))
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

;; (require 'company)
;; (require 'company-emacs-eclim)
;; (company-emacs-eclim-setup)
;; (global-company-mode t)

;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/highlight-symbol.el"))
;; (require 'highlight-symbol)

;; (add-to-list 'load-path "~/.emacs.d/vendor/")
;; (require 'peepopen)

;; autotest
;(require 'unit-test)
;(require 'toggle)
;(require 'autotest)

(defun find-usage ()
  ; tags-search for symbol at point
  (interactive)
  (tags-search (thing-at-point 'symbol)))

(global-set-key [(meta -)] 'find-usage)

;; (add-to-list 'load-path (concat dotfiles-dir "/redspace.el"))
;; (require 'redspace)
