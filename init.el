;;; add load path values
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;; settings
(setq default-directory "~/")
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq visible-bell t)
(setq initial-scratch-message "")
(setq-default tab-width 4)
(set-default-font "DejaVu Sans Mono-9")
(when (display-graphic-p)
    (add-to-list 'default-frame-alist '(height . 45))
    (add-to-list 'default-frame-alist '(width . 105)))
(defalias 'yes-or-no-p 'y-or-n-p)

;;; modes
(line-number-mode t)
(column-number-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(delete-selection-mode t)
(ido-mode t)
(global-auto-revert-mode t)
(global-linum-mode t)
(bar-cursor-mode t)

;;; key bindings
(global-set-key (kbd "C-.") 'whitespace-mode)
(global-set-key (kbd "C-x C-b") 'ibuffer)
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

(defun ensure-installed (package-name)
  (unless (package-installed-p package-name)
    (package-refresh-contents) (package-install package-name)))

;;; window-number
(ensure-installed 'window-number)
(require 'window-number)
(window-number-mode)
(window-number-meta-mode)

;;; evil
(ensure-installed 'evil)
(evil-mode)
(setq evil-default-state 'emacs)

;;; ibuffer-vc
(ensure-installed 'ibuffer-vc)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(add-hook 'ibuffer-hook
      (lambda ()
        (ibuffer-vc-set-filter-groups-by-vc-root)
        (ibuffer-do-sort-by-alphabetic)))

;;; projectile
(ensure-installed 'projectile)
(projectile-global-mode)

;;; smex
(ensure-installed 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; iflipb
(ensure-installed 'iflipb)
(setq iflipb-wrap-around 1)
(global-set-key (kbd "C-<tab>") 'iflipb-next-buffer)
(global-set-key (kbd "C-S-<iso-lefttab>") 'iflipb-previous-buffer)

;;; silver searcher
(ensure-installed 'ag)

;;; fuzzy-format
(ensure-installed 'fuzzy-format)
(require 'fuzzy-format)
(setq fuzzy-format-default-indent-tabs-mode t)
(global-fuzzy-format-mode t)

;;; company-mode
(ensure-installed 'company)
(add-hook 'after-init-hook 'global-company-mode)

