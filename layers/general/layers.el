(configuration-layer/declare-layers
 '(
   (shell :variables
          shell-default-shell 'vterm
          shell-default-height 30
          shell-default-position 'bottom)
   (helm :variables
         helm-position 'bottom
         helm-no-header t)
   emacs-lisp

   (org :variables
        org-want-todo-bindings t
        org-enable-github-support t
        org-enable-sticky-header t)


   ;; Project management
   (treemacs :variables
             treemacs-use-follow-mode t
             treemacs-use-filewatch-mode t)
   (git :variables git-magit-status-fullscreen t)

   ;; Misc
   (spell-checking :variables spell-checking-enable-by-default nil)

   )
 )
