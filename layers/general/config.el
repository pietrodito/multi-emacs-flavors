(setq undo-tree-auto-save-history t)
(setq evil-want-fine-undo t)
(setq vc-follow-symlinks t) ;; To edit .spacemacs without to be prompted each time
;;(ulys/spacemacs-buffer-auto-org-mode)

(setq hybrid-style-enable-hjkl-bindings t)

;; add time in powerline
(display-time-mode 1)

;; spell checking
(with-eval-after-load "ispell"
    (setq ispell-program-name "hunspell")
    ;; ispell-set-spellchecker-params has to be called
    ;; before ispell-hunspell-add-multi-dic will work
    (ispell-set-spellchecker-params)
    (ispell-hunspell-add-multi-dic "fr_FR,en_US")
    (setq ispell-dictionary "fr_FR,en_US"))

;; New frame will open fullscreen
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; Org config
(setq org-src-window-setup 'current-window)
(setq org-list-allow-alphabetical t)
(setq org-hide-emphasis-markers t)
(with-eval-after-load 'org (require 'org-tempo) )
(setq org-todo-keywords '((sequence "TODO" "WAITING" "SOMEDAY" "|"
                                    "DONE" "CANCEL")))
(setq org-todo-keyword-faces
      '(("TODO" . "orange") ("WAITING" . "magenta") ("SOMEDAY" . "blue")
        ("CANCELED" . "red") ("DONE" . "green")))

(ulys/config/org/babel)
(ulys/config/org/calendar)
(ulys/config/org/agenda)
(ulys/config/org/minted)
;;(ulys/config/org/todo-keywords)
;;(ulys/config/org/capture)
;; (ulys/config/org/odt-export-latexml)
;; (ulys/config/org/file-apps)
