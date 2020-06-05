(defconst general-packages
  '(
    treemacs
    )
  )

(defun general/post-init-treemacs ()
  (defvar treemacs-node-visit-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "s")  #'treemacs-visit-node-vertical-split)
      (define-key map (kbd "v")  #'treemacs-visit-node-horizontal-split)
      (define-key map (kbd "o")  #'treemacs-visit-node-no-split)
      (define-key map (kbd "aa") #'treemacs-visit-node-ace)
      (define-key map (kbd "ah") #'treemacs-visit-node-ace-horizontal-split)
      (define-key map (kbd "av") #'treemacs-visit-node-ace-vertical-split)
      (define-key map (kbd "x")  #'treemacs-visit-node-in-external-application)
      (define-key map (kbd "r")
        #'treemacs-visit-node-in-most-recently-used-window)
      map)
    "Keymap for node-visiting commands in `treemacs-mode'.")
  )
