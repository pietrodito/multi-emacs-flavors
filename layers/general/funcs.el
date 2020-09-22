(defvar ulys/toggle-shell-on nil)
(defun ulys/region-to-process (arg beg end)
  "Send the current region to a process buffer.
The first time it's called, will prompt for the buffer to send
to. Subsequent calls send to the same buffer, unless a prefix
argument is used (C-u), or the buffer no longer has an active
process."
  (interactive "P\nr")
  (unless (evil-visual-state-p) (error "Not in visual mode..."))
  (if (or arg ;; user asks for selection
          (not (boundp 'region-to-process-target)) ;; target not set
          ;; or target is not set to an active process:
          (not (process-live-p (get-buffer-process
                                region-to-process-target))))
      (setq region-to-process-target
            (completing-read
             "Process: "
             (seq-map (lambda (el) (buffer-name (process-buffer el)))
                      (process-list)))))
  (process-send-string region-to-process-target (concat (buffer-substring-no-properties beg end) "\n"))
  (evil-exit-visual-state))
(defun ulys/current-line-to-process (arg)
  "Send the current line to a process buffer.
The first time it's called, will prompt for the buffer to send
to. Subsequent calls send to the same buffer, unless a prefix
argument is used (C-u), or the buffer no longer has an active
process."
  (interactive "P")
  (if (or arg ;; user asks for selection
          (not (boundp 'region-to-process-target)) ;; target not set
          ;; or target is not set to an active process:
          (not (process-live-p (get-buffer-process
                                region-to-process-target))))
      (setq region-to-process-target
            (completing-read
             "Process: "
             (seq-map (lambda (el) (buffer-name (process-buffer el)))
                      (process-list)))))
  ;; Need to check if current line is ended with newline
    (setq line-at-point (thing-at-point 'line))
    (setq string-to-send
          (if (string-suffix-p "\n" line-at-point)
              line-at-point
              (concat line-at-point "\n")))
    (process-send-string region-to-process-target string-to-send)
    (evil-next-line))
(defun ulys/open-ansi-term ()
  (interactive)
  (spacemacs/default-pop-shell)
  (setq region-to-process-target (current-buffer)))
(defun ulys/open-ansi-term-and-back ()
    (interactive)
    (ulys/open-ansi-term)
    (other-window -1))
(defun ulys/close-shell ()
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (kill-buffer region-to-process-target)
  (add-to-list 'kill-buffer-query-functions 'process-kill-buffer-query-function)
  )
(defun ulys/toggle-shell ()
  (interactive)
  (if ulys/toggle-shell-on
      (ulys/close-shell)
    (ulys/open-ansi-term-and-back))
  (setq ulys/toggle-shell-on (not ulys/toggle-shell-on)))
(defun ulys/force-toggle-shell ()
  (interactive)
  (setq ulys/toggle-shell-on t)
  (ulys/open-ansi-term))

;; ----- Org
;; interactive
(defun ulys/org/insert-csv-as-table (filename)
  "Insert a csv file into the current buffer at point, and convert it to an org table."
  (interactive (list (ido-read-file-name "csv file: ")))
  (let* ((start (point))
         (end (+ start (nth 1 (insert-file-contents filename)))))
    (org-table-convert-region start end)))
(defun ulys/org//capture-helper-capture-with-yank-method (method arg)

  ;; helper 1/2
  (defun wrap-into-results-example (capture)
    (concat
     "#+RESULTS:\n"
     "#+ATTR_LATEX: :options frame=lines\n"
     "#+BEGIN_SRC R :eval no :tangle no\n"
     capture
     "\n#+END_SRC\n"))

  ;; helper 2/2
  (defun choose-process (arg)
    (if (or arg ;; user asks for selection
            (not (boundp 'R-process-target)) ;; target not set
            ;; or target is not set to an active process:
            (not (process-live-p (get-buffer-process
                                  R-process-target))))
        (setq R-process-target
              (completing-read
               "Choose R process: "
               (seq-map (lambda (el) (buffer-name (process-buffer el)))
                        (process-list))))))

  ;; main
  (choose-process arg)
  (insert (wrap-into-results-example
           (funcall method R-process-target))))
(defun ulys/org/tibble-capture (arg)
  "Let the user choose a R process, then kill last tibble output
in the process and insert it in current buffer in a org
#+RESULTS: format."
  (interactive "P")

  ;; helper 1/3
  (defun extract-nrows-from-tibble-first-line (line)
    "Extract the number N in the pattern: # A tibble N x M"
    (let* (( line-without-commas (replace-regexp-in-string "," "" line))
           ( x-position    (string-match " x" line-without-commas))
           ( nrow-start-at (length "# A tibble ")))
      (string-to-number
       (substring line-without-commas nrow-start-at x-position))))


  ;; helper 3/3
  (defun yank-last-tibble-from-buffer (buffer)
    (interactive)

    (save-current-buffer
      (set-buffer buffer)
      (search-backward "tibble")
      (beginning-of-line)
      (let* ((tibble-beg (point))
             (nrow (extract-nrows-from-tibble-first-line (thing-at-point 'line t)))
             (tibble-end (progn
                           (message "nrow: %d" nrow)
                           (re-search-forward (concat "^" (number-to-string (min 10 nrow))))
                           (while (search-forward "#"  nil t))   ;; t means no error
                           (end-of-line)
                           (point))))
        (buffer-substring tibble-beg tibble-end))))

  ;; main
  (ulys/org//capture-helper-capture-with-yank-method 'yank-last-tibble-from-buffer arg))
(defun ulys/org/glimpse-capture (arg)
  "Let the user choose a R process, then kill last glimpse output
in the process and insert it in current buffer in a org
#+RESULTS: format."
  (interactive "P")

  ;; helper 1
  (defun extract-nb-vars-from-glimpse-second-line (line)
    "Extract the number N in the pattern: Variables: N"
    (let (( nb-vars-start-at (length "Varialbes: "))
          ( nb-vars-end-at   (length line)))
      (string-to-number
       (substring line nb-vars-start-at nb-vars-end-at))))

  ;; helper 2
  (defun suppress_$_in_front_of_lines (lines)
    (replace-regexp-in-string "^\$ "  "" lines))

  ;; helper 3
  (defun yank-last-glimpse-from-buffer (buffer)
    (interactive)

    (save-current-buffer
      (set-buffer buffer)
      (search-backward "Observations: ")
      (beginning-of-line)
      (let* ((glimpse-beg (point))
             (nrow (progn
                     (forward-line)
                     (extract-nb-vars-from-glimpse-second-line
                      (thing-at-point 'line t))))
             (glimpse-end (progn
                           (forward-line nrow)
                           (end-of-line)
                           (point))))
        (suppress_$_in_front_of_lines
         (buffer-substring glimpse-beg glimpse-end) ))))

  ;; main
  (ulys/org//capture-helper-capture-with-yank-method 'yank-last-glimpse-from-buffer arg))

;; ----- Org
;; config
(defun ulys/config/org-tempo ()
  ;; In org mode : auto complete #+begin #+end
  (require 'org-tempo))
(defun ulys/config/org/minted ()
  (setq org-latex-listings 'minted
        org-latex-packages-alist '(("" "minted"))
        org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))
(defun ulys/config/org-odt-export-latexml ()
  (setq org-latex-to-mathml-convert-command"latexmlmath \"%i\" --presentationmathml=%o"))
(defun ulys/config/org/capture ()
  (setq org-default-notes-file "~/Nextcloud/org/tasks.org" )
  (setq org-capture-templates
        '(("t" "Thesis-related Task" entry
            (file "~/Nextcloud/org/thesis.org")
            "** TODO %?" :empty-lines 1)
          ("u" "Teaching-related Task" entry
           (file "~/Nextcloud/org/teaching.org")
           "** TODO %?" :empty-lines 1)
          ("h" "Hospital-related Task" entry
           (file "~/Nextcloud/org/hospital.org")
           "** TODO %?" :empty-lines 1))))
(defun ulys/config/org/file-apps ()
  (defun ulys/org-pdf-app (file-path link-without-schema)
    "Open pdf file using pdf-tools and go to the specified page."
    (let* ((page (if (not (string-match "\\.pdf::\\([0-9]+\\)\\'"
                                        link-without-schema))
                     1
                   (string-to-number (match-string 1 link-without-schema)))))
      (find-file-other-window file-path)
      (pdf-view-goto-page page)))
  (setq org-file-apps
        '((auto-mode . emacs)
          ("\\.x?html?\\'" . "firefox %s")
          ("\\.pdf\\(::[0-9]+\\)?\\'" . whatacold/org-pdf-app)
          ("\\.gif\\'" . "eog \"%s\"")
          ("\\.mp4\\'" . "vlc \"%s\"")
          ("\\.mkv" . "vlc \"%s\""))))
(defun ulys/config/org/calendar ()
  (setq calendar-week-start-day 1))
(defun ulys/config/org/babel ()

  ;; FIXME julia bug - hack I have opened issue #13597
  (setq inferior-julia-program-name "julia")

  (custom-set-variables
   '(org-babel-load-languages (quote ((emacs-lisp . t)
                                      (R          . t)
                                      (latex      . t)
                                      (shell      . t)
                                      (ditaa      . t)
                                      (julia      . t)
                                      (python     . t)
                                      (sql        . t))))
   '(org-confirm-babel-evaluate nil)))
(defun ulys/config/org/agenda ()
  (defun update-google-diary ()
    (let ((calendar-file  "~/Nextcloud/org/diary/google-calendar-export")
          (ics-file  "~/Nextcloud/org/tools/pierrebalaye-at-gmail.ics")
          (calendar-buffer "google-calendar-export")
          (ics-buffer "pierrebalaye-at-gmail.ics"))
    (defun kill-buffer-if-exists (name) (when (get-buffer name)
                                            (message (concat "Trying to kill" name))
                                            (kill-buffer name)))
      (defun kill-ics-and-diary-buffers ()
        (kill-buffer-if-exists ics-buffer)
        (kill-buffer-if-exists calendar-buffer))
      (defun replace-google-export ()
        (kill-ics-and-diary-buffers)
        (delete-file calendar-file)
        (icalendar-import-file ics-file calendar-file)
        (kill-ics-and-diary-buffers))
      (when (file-newer-than-file-p ics-file calendar-file)
        (replace-google-export)))
      )
  (setq diary-file "~/Nextcloud/org/diary/google-calendar-export")
  (setq holiday-bahai-holidays nil)
  (setq holiday-hebrew-holidays nil)
  (setq holiday-islamic-holidays nil)
  (setq org-agenda-time-grid  '((daily today require-timed)
                                (1200 1600)
                                "......" "----------------"))
  (setq org-agenda-files
    '("~/Nextcloud/org/mylife -.org" "~/Nextcloud/org/mywork -.org"))
  (setq org-agenda-include-diary t)
  (add-hook 'org-agenda-mode-hook 'update-google-diary)
  )
