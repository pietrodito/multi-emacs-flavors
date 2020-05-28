(defconst smartparens-packages
  '(
    smartparens
    evil-smartparens
     )
)

(defun smartparens/init-evil-smartparens ()
  (use-package evil-smartparens :defer t))

(defun smartparens/post-init-smartparens ()
  (use-package smartparens
    :defer t
    :diminish ""
    :bind (("C-}" . sp-forward-slurp-sexp)
           ("C-{" . sp-forward-barf-sexp)
           ("C-)" . sp-splice-sexp))
    :config (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
      )
  )
