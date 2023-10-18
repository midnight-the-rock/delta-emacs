(set-background-color "#1e191e")
(set-foreground-color "#dbd7d2")

(defgroup delta-dark nil
  "settings for delta-theme")

(defun delta-inherit-face (face style)
  "inherit new style from external face"
  (set-face-attribute face nil
		      :family     'unspecified :slant      'unspecified
		      :weight     'unspecified :height     'unspecified
		      :underline  'unspecified :overline   'unspecified
		      :background 'unspecified :foreground 'unspecified
		      :box        'unspecified :inherit    style))

(defface delta-default-face nil
  ""
  :group 'delta-dark)
(set-face-attribute 'delta-default-face nil
		    :background "#1e191e"
		    :foreground "#dbd7d2")

(defface delta-default-invert-face '((t (:background "#dbd7d2" :foreground "#1e191e")))
  "delta's default swapped"
  :group 'delta-dark)

(defface delta-background-face '((t (:background "#1e191e" :foreground "#1e191e")))
  "full background color face (required for space filling sometimes"
  :group 'delta-dark)

(defface delta-selection-face '((t (:background "#1e191e" :foreground "#998c9a")))
  "face for selection highlight"
  :group 'delta-dark)

(defface delta-type-face '((t (:foreground "#eebab2")))
  "face for data types"
  :group 'delta-dark)

(defface delta-string-face '((t (:foreground "#0c4f63")))
  "face for string-like elements of any type"
  :group 'delta-dark)

(defface delta-keyword-face '((t (:foreground "#736674")))
  "face for keywords"
  :group 'delta-dark)

(defface delta-user-defined-face '((t (:foreground "#998c9a")))
  "face for any user defined variable/function"
  :group 'delta-dark)

(defface delta-fixed-pitch-face '((t (:font "Iosevka Nerd Font" :height 180)))
  "face for any user defined variable/function"
  :group 'delta-dark)

(defface delta-variable-pitch-face '((t (:font "Iosevka Nerd Font Mono" :height 200)))
  "face for any user defined variable/function"
  :group 'delta-dark)

(defface delta-mode-line-face '((t (:foreground "#3b363b")))
  "face for data types"
  :group 'delta-dark)

(defface delta-header-line-face '((t (:background "#262026")))
  "face for data types"
  :group 'delta-dark)

(defface delta-tooltip-face '((t (:background "#3b363b" :foreground "#dbd7d2")))
  "face for data types"
  :group 'delta-dark)

(deftheme delta 
  "custom colorscheme for Delta Emacs, very low contrast ahead")

;; defaults
(delta-inherit-face 'default                      'delta-default-face)
(delta-inherit-face 'fixed-pitch                  'delta-fixed-pitch-face)
(delta-inherit-face 'variable-pitch               'delta-variable-pitch-face)

;; header/mode line
(delta-inherit-face 'header-line                  'delta-header-line-face)
(delta-inherit-face 'mode-line-active             'delta-mode-line-face)
(delta-inherit-face 'mode-line-inactive           'delta-mode-line-face)

;; layout
(delta-inherit-face 'fringe                       'delta-background-face)
(delta-inherit-face 'window-divider               'delta-background-face)
(delta-inherit-face 'window-divider-last-pixel    'delta-background-face)
(delta-inherit-face 'window-divider-first-pixel   'delta-background-face)

;; font lock
(delta-inherit-face 'font-lock-type-face          'delta-type-face)
(delta-inherit-face 'font-lock-keyword-face       'delta-keyword-face)
(delta-inherit-face 'font-lock-string-face        'delta-string-face)
(delta-inherit-face 'font-lock-comment-face       'delta-string-face)
(delta-inherit-face 'font-lock-variable-use-face  'delta-user-defined-face)
(delta-inherit-face 'font-lock-variable-name-face 'delta-user-defined-face)
(delta-inherit-face 'font-lock-function-name-face 'delta-user-defined-face)
(delta-inherit-face 'font-lock-function-call-face 'delta-user-defined-face)

(set-face-attribute 'font-lock-preprocessor-face nil
		    :box nil
		    :background (face-background 'default)
		    :foreground "#ffcbcb")

(set-face-attribute 'font-lock-number-face nil
		    :box nil
		    :background (face-background 'default)
		    :foreground "#7c94ac")

(delta-inherit-face 'match  'delta-default-invert-face)
(delta-inherit-face 'cursor 'delta-default-invert-face)
(delta-inherit-face 'region 'delta-default-invert-face)

;; swiper
(with-eval-after-load 'swiper
  (delta-inherit-face 'swiper-line-face 'delta-selection-face)
  (delta-inherit-face 'swiper-match-face-1 'delta-default-invert-face)
  (delta-inherit-face 'swiper-match-face-2 'delta-default-invert-face)
  (delta-inherit-face 'swiper-match-face-3 'delta-default-invert-face)
  (delta-inherit-face 'swiper-match-face-4 'delta-default-invert-face))

;; ivy
(with-eval-after-load 'ivy-mode
  (delta-inherit-face 'ivy-current-match 'delta-selection-face)
  (delta-inherit-face 'ivy-minibuffer-match-face-1 'delta-default-invert-face)
  (delta-inherit-face 'ivy-minibuffer-match-face-2 'delta-default-invert-face)
  (delta-inherit-face 'ivy-minibuffer-match-face-3 'delta-default-invert-face)
  (delta-inherit-face 'ivy-minibuffer-match-face-4 'delta-default-invert-face))

;; company
(with-eval-after-load 'company-mode
(delta-inherit-face 'company-tooltip           'delta-default-face)
(delta-inherit-face 'company-preview           'delta-selection-face)
(delta-inherit-face 'company-tooltip-selection 'delta-selection-face))

;; which key
(with-eval-after-load 'which-key
  (set-face-attribute 'which-key-key-face nil
		      :box nil
		      :background (face-background 'default)
		      :foreground "#dbd7d2")

  (set-face-attribute 'which-key-separator-face nil
		      :box nil
		      :background (face-background 'default)
		      :foreground "#73626e")

  (set-face-attribute 'which-key-command-description-face nil
		      :box nil
		      :background (face-background 'default)
		      :foreground "#6f7789"))

(with-eval-after-load 'treemacs
  (delta-inherit-face 'treemacs-hl-line-face 'delta-selection-face)

  (set-face-attribute 'treemacs-root-face nil
		      :box nil
		      :background (face-background 'default)
		      :foreground "#c3c8d1"
		      :underline nil
		      :height 200)

  (set-face-attribute 'treemacs-file-face nil
		      :box nil
		      :background (face-background 'default)
		      :foreground "#c3c8d1")

  (set-face-attribute 'treemacs-directory-face nil
		      :box nil
		      :background (face-background 'default)
		      :foreground "#c3c8d1"))

;; org-mode
(with-eval-after-load 'org
  (set-face-attribute 'org-meta-line nil :foreground "#998c9a" :family "Iosevka Nerd Font" :height 180 :weight 'bold) 

  (set-face-attribute 'org-document-info nil :foreground "#998c9a" :family "Iosevka Nerd Font" :height 180 :weight 'bold) 

  (set-face-attribute 'org-document-title nil :foreground "#998c9a" :family "Iosevka Nerd Font" :height 180 :weight 'bold)

  (set-face-attribute 'org-document-info-keyword nil :foreground "#998c9a" :family "Iosevka Nerd Font" :height 180 :weight 'bold) 

  (set-face-attribute 'org-ellipsis nil :underline nil :foreground "#998c9a" :inherit 'variable-pitch) 

  (delta-inherit-face 'org-table    'delta-fixed-pitch-face)
  (delta-inherit-face 'org-checkbox 'delta-fixed-pitch-face)
  (delta-inherit-face 'org-code     'delta-fixed-pitch-face)
  (delta-inherit-face 'org-block    'delta-fixed-pitch-face)
  (delta-inherit-face 'org-block    'delta-fixed-pitch-face)
  (delta-inherit-face 'org-verbatim 'delta-fixed-pitch-face)

  (set-face-attribute 'org-block-end-line nil :background "#262026" :foreground "#dbd7d2" :slant 'italic)

  (set-face-attribute 'org-block-begin-line nil :background "#262026" :foreground "#dbd7d2" :slant 'italic)

  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))

  (set-face-attribute 'org-level-1 nil
		      :font "Iosevka Nerd Font Mono"
		      :weight 'regular
		      :height 1.6
		      :foreground "#947e85")

  (set-face-attribute 'org-level-2 nil
		      :font "Iosevka Nerd Font Mono"
		      :weight 'regular
		      :height 1.4
		      :foreground "#947e85")

  (set-face-attribute 'org-level-3 nil
		      :font "Iosevka Nerd Font Mono"
		      :weight 'regular
		      :height 1.2
		      :foreground "#947e85")

  (set-face-attribute 'org-level-4 nil
		      :font "Iosevka Nerd Font Mono"
		      :weight 'regular
		      :height 1.0
		      :foreground "#947e85")

  (set-face-attribute 'org-level-5 nil
		      :font "Iosevka Nerd Font Mono"
		      :weight 'regular
		      :height 1.0
		      :foreground "#947e85")

  (set-face-attribute 'org-level-6 nil
		      :font "Iosevka Nerd Font Mono"
		      :weight 'regular
		      :height 1.0
		      :foreground "#947e85")

  (set-face-attribute 'org-level-7 nil
		      :font "Iosevka Nerd Font Mono"
		      :weight 'regular
		      :height 1.0
		      :foreground "#947e85")

  (set-face-attribute 'org-level-8 nil
		      :font "Iosevka Nerd Font Mono"
		      :weight 'regular
		      :height 1.0
		      :foreground "#947e85")

  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch)))

(font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(font-lock-add-keywords 'org-mode
			'(("^ *\\(\\#\\+\\)\\w+: "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) " ")))))) 

(font-lock-add-keywords 'org-mode
			'(("^ *\\(\\#\\+begin_\\|\\#\\+BEGIN_\\|\\#\\+end_\\|\\#\\+END_\\)\\(src\\|SRC\\)"
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) " "))))))

(font-lock-add-keywords 'org-mode
			'(("^ *\\(*\\{1,7\\}\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "󰏪"))))))

(provide-theme 'delta)
