(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-auto-exclude-function (quote bh/org-auto-exclude-function))
 '(org-agenda-cmp-user-defined (quote bh/agenda-sort))
 '(org-agenda-compact-blocks t)
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
		   (org-agenda-todo-ignore-scheduled t)
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
		     (priority-down category-keep)))))
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
 '(org-agenda-diary-file "~/OneDrive - Henry Ford Health System/org/diary.org")
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-files
   (quote
    ("~/OneDrive - Henry Ford Health System/org" "~/OneDrive/org")))
 '(org-agenda-fontify-priorities t)
 '(org-agenda-include-diary nil)
 '(org-agenda-log-mode-add-notes t)
 '(org-agenda-log-mode-items (quote (closed state)))
 '(org-agenda-ndays 1)
 '(org-agenda-persistent-filter t)
 '(org-agenda-prefix-format
   (quote
    ((agenda . "  %-11c%?-12t% s")
     (timeline . "  % s")
     (todo . "  %-11c")
     (tags . "  %-11c"))))
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-restriction-lock-highlight-subtree nil)
 '(org-agenda-skip-additional-timestamps-same-entry nil)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down time-up user-defined-up priority-down effort-up category-keep)
     (todo category-up priority-down effort-up)
     (tags category-up priority-down effort-up)
     (search category-up))))
 '(org-agenda-start-on-weekday 7)
 '(org-agenda-start-with-log-mode nil)
 '(org-agenda-sticky t)
 '(org-agenda-tags-column -100)
 '(org-agenda-tags-todo-honor-ignore-options t)
 '(org-agenda-text-search-extra-files (quote (agenda-archives)))
 '(org-agenda-time-grid
   (quote
    ((daily today remove-match)
     #("----------------" 0 16
       (org-heading t))
     (700 900 1100 1300 1500 1700))))
 '(org-agenda-use-time-grid t)
 '(org-agenda-window-setup (quote current-window))
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
 '(org-blank-before-new-entry (quote ((heading) (plain-list-item . auto))))
 '(org-capture-templates
   (quote
    (("o" "Outlook" entry
      (file "~/OneDrive - Henry Ford Health System/org/refile.org")
      "* NEXT Respond to %:sender on %:title :EMAIL:
SCHEDULED: %t
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%c" :immediate-finish t :empty-lines 1 :clock-in t :clock-resume t)
     ("r" "Respond message" entry
      (file "~/OneDrive - Henry Ford Health System/org/refile.org")
      "* NEXT Respond to %:from on %:subject :EMAIL:
SCHEDULED: %t
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%a" :immediate-finish t :empty-lines 1 :clock-in t :clock-resume t)
     ("t" "Task" entry
      (file "~/OneDrive - Henry Ford Health System/org/refile.org")
      "* TODO %?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%a
%i" :prepend t :empty-lines-after 1 :clock-in t :clock-resume t)
     ("m" "Meeting" entry
      (file "~/OneDrive - Henry Ford Health System/org/refile.org")
      "* MEETING with %? :MEETING:
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :empty-lines 1 :clock-in t :clock-resume t)
     ("n" "Note" entry
      (file "~/OneDrive - Henry Ford Health System/org/refile.org")
      "* %? :NOTE:
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%a

%i" :prepend t :empty-lines 1 :clock-in t :clock-resume t)
     ("p" "Phone call" entry
      (file "~/OneDrive - Henry Ford Health System/org/refile.org")
      "* PHONE %? :PHONE:
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :empty-lines 1 :clock-in t :clock-resume t)
     ("j" "Journal" entry
      (file+datetree "~/OneDrive - Henry Ford Health System/org/diary.org")
      "* %?
%U
" :clock-in t :clock-resume t)
     ("d" "Devotion Notes" entry
      (file+datetree "~/OneDrive/org/daily_devotion.org")
      "* %?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:

%a

%i" :prepend t :empty-lines 1))))
 '(org-clock-auto-clock-resolution (quote when-no-clock-is-running) nil nil "Enable auto clock resolution for finding open clocks")
 '(org-clock-history-length 23)
 '(org-clock-idle-time 10)
 '(org-clock-in-resume t)
 '(org-clock-in-switch-to-state (quote bh/clock-in-to-next))
 '(org-clock-into-drawer t)
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-out-when-done t nil nil "Clock out when moving task to a done state")
 '(org-clock-persist t)
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-clone-delete-id t)
 '(org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
 '(org-completion-use-ido t)
 '(org-cycle-global-at-bob t)
 '(org-deadline-warning-days 30)
 '(org-default-notes-file "~/org/refile.org")
 '(org-ditaa-eps-jar-path "c:/Users/zsun1/.emacs.d/elpa/contrib/scripts/DitaaEps.jar")
 '(org-ditaa-jar-path "c:/Users/zsun1/.emacs.d/lisp/ditaa0_9.jar")
 '(org-edit-src-content-indentation 0)
 '(org-enforce-todo-checkbox-dependencies nil)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends (quote (ascii beamer html icalendar latex md texinfo)))
 '(org-export-creator-info nil)
 '(org-export-date-timestamp-format "%Y-%m-%d")
 '(org-export-kill-product-buffer-when-displayed t)
 '(org-export-pdf-logfiles
   (quote
    ("aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "fls" "fdb_latexmk")))
 '(org-export-pdf-remove-logfiles t)
 '(org-export-with-sub-superscripts (quote {}))
 '(org-extend-today-until 4)
 '(org-fontify-done-headline t)
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-global-properties
   (quote
    (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
     ("STYLE_ALL" . "habit"))))
 '(org-goto-interface (quote outline-path-completion))
 '(org-insert-heading-respect-content nil)
 '(org-latex-pdf-process
   (quote
    ("pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f")))
 '(org-list-demote-modify-bullet (quote (("-" . "+") ("+" . "1."))))
 '(org-log-done (quote note))
 '(org-log-into-drawer nil)
 '(org-log-reschedule (quote time))
 '(org-log-state-notes-insert-after-drawers nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-id org-info org-irc org-mhe)))
 '(org-outline-path-complete-in-steps nil)
 '(org-outlook-location "C:\\PROGRA~2\\MICROS~2\\OFFICE14\\OUTLOOK.EXE")
 '(org-plantuml-jar-path "~/.emacs.d/lisp/plantuml.jar")
 '(org-priority-faces (quote ((67 :weight light))))
 '(org-protocol-outlook-default-template-key (quote z))
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-target-verify-function (quote bh/verify-refile-target))
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
     ("ORG" . 79)
     ("ITR" . 73)
     ("ZHEN" . 122)
     ("crypt" . 69)
     ("NOTE" . 110)
     ("CANCELLED" . 99))))
 '(org-time-clocksum-format
   (quote
    (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
 '(org-todo-keyword-faces
   (quote
    (("NEXT" :inherit org-next :weight bold)
     ("WAITING" :inherit warning :weight bold)
     ("HOLD" :inherit org-hold :weight bold)
     ("CANCELLED" :inherit org-done :weight bold)
     ("MEETING" :inherit org-done :weight bold)
     ("PHONE" :inherit org-done :weight bold))))
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
 '(org-yank-adjusted-subtrees t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hold ((t (:foreground "light slate gray" :weight bold))) t)
 '(org-next ((t (:inherit gnus-summary-high-ancient))) t))
