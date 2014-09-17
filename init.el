; This is required!
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

; I need use-package
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)

; == Javascript ==

(use-package yasnippet
  :ensure yasnippet
  :init
  (progn
    (yas-global-mode 1)))

(use-package auto-complete
  :ensure auto-complete
  :init
  (progn
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
    (ac-config-default)
    (ac-set-trigger-key "<tab>")))

(use-package js2-mode
  :ensure js2-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
    (add-hook 'js-mode-hook 'js2-minor-mode)
    (setq js2-highlight-level 3)))

(use-package ac-js2
  :ensure ac-js2
  :init
  (progn
    (add-hook 'js2-mode-hook 'ac-js2-mode)))

(use-package flycheck
  :ensure flycheck
  :init
  (progn
    (add-hook 'after-init-hook #'global-flycheck-mode)))

(use-package js2-refactor
  :ensure js2-refactor
  :init
  (progn
    (js2r-add-keybindings-with-prefix "C-c C-m")))


(use-package tern
  :ensure tern
  :init
  (progn
    (add-hook 'js-mode-hook (lambda () (tern-mode t)))))

(use-package tern-auto-complete
  :ensure tern-auto-complete
  :init
  (progn
    (tern-ac-setup)))

; == Git ==
(use-package magit
  :ensure magit)

; == Syntax ==
;; (use-package rainbow-delimiters
;;   :ensure rainbow-delimiters
;;   :init
;;   (progn 
;;     (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

; == Indenting ==
(use-package auto-indent-mode
  :ensure auto-indent-mode
  :init
  (progn 
    (add-hook 'prog-mode-hook 'auto-indent-mode)))


; == Colortheme ==
(use-package solarized-theme
  :ensure solarized-theme
  :init
  (progn
    (setq solarized-distinct-fringe-background t)
    (setq x-underline-at-descent-line t)
    (load-theme 'solarized-light t)))

; == Smartparness ==
(use-package autopair
  :ensure autopair
  :init
  (progn
    (autopair-global-mode)))

; == Backup ==
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


; == Custom set variables ==
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(js2-basic-offset 2)
 '(js2-include-node-externs t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
