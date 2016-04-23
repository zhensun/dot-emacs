(add-to-list 'load-path "~/.emacs.d/site-lisp")
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(if (string-equal system-type "windows-nt")
      (add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
  (progn
    (add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
    (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(use-package initsplit
  :ensure t)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(winner-mode 1)

(use-package diminish
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package swiper
  :ensure t
  :config (progn
            (ivy-mode 1)
            (setq ivy-use-virtual-buffers t)
            (setq magit-completing-read-function 'ivy-completing-read))
  :bind (("C-s" . swiper)
         ("C-x C-f" . counsel-find-file)
         ("C-c C-r" . ivy-resume)))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)))

(use-package hydra
  :ensure t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(global-set-key "\C-w" 'backward-kill-word)

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-." . ace-jump-mode))

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))

(use-package magit
  :ensure magit
  :bind ("C-x g" . magit-status))

(use-package rbt
  :ensure t)

(use-package org
  :ensure org
  :mode ("\\.org\\'" . org-mode)
  :commands (org-agenda org-agenda-list org-mode)
  :bind ("<f12>" . org-agenda)
  :config (progn
            (load "init-org")
            (load "test-org")))

(use-package org-redmine
  :ensure org-redmine
  :mode ("\\.org\\'" . org-mode)
  :config (setq org-redmine-uri "http://hfhsroweb04:3000/"))

(use-package mediawiki
  :ensure mediawiki)

(use-package haskell-mode
  :ensure haskell-mode
  :config
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))

;; (use-package puml-mode
;;   :ensure puml-mode)

(use-package ledger-mode
  :ensure 
  :mode ("\\.ledger\\'" . ledger-mode))

(use-package csharp-mode
  :ensure t
  :mode ("\\.cs\\'" . csharp-mode))

(use-package powershell
  :ensure t)

(use-package leuven-theme
  :ensure t
  :config
  (load-theme 'leuven t))

(use-package smart-mode-line
  :ensure t
  :config (sml/setup))
