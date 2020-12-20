;; Add MELPA as a package source
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
;; use-package autoloads will make sure it get pulled in at the right time
;; read "package autoloads":  http://www.lunaryorn.com/2014/07/02/autoloads-in-emacs-lisp.html
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Install and enable packages

(use-package evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(use-package evil)
(evil-mode 1)

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


(use-package which-key)
(which-key-mode)

(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package gruvbox-theme)

;; Custom settings

(setq display-line-numbers 'relative)
(setq ring-bell-function 'ignore)

(add-to-list 'default-frame-alist
             '(font . "Fira Code-14"))

(load-theme 'gruvbox t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq-default major-mode 'normal-mode)

;; Separate custom settings from init.el
 (setq custom-file "~/.emacs.d/custom.el")

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(set-scroll-bar-mode nil)

;; Org mode

;; Enable habits
(with-eval-after-load 'org
  (add-to-list 'org-modules 'org-habit t))

(setq org-agenda-window-setup 'current-window)
(setq org-agenda-files '("~/org"))

;; each state with ! is recorded as state change
;; in this case I'm logging TODO and DONE states
(setq org-todo-keywords
      '((sequence "TODO(t!)" "|" "DONE(d!)")))

;; log into a separate LOGBOOK drawer
(setq org-log-into-drawer t)

;; Avoid showing all future TODO entries and only show them for the current week
(setq org-agenda-show-future-repeats nil)

;; Scrolling

;; Scroll one line at a time 
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Custom bindings

;; Org
(evil-leader/set-key
  "a" org-agenda)

;; Window
(evil-leader/set-key
  "w d" 'delete-window
  "w h" 'split-window-below
  "w v" 'split-window-right
  "w o" 'other-window)

;; Open
(evil-leader/set-key
  "o t" 'ansi-term)

;; Rename which-key prefixes
(which-key-add-key-based-replacements
  "SPC w" "window"
  "SPC o" "open")
