;; -*- mode: emacs-lisp; lexical-binding: t -*-

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
     (general     :location local)
     (smartparens :location local)
     (dired       :location local)
     (pdfs        :location local)
     (stats       :location local)

     ;; Programming assistance
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      )
     syntax-checking

     major-modes ;; Arch PKGBUILDs and Stan

     (lsp
      ;; :variables
      ;;     lsp-ui-remap-xref-keybindings t
      ;;     lsp-navigation 'peek
      ;;     lsp-prefer-flymake nil
      ;;     lsp-ui-doc-enable nil
      ;; lsp-ui-sideline-show-diagnostics nil
          )
     (shell-scripts :variables
                    shell-scripts-backend 'lsp)
     julia
     ;; (julia :variables
     ;;        julia-backend 'lsp
     ;;        julia-mode-enable-ess t)

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
                               :size 14.0
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

(defun dotspacemacs/user-config ()
  (spacemacs/toggle-centered-point-globally-on)
  (spacemacs/toggle-fill-column-indicator-on)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (R . t)
     (latex . t)
     (shell . t)
     (ditaa . t)
     (julia . t)
     (python . t)
     (sql . t))))
 '(org-confirm-babel-evaluate nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets xterm-color ws-butler writeroom-mode winum which-key vterm volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toc-org terminal-here symon symbol-overlay string-inflection spaceline-all-the-icons smeargle shell-pop restart-emacs rainbow-delimiters popwin pdf-tools pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-noter org-mime org-download org-cliplink org-bullets org-brain open-junk-file nameless multi-term move-text magit-svn magit-section magit-gitflow macrostep lorem-ipsum link-hint indent-guide hybrid-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy font-lock+ flyspell-correct-helm flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-smartparens evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu ess-R-data-view eshell-z eshell-prompt-extras esh-help emr elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish devdocs define-word company-statistics company-quickhelp column-enforce-mode clean-aindent-mode centered-cursor-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
