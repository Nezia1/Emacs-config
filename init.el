;; Add MELPA as a package source
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
;; use-package autoloads will make sure it get pulled in at the right time
;; read "package autoloads":  http://www.lunaryorn.com/2014/07/02/autoloads-in-emacs-lisp.html
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))')'))`
(eval-when-compile
  (require 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Install and enable packages
(use-package evil)
(evil-mode 1)

(use-package which-key)
(which-key-mode)

(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Custom settings
(setq ring-bell-function 'ignore)

(add-to-list 'default-frame-alist
             '(font . "Fira Code-12:regular"))

(load-theme 'gruvbox)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq org-agenda-window-setup 'current-window)
(setq org-agenda-files '("/mnt/c/Users/antho/Documents/org"))

(menu-bar-mode -1)
(tool-bar-mode -1)

(global-set-key (kbd "C-c a") 'org-agenda)
(setq-default major-mode 'normal-mode)