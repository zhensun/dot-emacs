(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3dafeadb813a33031848dfebfa0928e37e7a3c18efefa10f3e9f48d1993598d3" "3c093ea152d7185cc78b61b05e52648c6d2fb0d8579c2119d775630fa459e0be" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(initial-buffer-choice t)
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-custom-commands
   (quote
    (("N" "Notes" tags "NOTE"
      ((org-agenda-overriding-header "Notes")
       (org-tags-match-list-sublevels t)))
     ("h" "Habits" tags-todo "STYLE=\"habit\""
      ((org-agenda-overriding-header "Habits")
       (org-agenda-sorting-strategy
	(quote
	 (todo-state-down effort-up category-keep)))))
     (" " "Agenda"
      ((agenda "" nil)
       (tags "REFILE"
	     ((org-agenda-overriding-header "Tasks to Refile")
	      (org-tags-match-list-sublevels nil)))
       (tags-todo "-CANCELLED/!"
		  ((org-agenda-overriding-header "Stuck Projects")
		   (org-agenda-skip-function
		    (quote bh/skip-non-stuck-projects))
		   (org-agenda-sorting-strategy
		    (quote
		     (priority-down category-keep)))))
       (tags-todo "-HOLD-CANCELLED/!"
		  ((org-agenda-overriding-header "Projects")
		   (org-agenda-skip-function
		    (quote bh/skip-non-projects))
		   (org-agenda-sorting-strategy
		    (quote
		     (priority-down category-keep)))))
       (tags-todo "-CANCELLED/!NEXT"
		  ((org-agenda-overriding-header "Project Next Tasks")
		   (org-agenda-skip-function
		    (quote bh/skip-projects-and-habits-and-single-tasks))
		   (org-tags-match-list-sublevels t)
		   (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
		   (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
		   (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
		   (org-agenda-sorting-strategy
		    (quote
		     (priority-down todo-state-down effort-up category-keep)))))
       (tags-todo "-REFILE-CANCELLED-WAITING-Bill/!"
		  ((org-agenda-overriding-header
		    (if
			(marker-buffer org-agenda-restrict-begin)
			"Project Subtasks" "Standalone Tasks"))
		   (org-agenda-skip-function
		    (quote bh/skip-project-tasks-maybe))
		   (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
		   (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
		   (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
		   (org-agenda-sorting-strategy
		    (quote
		     (category-keep)))))
       (tags-todo "-CANCELLED+WAITING/!"
		  ((org-agenda-overriding-header "Waiting and Postponed Tasks")
		   (org-agenda-skip-function
		    (quote bh/skip-stuck-projects))
		   (org-tags-match-list-sublevels nil)
		   (org-agenda-todo-ignore-scheduled
		    (quote future))
		   (org-agenda-todo-ignore-deadlines
		    (quote future))))
       (tags "-REFILE/"
	     ((org-agenda-overriding-header "Tasks to Archive")
	      (org-agenda-skip-function
	       (quote bh/skip-non-archivable-tasks))
	      (org-tags-match-list-sublevels nil))))
      nil)
     ("r" "Tasks to Refile" tags "REFILE"
      ((org-agenda-overriding-header "Tasks to Refile")
       (org-tags-match-list-sublevels nil)))
     ("#" "Stuck Projects" tags-todo "-CANCELLED/!"
      ((org-agenda-overriding-header "Stuck Projects")
       (org-agenda-skip-function
	(quote bh/skip-non-stuck-projects))))
     ("n" "Next Tasks" tags-todo "-WAITING-CANCELLED/!NEXT"
      ((org-agenda-overriding-header "Next Tasks")
       (org-agenda-skip-function
	(quote bh/skip-projects-and-habits-and-single-tasks))
       (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
       (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
       (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
       (org-tags-match-list-sublevels t)
       (org-agenda-sorting-strategy
	(quote
	 (todo-state-down effort-up category-keep)))))
     ("R" "Tasks" tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
      ((org-agenda-overriding-header "Tasks")
       (org-agenda-skip-function
	(quote bh/skip-project-tasks-maybe))
       (org-agenda-sorting-strategy
	(quote
	 (category-keep)))))
     ("p" "Projects" tags-todo "-HOLD-CANCELLED/!"
      ((org-agenda-overriding-header "Projects")
       (org-agenda-skip-function
	(quote bh/skip-non-projects))
       (org-agenda-sorting-strategy
	(quote
	 (category-keep)))))
     ("w" "Waiting Tasks" tags-todo "-CANCELLED+WAITING/!"
      ((org-agenda-overriding-header "Waiting and Postponed tasks"))
      (org-tags-match-list-sublevels nil))
     ("A" "Tasks to Archive" tags "-REFILE/"
      ((org-agenda-overriding-header "Tasks to Archive")
       (org-agenda-skip-function
	(quote bh/skip-non-archivable-tasks))
       (org-tags-match-list-sublevels nil))))))
 '(org-agenda-default-appointment-duration 60)
 '(org-agenda-files (quote ("~/Documents/radonc.org" "~/org/refile.org")))
 '(org-agenda-fontify-priorities t)
 '(org-agenda-include-diary t)
 '(org-agenda-log-mode-add-notes t)
 '(org-agenda-log-mode-items (quote (closed clock state)))
 '(org-agenda-ndays 1)
 '(org-agenda-prefix-format
   (quote
    ((agenda . "  %-11c%?-12t% s")
     (timeline . "  % s")
     (todo . "  %-11c")
     (tags . "  %-11c"))))
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-restriction-lock-highlight-subtree nil)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down time-up priority-down category-keep)
     (todo priority-down category-keep)
     (tags priority-down category-keep)
     (search category-keep))))
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-start-with-log-mode nil)
 '(org-agenda-text-search-extra-files (quote (agenda-archives)))
 '(org-agenda-use-time-grid t)
 '(org-attach-method (quote mv))
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (plantuml . t)
     (sh . t)
     (python . t)
     (ditaa . t)
     (R . t)
     (dot . t)
     (awk . t))))
 '(org-beamer-theme "Antibes")
 '(org-capture-templates
   (quote
    (("r" "Respond message" entry
      (file "~/org/refile.org")
      "* NEXT Respond to %:from on %:subject :EMAIL:
SCHEDULED: %t
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%a" :immediate-finish t :empty-lines 1 :clock-in t :clock-resume t)
     ("t" "Task" entry
      (file "~/org/refile.org")
      "* TODO %?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%a" :prepend t :empty-lines-after 1)
     ("m" "Meeting" entry
      (file "~/org/refile.org")
      "* MEETING with %? :MEETING:
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :empty-lines 1 :clock-in t :clock-resume t)
     ("n" "Note" entry
      (file "~/org/refile.org")
      "* %? :NOTE:
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%a

%i" :prepend t :empty-lines 1 :clock-in t :clock-resume t)
     ("p" "Phone call" entry
      (file "~/org/refile.org")
      "* PHONE %? :PHONE:
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :empty-lines 1 :clock-in t :clock-resume t)
     ("j" "Journal" entry
      (file+datetree "~/org/diary.org")
      "* %?
%U
" :clock-in t :clock-resume t)
     ("d" "Devotion Notes" entry
      (file+datetree "~/org/daily_devotion.org")
      "* %?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%a

%i" :prepend t :empty-lines 1))))
 '(org-clock-idle-time 10)
 '(org-clock-in-resume t)
 '(org-clock-in-switch-to-state "NEXT")
 '(org-clock-into-drawer "LOGBOOK")
 '(org-clock-persist (quote history))
 '(org-completion-use-ido t)
 '(org-cycle-global-at-bob t)
 '(org-deadline-warning-days 30)
 '(org-default-notes-file "~/org/refile.org")
 '(org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar")
 '(org-edit-src-content-indentation 0)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends (quote (ascii beamer html icalendar latex md)))
 '(org-export-creator-info nil)
 '(org-export-date-timestamp-format "%Y-%m-%d")
 '(org-export-kill-product-buffer-when-displayed t)
 '(org-export-pdf-logfiles
   (quote
    ("aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "fls" "fdb_latexmk")))
 '(org-export-pdf-remove-logfiles t)
 '(org-extend-today-until 4)
 '(org-fontify-done-headline t)
 '(org-insert-heading-respect-content nil)
 '(org-latex-pdf-process
   (quote
    ("pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f")))
 '(org-log-done (quote note))
 '(org-outline-path-complete-in-steps nil)
 '(org-plantuml-jar-path "~/.emacs.d/lisp/plantuml.jar")
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets
   (quote
    ((nil :maxlevel . 9)
     (org-agenda-files :maxlevel . 9))))
 '(org-refile-use-outline-path t)
 '(org-return-follows-link t)
 '(org-reverse-note-order t)
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
 '(org-src-fontify-natively t)
 '(org-tag-alist
   (quote
    ((:startgroup)
     ("@errand" . 101)
     ("@office" . 111)
     ("@home" . 72)
     (:endgroup)
     ("WAITING" . 119)
     ("HOLD" . 104)
     ("PERSONAL" . 80)
     ("WORK" . 87)
     ("FARM" . 70)
     ("ORG" . 79)
     ("NORANG" . 78)
     ("crypt" . 69)
     ("NOTE" . 110)
     ("CANCELLED" . 99)
     ("FLAGGED" . 63))))
 '(org-todo-keyword-faces
   (quote
    (("NEXT" :inherit font-lock-function-name-face :weight bold)
     ("WAITING" . "lightblue")
     ("HOLD" :inherit font-lock-preprocessor-face :weight bold)
     ("CANCELLED" :inherit org-agenda-done :weight bold)
     ("MEETING" :inherit org-agenda-done :weight bold)
     ("PHONE" :inherit org-agenda-done :weight bold))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
     (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))
 '(org-todo-repeat-to-state "NEXT")
 '(org-todo-state-tags-triggers
   (quote
    (("CANCELLED"
      ("CANCELLED" . t))
     ("WAITING"
      ("WAITING" . t))
     ("HOLD"
      ("WAITING" . t)
      ("HOLD" . t))
     (done
      ("WAITING")
      ("HOLD"))
     ("TODO"
      ("WAITING")
      ("CANCELLED")
      ("HOLD"))
     ("NEXT"
      ("WAITING")
      ("CANCELLED")
      ("HOLD"))
     ("DONE"
      ("WAITING")
      ("CANCELLED")
      ("HOLD")))))
 '(org-use-property-inheritance (quote ("AREA")))
 '(org-use-speed-commands t)
 '(org-use-sub-superscripts "{}")
 '(org-use-tag-inheritance t)
 '(org-yank-adjusted-subtrees t)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(sentence-end-double-space nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(smtpmail-smtp-server "smtp.hfhs.org")
 '(smtpmail-smtp-service 25)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
