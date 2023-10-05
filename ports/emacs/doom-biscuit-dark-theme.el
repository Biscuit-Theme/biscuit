;;; doom-biscuit-dark-theme.el --- inspired by the Biscuittheme -*- lexical-binding: t; no-byte-compile: t; -*-
;; Author: Alxhr0

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-biscuit-dark-theme nil
  "Options for the `doom-biscuit-dark' theme."
  :group 'doom-themes)

(defcustom doom-biscuit-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-biscuit-dark-theme
  :type 'boolean)

(defcustom doom-biscuit-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-biscuit-dark-theme
  :type 'boolean)

(defcustom doom-biscuit-dark-colorful-headers nil
  "If non-nil, headers in org-mode will be more colorful; which is truer to the
original Dracula Emacs theme."
  :group 'doom-biscuit-dark-theme
  :type 'boolean)

(defcustom doom-biscuit-dark-comment-bg doom-biscuit-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-biscuit-dark-theme
  :type 'boolean)

(defcustom doom-biscuit-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-biscuit-dark-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme doom-biscuit-dark
  "A dark theme based on the Biscuit theme"

  ;; name        default   256       16
  ((bg         '("#1a1515" "#262626" "black"        ))
   (bg-alt     '("#141010" "#1c1c1c" "black"        ))
   (base0      '("#171c24" "#1c1c1c" "black"        ))
   (base1      '("#261f1f" "#1e1e1e" "brightblack"  ))
   (base2      '("#2e2525" "#2e2e2e" "brightblack"  ))
   (base3      '("#362b2b" "#262626" "brightblack"  ))
   (base4      '("#3b2f2f" "#3f3f3f" "brightblack"  ))
   (base5      '("#423535" "#525252" "brightblack"  ))
   (base6      '("#bdbbb9" "#bbbbbb" "brightblack"  ))
   (base7      '("#c4c2c0" "#cccccc" "brightblack"  ))
   (base8      '("#cccac8" "#dfdfdf" "white"        ))
   (fg         '("#ffe9c7" "#ffffff" "white"        ))
   (fg-alt     '("#ebd6b7" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        '("#cf2241" "#e3556f" "red"          ))
   (orange     '("#ffb86c" "#ffbb66" "brightred"    ))
   (green      '("#e39c45" "#f49d75" "green"        ))
   (teal       '("#3881a6" "#3f91ba" "brightgreen"  ))
   (yellow     '("#f07942" "#edbf86" "yellow"       ))
   (blue       '("#949f6b" "#b0b893" "brightblue"   ))
   (dark-blue  '("#4b8eaf" "#549fc4" "blue"         ))
   (magenta    '("#716c97" "#9894b3" "magenta"      ))
   (violet     '("#614F76" "#756D94" "brightmagenta"))
   (cyan       '("#ae3f8a" "#ca6bac" "brightcyan"   ))
   (dark-cyan  '("#c949a0" "#e052b2" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-biscuit-dark-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-biscuit-dark-brighter-comments dark-cyan base5) 0.25))
   (constants      cyan)
   (functions      blue)
   (keywords       magenta)
   (methods        teal)
   (operators      green)
   (type           yellow)
   (strings        green)
   (variables      fg-alt)
   (numbers        violet)
   (region         `(,(car base3) ,@(cdr base1)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (level1 blue)
   (level2 red)
   (level3 (if doom-biscuit-dark-colorful-headers green   (doom-lighten violet 0.35)))
   (level4 (if doom-biscuit-dark-colorful-headers yellow  (doom-lighten magenta 0.35)))
   (level5 (if doom-biscuit-dark-colorful-headers cyan    (doom-lighten violet 0.6)))
   (level6 (if doom-biscuit-dark-colorful-headers orange  (doom-lighten magenta 0.6)))
   (level7 (if doom-biscuit-dark-colorful-headers blue    (doom-lighten violet 0.85)))
   (level8 (if doom-biscuit-dark-colorful-headers magenta (doom-lighten magenta 0.85)))
   (level9 (if doom-biscuit-dark-colorful-headers violet  (doom-lighten violet 0.95)))

   (-modeline-bright doom-biscuit-dark-brighter-modeline)
   (-modeline-pad
    (when doom-biscuit-dark-padded-modeline
      (if (integerp doom-biscuit-dark-padded-modeline) doom-biscuit-dark-padded-modeline 4)))

   (region-alt `(,(car base3) ,@(cdr base4)))

   (modeline-fg     'unspecified)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.6)
      `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken  blue 0.675)
      `(,(car bg) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(doom-darken (car bg) 0.075) ,@(cdr base1)))
   (modeline-bg-inactive-l (doom-darken bg 0.1)))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base5)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-biscuit-dark-comment-bg (doom-lighten bg 0.05) 'unspecified))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))

   ;;;; company
   (company-tooltip-selection     :background base3)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground blue)
   (css-property             :foreground blue)
   (css-selector             :foreground green)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; helm
   (helm-bookmark-w3m :foreground yellow)
   (helm-buffer-not-saved :foreground green)
   (helm-buffer-process :foreground orange)
   (helm-buffer-saved-out :foreground fg)
   (helm-buffer-size :foreground fg)
   (helm-candidate-number :foreground bg :background fg)
   (helm-ff-directory :foreground green :weight 'bold)
   (helm-ff-executable :foreground dark-blue :inherit 'italic)
   (helm-ff-invalid-symlink :foreground violet :weight 'bold)
   (helm-ff-prefix :foreground bg :background magenta)
   (helm-ff-symlink :foreground magenta :weight 'bold)
   (helm-grep-finish :foreground base2)
   (helm-grep-running :foreground green)
   (helm-header :foreground base2 :underline nil :box nil)
   (helm-moccur-buffer :foreground green)
   (helm-separator :foreground violet)
   (helm-source-go-package-godoc-description :foreground yellow)
   ((helm-source-header &override) :foreground red)
   (helm-time-zone-current :foreground orange)
   (helm-time-zone-home :foreground yellow)
   (helm-visible-mark :foreground bg :background base3)
   ;;;; highlight-quoted-mode
   (highlight-quoted-symbol :foreground cyan)
   (highlight-quoted-quote  :foreground green)
   ;;;; js2-mode
   (js2-external-variable :foreground blue)
   (js2-function-param :foreground cyan)
   (js2-jsdoc-html-tag-delimiter :foreground yellow)
   (js2-jsdoc-html-tag-name :foreground dark-blue)
   (js2-jsdoc-value :foreground yellow)
   (js2-private-function-call :foreground cyan)
   (js2-private-member :foreground base7)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-darken 'bg 0.075))
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground level1)
   (outline-2 :inherit 'outline-1 :foreground level2)
   (outline-3 :inherit 'outline-2 :foreground level3)
   (outline-4 :inherit 'outline-3 :foreground level4)
   (outline-5 :inherit 'outline-4 :foreground level5)
   (outline-6 :inherit 'outline-5 :foreground level6)
   (outline-7 :inherit 'outline-6 :foreground level7)
   (outline-8 :inherit 'outline-7 :foreground level8)
   ;;;; org <built-in>
   (org-agenda-date :foreground cyan)
   (org-agenda-dimmed-todo-face :foreground comments)
   (org-agenda-done :foreground base4)
   (org-agenda-structure :foreground violet)
   ((org-block &override) :background (doom-darken base1 0.125) :foreground violet)
   ((org-block-begin-line &override) :background (doom-darken base1 0.125))
   ((org-code &override) :foreground yellow)
   (org-column :background base1)
   (org-column-title :background base1 :bold t :underline t)
   (org-date :foreground cyan)
   ((org-document-info &override) :foreground blue)
   ((org-document-info-keyword &override) :foreground comments)
   (org-done :foreground green :background base2 :weight 'bold)
   (org-footnote :foreground blue)
   (org-headline-base :foreground comments :strike-through t :bold nil)
   (org-headline-done :foreground base4 :strike-through nil)
   ((org-link &override) :foreground orange)
   (org-priority :foreground cyan)
   ((org-quote &override) :background (doom-darken base1 0.125))
   (org-scheduled :foreground green)
   (org-scheduled-previously :foreground yellow)
   (org-scheduled-today :foreground orange)
   (org-sexp-date :foreground base4)
   ((org-special-keyword &override) :foreground yellow)
   (org-table :foreground violet)
   ((org-tag &override) :foreground (doom-lighten orange 0.3))
   (org-todo :foreground orange :bold 'inherit :background (doom-darken base1 0.02))
   (org-upcoming-deadline :foreground yellow)
   (org-warning :foreground yellow)
   ;;;; rjsx-mode
   (rjsx-tag :foreground magenta)
   (rjsx-attr :foreground green :slant 'italic :weight 'medium)
   ;;;; solaire-mode
   (solaire-hl-line-face :background base2)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   (solaire-region-face :background region-alt)
   ;;;; web-mode
   (web-mode-builtin-face :foreground orange)
   (web-mode-css-selector-face :foreground green)
   (web-mode-html-attr-name-face :foreground green)
   (web-mode-html-tag-bracket-face :inherit 'default)
   (web-mode-html-tag-face :foreground blue :weight 'bold)
   (web-mode-preprocessor-face :foreground orange))

  ;;;; Base theme variable overrides-
  ()
  )

;;; doom-biscuit-dark-theme.el ends here
