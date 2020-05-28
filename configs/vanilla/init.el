(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                                        (not (gnutls-available-p))))
              (proto (if no-ssl "http" "https")))
    (when no-ssl (warn "\
                       Your version of Emacs does not support SSL connections,
                       which is unsafe because it allows man-in-the-middle attacks.
                       There are two things you can do about this warning:
                       1. Install an Emacs version that does support SSL and be safe.
                       2. Remove this warning from your init file so you won't see it again."))
                         (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
                           ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
                             ;; and `package-pinned-packages`. Most users will not need or want to do this.
                               ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
                                 )
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages (quote (vterm flycheck company ess))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
