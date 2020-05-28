(defconst pdfs-packages
  '(
    org-noter

     )
  )

(defun pdfs/init-org-noter ()
  (use-package org-noter
    :config
    (setq org-noter-always-create-frame nil
          org-noter-insert-note-no-questions t
          org-noter-separate-notes-from-heading t
          org-noter-auto-save-last-location t)

    (defun org-noter-init-pdf-view ()
      ;; (run-at-time "0.5 sec" nil #'org-noter)
      (pdf-view-fit-page-to-window)
      (pdf-view-auto-slice-minor-mode))
    (add-hook 'pdf-view-mode-hook 'org-noter-init-pdf-view))
  )
