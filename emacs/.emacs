;; Main configurations

(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; Disable visible Scrollbalq
(tool-bar-mode -1)   ; Disable the toolbar
(tooltip-mode -1)    ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room
				
(menu-bar-mode -1)   ; Disable the menu bar
(setq visible-bell t) ;; Set up the visible bell

;; Font
(set-face-attribute 'default nil
		    ;:font "Fira Code"
		    :height 120)


;; Theme
(load-theme 'tango-dark)

;; Make ESC quit propmts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Activate Line Numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode(lambda() (display-line-numbers-mode 0))))

;; Change Emacs MetaKey for i3wm
(setq x-meta-keysym 'super)
(setq x-super-keysym 'meta)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			("org" . "https://elpa.gnu.org/packages/")
			("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;(require use-package)
(setq use-package-always-ensure t)

;(use-package command-log-mode)

(use-package ivy
	     :diminish
 	     :bind (("C-s" . swiper)
		    :map ivy-minibuffer-map
		    ("TAB" . ivy-alt-done)
		    ("C-l" . ivy-alt-done)
		    ("C-k" . ivy-previous-line)
		    :map ivy-switch-buffer-map
		    ("C-k" . ivy-previous-line)
		    ("C-l" . ivy-done)
		    ("C-d" . ivy-switch-buffer-kill)
		    :map ivy-reverse-i-search-map
		    ("C-k" . ivy-previous-line)
		    ("C-d" . ivy-reverse-i-search-kill))
	     :config
	     (ivy-mode 1))

(use-package all-the-icons)

(use-package rainbow-delimiters
	     :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
	     :init (which-key-mode)
	     :diminish which-key-mode
	     :config
	     (setq which-key-idle-delay 0.3))

(use-package general
  :config
  (general-create-definer juliocarreno/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :prefix "C-SPC")

  (juliocarreno/leader-keys
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))


(use-package evil
  :config
  (evil-mode 1))

(evil-set-initial-state 'messages-buffer-mode 'normal)
(evil-set-initial-state 'dashboard-mode 'normal)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
