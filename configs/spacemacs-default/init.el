; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation nil
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path (list
                                          (concat user-emacs-directory
                                                  "../../layers/")))
  (setq-default
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ess
     (general     :location local)
     (smartparens :location local)
     (dired       :location local)
     (pdfs        :location local)
     (stats       :location local)

     ;; Programming assistance
     ;;(shell-scripts :variables
     ;;               shell-scripts-backend 'lsp)
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      )
     syntax-checking
     (lsp :variables
          lsp-ui-remap-xref-keybindings t
          lsp-navigation 'peek
          lsp-prefer-flymake nil
          lsp-ui-doc-enable nil
          lsp-ui-sideline-show-diagnostics nil
          )

     ;;major-modes ;; Arch PKGBUILDs and Stan

     )
   )
  (setq-default
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-but-keep-unused)
  )

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'hybrid
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(
                                (agenda . 10)
                                (todos . 20)
                                (projects . 5)
                                (recents . 10)
                                )
   dotspacemacs-mode-line-theme '(doom
                                  :separator nil)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-default-font '(
                               "Iosevka"
                               ;; "Source Code Pro"
                               :size 13.0
                               :weight normal
                               :width normal)

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-emacs-leader-key (if window-system
                                                "<M-return>"
                                              "C-M-m")
   dotspacemacs-default-layout-name "TODO"
   dotspacemacs-display-default-layout t
   dotspacemacs-auto-resume-layouts t
   dotspacemacs-auto-generate-layout-names t
   dotspacemacs-auto-save-file-location 'original
   dotspacemacs-enable-paste-transient-state t
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-line-numbers nil
   dotspacemacs-search-tools '("ag" "rg" "pt" "ack" "grep")
   dotspacemacs-whitespace-cleanup 'all
   dotspacemacs-pretty-docs t
   )
  )


(defun dotspacemacs/user-init ()
  ;; UI Toggles
  (spacemacs/add-to-hooks #'spacemacs/toggle-fill-column-indicator-on
                          '(prog-mode-hook git-commit-mode-hook)))

(defun dotspacemacs/user-config ()
  (spacemacs/toggle-centered-point-globally-on)
  (spacemacs/toggle-fill-column-indicator-on)
  )
