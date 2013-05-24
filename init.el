;;; add load path values
(add-to-list 'load-path "~/.emacs.d/")

;;; settings
(setq default-directory "~/")
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq visible-bell t)
(setq-default tab-width 4)
(set-default-font "DejaVu Sans Mono-9")
(if window-system
    (set-frame-size (selected-frame) 105 45))
(defalias 'yes-or-no-p 'y-or-n-p)

;;; modes
(line-number-mode t)
(column-number-mode t)
(tool-bar-mode -1)
(delete-selection-mode t)
(ido-mode t)
(global-auto-revert-mode t)
(global-linum-mode t)

;;; key bindings
(global-set-key (kbd "C-.") 'repeat)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<mouse-6>") (lambda () (interactive) (scroll-right 3 t)))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) (scroll-left 3 t)))

;;; theme
(load-theme 'tangotango t)
(load-theme 'tangotango-override t)

;;; package
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;;; evil
(evil-mode)
(setq evil-default-state 'emacs)

;;; ibuffer-vc
(autoload 'ibuffer "ibuffer" "List buffers." t)
(add-hook 'ibuffer-hook
      (lambda ()
        (ibuffer-vc-set-filter-groups-by-vc-root)
        (ibuffer-do-sort-by-alphabetic)))

;;; projectile
(projectile-global-mode)

;;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; repeatable
(require 'repeatable)
(repeatable-command-advice other-window)

;;; iflipb
(require 'iflipb)
(setq iflipb-wrap-around 1)
(global-set-key (kbd "C-<tab>") 'iflipb-next-buffer)
(global-set-key (kbd "C-S-<iso-lefttab>") 'iflipb-previous-buffer)
