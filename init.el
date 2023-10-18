(load-theme 'delta t)

(setq default-frame-alist
      (append (list
	       '(tool-bar-lines . 0)
	       '(menu-bar-lines . 0)
	       '(vertical-scroll-bars . nil)
	       '(internal-border-width . 25)
	       '(font . "Iosevka Nerd Font 20"))))

(setq window-divider-default-right-width 25)
(setq window-divider-default-places 'right-only)
(window-divider-mode 1)

(setq visible-bell t
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-scratch-message nil
      inhibit-startup-echo-area-message t)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(dolist (mode '(gud-mode-hook
		org-mode-hook
		help-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(defun delta-mode-line--prefix (prefix)
  (concat
   (propertize " " 'display `(raise +0.20))
   (propertize prefix)
   (propertize " " 'display `(raise -0.20))))

(defun delta-mode-line--buffer ()
  (delta-mode-line--prefix (if (and buffer-file-name (buffer-modified-p)) " 󰾪 " " 󰅶 ")))

(defun delta-mode-line--evil-state ()
  (if (string= evil-state "insert") " 󰏪 " (if (string= evil-state "visual") " 󰈊 " "  ")))

(defun delta-mode-line--format (prefix left right)
  (let* ((div-space (/ (window-right-divider-width) (window-font-width nil 'header-line)))
	 (available-space (- (window-total-width) (length prefix) (length left) (length right) div-space)))
    (concat prefix left (make-string available-space ?\ ) right)))

(defun delta-mode-line ()
  (setq-default mode-line-format '((:eval (delta-mode-line--format
					   (format-mode-line (list (delta-mode-line--buffer)))
					   (format-mode-line (list " %b "))
					   (format-mode-line (list (delta-mode-line--evil-state) "  "))))))
  (setq-default header-line-format mode-line-format)
  (setq-default mode-line-format '((:eval (make-string (window-total-width) ?━)))))

(delta-mode-line)

(require 'package)
(setq package-archives'(("org" . "https://orgmode.org/elpa/")
			("melpa" . "https://melpa.org/packages/")
			("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)))

(ivy-mode 1)

(use-package counsel)

(use-package ivy-rich)
(ivy-rich-mode 1)

(use-package which-key)
(which-key-mode)

(use-package general
  :ensure t
  :config
  (general-evil-setup t))

(general-create-definer lambda/leader-keys
  :keymaps '(normal insert visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

(use-package general
  :ensure t
  :config
  (general-evil-setup t))

(general-create-definer delta/leader-keys
  :keymaps '(normal insert visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

(delta/leader-keys
  "f" 'find-file
  "c s" 'swiper-isearch
  "c c" 'counsel-M-x
  "s s" 'save-buffer
  "s q" 'evil-save-and-quit
  "w j" 'evil-window-down
  "w k" 'evil-window-up
  "w h" 'evil-window-left
  "w l" 'evil-window-right
  "w r" 'split-window-right
  "w r" 'split-window-right
  "b l" 'previous-buffer
  "b h" 'next-buffer)

(use-package evil
  :init
  (setq evil-want-C-i-jump nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (evil-mode 1))

(defun lambda/setup-org ()
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (variable-pitch-mode 1)
  (setq evil-auto-indent nil))

(defun lambda/set-org-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package org
  :hook (org-mode . lambda/setup-org)
  :config
  (setq org-ellipsis " "
	org-agenda-files '("~/Desktop/agenda/")
	org-hide-emphasis-markers t))

(use-package visual-fill-column
  :hook (org-mode . lambda/set-org-visual-fill))

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("hs" . "src haskell"))
(add-to-list 'org-structure-template-alist '("cpp" . "src cpp"))
(add-to-list 'org-structure-template-alist '("apl" . "src apl"))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package haskell-mode)

(use-package rust-mode
  :init (add-hook 'rust-mode-hook 'lsp))

;; (use-package treemacs
;; ;
					;   :defer t
;;   :ensure t
;;   :init)

;; (use-package treemacs-evil)

;; (setq treemacs-user-header-line-format (delta-mode-line--format
;; 					(format-mode-line (delta-mode-line--prefix " 󰅶 "))
;; 					(format-mode-line " treemacs ")
;; 					(format-mode-line "")))

;; (setq treemacs-user-mode-line-format '((:eval (make-string (window-total-width) ?━))))

(use-package magit)

(use-package projectile)

(use-package company
  :bind (:map company-active-map
	      ("C-j" . company-select-next)
	      ("C-k" . company-select-previous))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))
