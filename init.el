
(unless noninteractive
  (message "Loading %s..." load-file-name))
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(require 'package)

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

(require 'use-package)

(use-package diminish
  :ensure diminish)

(use-package htmlize
  :ensure htmlize)

(defun customize-evil-escape()
  (progn
    (define-key evil-insert-state-map "j" #'cofi/maybe-exit)
    (evil-define-command cofi/maybe-exit ()
      :repeat change
      (interactive)
      (let ((modified (buffer-modified-p)))
        (insert "j")
        (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
                   nil 0.5)))
          (cond
           ((null evt) (message ""))
           ((and (integerp evt) (char-equal evt ?k))
        (delete-char -1)
        (set-buffer-modified-p modified)
        (push 'escape unread-command-events))
           (t (setq unread-command-events (append unread-command-events
                              (list evt))))))))))

(use-package evil
  :ensure evil
  :init (evil-mode 1)
  :config
  (progn
    (customize-evil-escape)
    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" hollow))))

(use-package evil-leader
  :ensure evil-leader
  :init
    (global-evil-leader-mode)
  :config
  (progn
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "e" 'find-file
      "b" 'switch-to-buffer
      "k" 'kill-buffer)))

(use-package evil-org
  :ensure evil-org
  :diminish evil-org-mode)

(use-package linum-relative
  :ensure linum-relative
  :init (global-linum-mode)
  )

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
  :diminish magit-auto-revert-mode
  :config
  (evil-leader/set-key "g" 'magit-status)
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package org-redmine
  :ensure org-redmine
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-redmine-uri "http://hfhsroweb04:3000/"))

(use-package mediawiki
  :ensure mediawiki)

;(use-package zenburn-theme
;  :ensure zenburn-theme)
  ;:init
  ;(load-theme 'zenburn t))
(use-package solarized-theme
  :ensure solarized-theme
  :init
  (load-theme 'solarized-dark t))
