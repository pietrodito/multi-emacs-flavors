;; C-h to delete buffer and C-S-h for help
(global-set-key (kbd "C-h") 'spacemacs/kill-this-buffer)

;; Simulates vim increment and decrement number
(define-key evil-normal-state-map  (kbd "C-a C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map  (kbd "C-x C-x") 'evil-numbers/dec-at-pt)

;; F5 to execute lnh <=> ln -s `pwd` ~/0_Quick-Link/
(global-set-key (kbd "<f5>") (lambda () (interactive) (shell-command "lnh")))

(define-key evil-visual-state-map (kbd "M-v") 'ulys/region-to-process)
(global-set-key (kbd "<f3>") 'ulys/current-line-to-process)
(global-set-key (kbd "<f4>") 'ulys/toggle-shell)
(global-set-key (kbd "S-<f4>") 'ulys/force-toggle-shell)
