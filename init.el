(setq inhibit-startup-message t)

(scroll-bar-mode -1)   ;disable visible toolbar
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

;; (setq visible-bell t) ;visible bell on macOS is annoying

(global-set-key (kbd "M-o") 'other-window)

;; make emacs behave like modern editors
;; delete selection when entering text
(setq delete-selection-mode t)


;; set face and colours
(set-face-attribute 'default nil :font "Fira Code" :weight 'light' :height 128)
(load-theme 'spacemacs-dark)


;; initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "dea4b7d43d646aa06a4f705a58f874ec706f896c25993fcf73de406e27dc65ba" default))
 '(fido-mode t)
 '(fido-vertical-mode t)
 '(package-selected-packages
   '(org-roam spacemacs-theme zenburn-theme doom-modeline use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(use-package command-log-mode)

;; (use-package ivy
;;  :bind (("C-s" . swiper)
;;	 :map ivy-minibuffer-map
;;	 ("TAB" . ivy-alt-done)
;;	 ("C-l" . ivy-alt-done)
;;	 ("C-j" . ivy-next-line)
;;	 ("C-k" . ivy-previous-line)
;;	 :map ivy-switch-buffer-map
;;	 ("C-k" . ivy-previous-line)
;;	 ("C-l" . ivy-done)
;;	 ("C-d" . ivy-switch-buffer-kill)
;;	 :map ivy-reverse-i-search-map
;;	 ("C-k" . ivy-previous-line)
;;	 ("C-d" . ivy-reverse-i-search-kill))
;;  :config
;;  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(column-number-mode)
(global-display-line-numbers-mode t)

;; disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; globally replace list-buffers with the more extensive ibuffer when using C-x C-b
(global-set-key [remap list-buffers] 'ibuffer)

(global-tab-line-mode t)

;; disable that emacs expects a sentence to end in a double space
(setq sentence-end-double-space nil)

;; explicitly set macOS-like key bindings

;; (setq mac-option-modifier 'meta          
;;       mac-command-modifier 'super 
;;       mac-right-option-modifier 'none)) 

;;   (global-set-key (kbd "s-c") 'kill-ring-save)
;;   (global-set-key (kbd "s-v") 'yank)
;;   (global-set-key (kbd "s-x") 'kill-region)
;;   (global-set-key (kbd "s-a") 'mark-whole-buffer)
;;   (global-set-key (kbd "s-z") 'undo)
;;   (global-set-key (kbd "s-f") 'isearch-forward)
;;   (global-set-key (kbd "s-g") 'isearch-repeat-forward)
;;   (global-set-key (kbd "s-o") 'find-file)
;;   (global-set-key (kbd "s-o") 'mac-open-file)
;;   (global-set-key (kbd "s-n") 'find-file)
;;   (global-set-key (kbd "s-s") 'save-buffer)
;;   (global-set-key (kbd "s-S") 'mac-save-file-as) 
;;   (global-set-key (kbd "s-p") 'mac-preview) ; requires mac-preview
;;   (global-set-key (kbd "s-w") 'kill-buffer)
;;   (global-set-key (kbd "s-m") 'iconify-frame)
;;   (global-set-key (kbd "s-q") 'save-buffers-kill-emacs)
;;   (global-set-key (kbd "s-.") 'keyboard-quit)
;;   (global-set-key (kbd "s-l") 'goto-line)
;;   (global-set-key (kbd "s-k") 'kill-buffer)
;;   (global-set-key (kbd "s-<up>")    'beginning-of-buffer)
;;   (global-set-key (kbd "s-<down>")  'end-of-buffer)
;;   (global-set-key (kbd "s-<left>")  'beginning-of-line)
;;   (global-set-key (kbd "s-<right>") 'end-of-line)
;;   (global-set-key [(meta down)]     'forward-paragraph)
;;   (global-set-key [(meta up)]       'backward-paragraph)


