(require 'cl)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; the package manager
(require 'package)
(setq
  use-package-always-ensure t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package evil
             :demand)
(evil-mode 1)

(use-package ensime
  :commands ensime ensime-mode)
(add-hook 'scala-mode-hook 'ensime-mode)
(setq exec-path (append exec-path '("/usr/local/bin")))

(use-package linum-relative
             :demand)
(linum-relative-toggle)
(setq linum-relative-current-symbol "")
(global-set-key (kbd "C-c n") 'linum-relative-toggle)

(use-package web-mode
             :demand)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))

(use-package fiplr)
(global-set-key (kbd "C-x f") 'fiplr-find-file-with-gitignore)

(use-package neotree)
(global-set-key (kbd "C-x t") 'neotree-toggle)

(use-package windmove)
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)

;(use-package key-chord)
;(key-chord-define evil-normal-state-map ",," 'evil-force-normal-state)
;(key-chord-define evil-visual-state-map ",," 'evil-change-to-previous-state)
;(key-chord-define evil-insert-state-map ",," 'evil-normal-state)
;(key-chord-define evil-replace-state-map ",," 'evil-normal-state)
;(key-chord-mode +1)

(bind-key* "C-e" 'evil-force-normal-state)

(use-package elixir-mode)


(defun x-select-text (text))
(setq x-select-enable-clipboard nil)
(setq x-select-enable-primary nil)
(setq mouse-drag-copy-region nil)

(setq interprogram-cut-function 'ns-set-pasteboard)
(setq interprogram-paste-function 'ns-get-pasteboard)


(defun custom-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook  'custom-web-mode-hook)

;(use-package noctilux)
;(load-theme 'noctilux t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode -1)
(global-linum-mode 1) ; display line numbers
(column-number-mode 1) ; display column/row of cursor in mode-line
(show-paren-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'text-mode-hook
          (lambda ()
            ;; Hard-wrap text when in plaintext mode
            (turn-on-auto-fill)))

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Stop littering everywhere with save files, put them somewhere
(setq backup-directory-alist '(("." . "~/.emacs-backups")))

;; Really nice completion for commands and whatnot
(ido-mode 1)

;; Use company-mode in all buffers (more completion)
(add-hook 'after-init-hook 'global-company-mode)

;; Remember what I had open when I quit
(desktop-save-mode 1)

;; disable bell
(setq ring-bell-function 'ignore)

;; some simple setup for getting started
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; this can get annoying
(global-unset-key (kbd "C-z"))
