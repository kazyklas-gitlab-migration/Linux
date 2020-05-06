;; Try UTF-8 first when detecting encoding.
(prefer-coding-system 'utf-8)
;; Use UTF-8 for storing, input and output.
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; tron theme downloaded from https://github.com/ianpan870102/tron-legacy-emacs-theme 
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; setting up the line number
(column-number-mode)
(global-linum-mode 1)

;; set the mode to edit the files throught ssh
(setq tramp-default-method "ssh")

;; tabulator size
tab-width 3

;; check the spelling
;;ispell-dictionary "american"

;; alias for shorter yes and no
(defalias 'yes-or-no-p 'y-or-n-p)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tron-legacy)))
 '(custom-safe-themes
   (quote
    ("95d60b64f554d73359b8a99108e7c3572ba47649f30def600fdd8420838669b0" default)))
 '(package-selected-packages (quote (autopair auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package)
;; If you want to use last tagged version
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; start autocomplete mode
;; install plugins with M-x package-list-packages
(global-auto-complete-mode t)

;; pairing
(setq skeleton-pair t)
    (global-set-key "(" 'skeleton-pair-insert-maybe)
    (global-set-key "[" 'skeleton-pair-insert-maybe)
    (global-set-key "{" 'skeleton-pair-insert-maybe)
    (global-set-key "'" 'skeleton-pair-insert-maybe)
    (global-set-key "\"" 'skeleton-pair-insert-maybe)
    (show-paren-mode)

;; make Emacs start in fullscreen mode
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; make emacs less user friendly
(setq frame-title-format "emacs")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; underline the line you are on
(global-hl-line-mode)

(ido-mode)

(autopair-global-mode)
