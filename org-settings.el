(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(org-agenda-files
   (quote
    ("~/org/diary.org" "~/org/TODO.org" "~/org/church.org" "~/org/refile.org" "~/org/IGSP/IGSP.org")))
 '(org-agenda-fontify-priorities t)
 '(org-agenda-include-diary t)
 '(org-agenda-log-mode-add-notes t)
 '(org-agenda-log-mode-items
   (quote
    (closed clock state)))
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
 '(org-agenda-text-search-extra-files
   (quote
    (agenda-archives)))
 '(org-agenda-use-time-grid t)
 '(org-attach-method
   (quote mv))
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
 '(org-clock-in-switch-to-state "STARTED")
 '(org-clock-into-drawer "LOGBOOK")
 '(org-clock-persist
   (quote history))
 '(org-completion-use-ido t)
 '(org-cycle-global-at-bob t)
 '(org-deadline-warning-days 30)
 '(org-default-notes-file "~/org/refile.org")
 '(org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar")
 '(org-edit-src-content-indentation 0)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends
   (quote
    (ascii beamer html icalendar latex md)))
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
 '(org-log-done
   (quote note))
 '(org-outline-path-complete-in-steps nil)
 '(org-plantuml-jar-path "/usr/local/bin/plantuml.jar")
 '(org-refile-allow-creating-parent-nodes
   (quote confirm))
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
 '(org-use-property-inheritance
   (quote
    ("AREA")))
 '(org-use-speed-commands t)
 '(org-use-sub-superscripts "{}")
 '(org-use-tag-inheritance t)
 '(org-yank-adjusted-subtrees t))
