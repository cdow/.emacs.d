;;; add load path values
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;; settings
(setq default-directory "~/")
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq visible-bell t)
(setq initial-scratch-message "")
(setq-default tab-width 4)
(set-frame-font "DejaVu Sans Mono-9")
(when (display-graphic-p)
    (add-to-list 'default-frame-alist '(height . 50))
    (add-to-list 'default-frame-alist '(width . 125)))
(defalias 'yes-or-no-p 'y-or-n-p)

;;; modes
(line-number-mode t)
(column-number-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(delete-selection-mode t)
(global-auto-revert-mode t)
(global-linum-mode t)

;;; key bindings
(global-set-key (kbd "C-.") 'whitespace-mode)
(global-set-key (kbd "<mouse-6>") (lambda () (interactive) (scroll-right 3 t)))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) (scroll-left 3 t)))

;;; theme
(load-theme 'tangotango t)
(load-theme 'tangotango-override t)

;;; whitespace
;; disabled until auto-complete issue #32 is fixed
;(global-whitespace-mode)
(setq whitespace-style '(face spaces tabs space-mark tab-mark))
(setq linum-format "%d") ; so whitespace doesn't break line numbers

;;; package
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; packages
(use-package window-number
  :ensure t
  :config (progn
            (window-number-mode)
            (window-number-meta-mode)))

(use-package evil
  :ensure t
  :config (progn
            (evil-mode)
            (setq evil-default-state 'emacs)
            (setq evil-emacs-state-cursor '(bar))
            (setq evil-insert-state-cursor '(bar))))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode)

(use-package projectile
  :ensure t
  :config (projectile-global-mode))

(use-package helm
  :ensure t
  :diminish helm-mode
  :config (progn
            (helm-mode 1)
            (setq helm-ff-auto-update-initial-value t))
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)))

(use-package helm-projectile
  :ensure t
  :config (progn
            (setq projectile-completion-system 'helm)
            (helm-projectile-on)))

(use-package iflipb
  :ensure t
  :config (setq iflipb-wrap-around 1)
  :bind (("C-<tab>" . iflipb-next-buffer)
         ("C-S-<iso-lefttab>" . iflipb-previous-buffer)))

(use-package ag
  :ensure t)

(use-package fuzzy-format
  :ensure t
  :config (progn
            (require 'fuzzy-format)
            (setq fuzzy-format-default-indent-tabs-mode t)
            (global-fuzzy-format-mode t)))

(use-package company
  :ensure t
  :diminish company-mode
  :init (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :config (global-git-gutter-mode +1))

