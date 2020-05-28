(spacemacs/set-leader-keys "ad" 'ulys/dired-open-current-dir)

;; I prefer C-h to kill buffer
;; (evil-define-key '(normal) dired-mode-map  (kbd "C-h") 'dired-up-directory)
(evil-define-key '(normal) dired-mode-map  (kbd "C-j") 'evil-next-line)
(evil-define-key '(normal) dired-mode-map  (kbd "C-k") 'evil-previous-line)
(evil-define-key '(normal) dired-mode-map  (kbd "C-l") 'dired-find-alternate-file)
