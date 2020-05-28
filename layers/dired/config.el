;; helpers
(defun ulys/dired-open-current-dir ()
  (interactive)
  (spacemacs/dired "."))

(spacemacs/set-leader-keys "ad" 'ulys/dired-open-current-dir)

(with-eval-after-load 'evil-core
  )

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)


;; (hide .~undo-tree~ files)
(setq dired-omit-verbose nil)
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
