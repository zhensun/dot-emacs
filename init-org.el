;; Configurations for Org-Mode
(load "org-settings")
(require 'org)
(require 'org-habit)
(require 'org-agenda)
(require 'ox-beamer)
(require 'ox-latex)
(setq org-export-latex-listings t)
(setq org-startup-indented t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Originally taken from Bruno Tavernier: http://thread.gmane.org/gmane.emacs.orgmode/31150/focus=31432
;; but adapted to use latexmk 4.20 or higher.
(defun my-auto-tex-cmd (buffer-string)
  "When exporting from .org with latex, automatically run latex,
pdflatex, or xelatex as appropriate, using latexmk."
  (let ((texcmd)))
  ;; default command: oldstyle latex via dvi
  (setq texcmd "latexmk -pdf -quiet %f")
  ;; pdflatex -> .pdf
  (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
      (setq texcmd "latexmk -pdf -quiet %f"))
  ;; xelatex -> .pdf
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq texcmd "latexmk -pdflatex=xelatex -pdf -quiet %f"))
  ;; LaTeX compilation command
  (setq org-latex-pdf-process (list texcmd)))

(add-hook 'org-export-before-processing-hook 'my-auto-tex-cmd)

(add-to-list 'org-latex-classes
             '("org-latex-cn"
               "\\documentclass[11pt]{article}
               \\usepackage{xeCJK}
               \\setmainfont{Garamond}
               \\setCJKmainfont[BoldFont={STHeiti},ItalicFont={STKaiti}]{STFangsong}
               \\setlength{\\parindent}{4em}
               \\usepackage{fancyvrb}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass[presentation]{beamer}
\[DEFAULT-PACKAGES]
\[PACKAGES]
\[EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
             '("beamer-cn"
               "\\documentclass[presentation]{beamer}
               \\usepackage{xeCJK}
               \\setmainfont{Garamond}
               \\setCJKmainfont[BoldFont={STHeiti},ItalicFont={STKaiti}]{STFangsong}
\[DEFAULT-PACKAGES]
\[PACKAGES]
\[EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
             '("koma-article"
               "\\documentclass{scrartcl}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)
(setq org-default-notes-file "~/org/notes.org")
(define-key global-map "\C-cc" 'org-capture)

;; (defvar org-mode-completion-keys
;;   '((?d . "DONE")
;;     (?g . "DELEGATED")
;;     (?n . "NOTE")
;;     (?r . "DEFERRED")
;;     (?s . "STARTED")
;;     (?t . "TODO")
;;     (?w . "WAITING")
;;     (?x . "CANCELED")
;;     (?y . "SOMEDAY")
;;     ))

;; (defvar org-todo-state-map nil)
;; (define-prefix-command 'org-todo-state-map)

;; if there is a #+ATTR.*: width="200", resize to 200, otherwise
;; resize to 400
(setq org-image-actual-width '(400))

(defun org-agenda-3-days-view (&optional day-of-year)
  "Switch to 3-days (yesterday, today, tomorrow) view for agenda."
  (interactive "P")
  (org-agenda-check-type t 'agenda)
  (if (and (not day-of-year) (equal org-agenda-current-span 3))
      (error "Viewing span is already \"%s\"" 3))
  (let* ((sd (or day-of-year
                 (org-get-at-bol 'day)
                 (time-to-days (current-time))))
         (sd (and sd (1- sd)))
         (org-agenda-overriding-arguments
          (or org-agenda-overriding-arguments
              (list (car (get-text-property (point) 'org-last-args)) sd 3 t))))
    (org-agenda-redo)
    (org-agenda-find-same-or-today-or-agenda))
  (org-agenda-set-mode-name)
  (message "Switched to %s view" 3))

(defun init--org-agenda-mode ()
  (define-key org-agenda-mode-map "D" 'org-agenda-3-days-view)
  (define-key org-agenda-mode-map "M" 'org-agenda-month-view))

;; MobilOrg
(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(add-hook 'org-agenda-mode-hook 'init--org-agenda-mode)

(defun sacha/org-agenda-done (&optional arg)
  "Mark current TODO as done.
This changes the line at point, all other lines in the agenda referring to
the same tree node, and the headline of the tree node in the Org-mode file."
  (interactive "P")
  (org-agenda-todo "DONE"))
;; Override the key definition for org-exit
(define-key org-agenda-mode-map "x" 'sacha/org-agenda-done)

(defun sacha/org-agenda-mark-done-and-add-followup ()
  "Mark the current TODO as done and add another task after it.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
  (interactive)
  (org-agenda-todo "DONE")
  (org-agenda-switch-to)
  (org-capture 0 "t"))
;; Override the key definition
(define-key org-agenda-mode-map "X" 'sacha/org-agenda-mark-done-and-add-followup)

(defun sacha/org-agenda-new ()
  "Create a new note or task at the current agenda item.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
  (interactive)
  (org-agenda-switch-to)
  (org-capture 0))
;; New key assignment
(define-key org-agenda-mode-map "N" 'sacha/org-agenda-new)

(use-package orgbox
  :disabled t
  :ensure orgbox)

(provide 'init-org)
;;; init-org ends here
