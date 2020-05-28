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

   org

   ;; Project management
   (treemacs :variables
             treemacs-use-follow-mode t
             treemacs-use-filewatch-mode t)
   git

   ;; Misc
   (spell-checking :variables spell-checking-enable-by-default nil)

   )
 )
