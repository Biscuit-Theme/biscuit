;;; doom-biscuit-light-theme.el --- light variant of Biscuit -*- lexical-binding: t; no-byte-compile: t; -*-
;; Maintainer: Alxhr0

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-biscuit-light-theme nil
  "Options for the `doom-biscuit-light' theme."
  :group 'doom-themes)

(defcustom doom-biscuit-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-biscuit-light-theme
  :type 'boolean)

(defcustom doom-biscuit-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-biscuit-light-theme
  :type 'boolean)

(defcustom doom-biscuit-light-comment-bg doom-biscuit-light-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-biscuit-light-theme
  :type 'boolean)

(defcustom doom-biscuit-light-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-biscuit-light-theme
  :type '(choice integer boolean))

(defcustom doom-biscuit-light-region-highlight t
  "Determines the selection highlight style. Can be 'frost, 'snowstorm or t
(default)."
  :group 'doom-biscuit-light-theme
  :type 'symbol)


;;
;;; Theme definition

(def-doom-theme doom-biscuit-light
  "A light theme inspired by Biscuit-Light."

  ;; name        default   256       16
  ((bg         '("#FFF7EB" nil       nil))
   (bg-alt     '("#e6ded3" nil       nil))
   (base0      '("#d4ccc2" "black"   "black"))
   (base1      '("#c9c2b8" "#1e1e1e" "brightblack"))
   (base2      '("#b0aaa1" "#2e2e2e" "brightblack"))
   (base3      '("#a19b93" "#262626" "brightblack"))
   (base4      '("#948e87" "#3f3f3f" "brightblack"))
   (base5      '("#8a847e" "#525252" "brightblack"))
   (base6      '("#7d7872" "#6b6b6b" "brightblack"))
   (base7      '("#736e69" "#979797" "brightblack"))
   (base8      '("#635f5b" "#dfdfdf" "white"))
   (fg         '("#2D2424" "#2d2d2d" "white"))
   (fg-alt     '("#241d1d" "#bfbfbf" "brightwhite"))

   (grey base4)
   (red       '("#B54851" "#C8767D" "red"))
   (orange    '("#D0796D" "#e88779" "brightred"))
   (green     '("#D0796D" "#DB9A91" "green"))
   (teal      '("#29838D" "#44b9b1" "brightgreen"))
   (yellow    '("#C6846C" "#D4A391" "yellow"))
   (blue      '("#938579" "#AFA49B" "brightblue"))
   (dark-blue '("#878985" "#80827e" "blue"))
   (magenta   '("#877B85" "#A69DA4" "magenta"))
   (violet    '("#79657A" "#89728a" "brightmagenta"))
   (cyan      '("#794F65" "#A3728B" "brightcyan"))
   (dark-cyan '("#2C7088" "#5699AF" "cyan"))

   ;; face categories -- required for all themes
   (highlight (doom-blend blue bg 0.8))
   (vertical-bar (doom-darken bg 0.15))
   (selection (doom-blend blue bg 0.5))
   (builtin teal)
   (comments (if doom-biscuit-light-brighter-comments dark-cyan (doom-darken base5 0.2)))
   (doc-comments (doom-darken (if doom-biscuit-light-brighter-comments dark-cyan base5) 0.25))
   (constants magenta)
   (functions teal)
   (keywords blue)
   (methods teal)
   (operators blue)
   (type yellow)
   (strings green)
   (variables violet)
   (numbers magenta)
   (region (pcase doom-biscuit-light-region-highlight
             ((\` frost) (doom-lighten teal 0.5))
             ((\` snowstorm) base0)
             (_ base4)))
   (error red)
   (warning yellow)
   (success green)
   (vc-modified orange)
   (vc-added green)
   (vc-deleted red)

   ;; custom categories
   (hidden `(,(car bg) "black" "black"))
   (-modeline-bright doom-biscuit-light-brighter-modeline)
   (-modeline-pad
    (when doom-biscuit-light-padded-modeline
      (if (integerp doom-biscuit-light-padded-modeline) doom-biscuit-light-padded-modeline 4)))

   (modeline-fg 'unspecified)
   (modeline-fg-alt base6)

   (modeline-bg
    (if -modeline-bright
        (doom-blend bg blue 0.7)
      `(,(doom-darken (car bg) 0.02) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-blend bg blue 0.7)
      `(,(doom-darken (car bg) 0.03) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(car bg) ,@(cdr base1)))
   (modeline-bg-inactive-l (doom-darken bg 0.01)))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-biscuit-light-comment-bg (doom-lighten bg 0.05)))
   ((line-number &override) :foreground (doom-lighten 'base5 0.2))
   ((line-number-current-line &override) :foreground base7)
   (internal-border :foreground (doom-blend blue bg 0.2) :background (doom-blend blue bg 0.2))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))
   ((region &override)
    :foreground (if (memq doom-biscuit-light-region-highlight '(frost snowstorm))
                    bg-alt))

   ;;;; css-mode <built-in> / scss-mode <built-in>
   (css-proprietary-property :foreground orange)
   (css-property :foreground green)
   (css-selector :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-project-root-dir :foreground base6)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-minibuffer-match-face-1 :background nil :foreground (doom-blend fg bg 0.5) :weight 'light)
   (ivy-virtual :foreground (doom-blend blue bg 0.8))
   ;;;; ivy-posframe
   (ivy-posframe :background (doom-blend blue bg 0.2))
   ;;;; magit
   (magit-diff-hunk-heading-highlight :foreground bg :background blue :weight 'bold)
   (magit-diff-hunk-heading :foreground bg :background (doom-blend blue bg 0.3))
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; mic-paren
   ((paren-face-match &override) :foreground red :background base3 :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base3 :background red :weight 'ultra-bold)
   ;;;; nav-flash
   (nav-flash-face :background region :foreground base8 :weight 'bold)
   ;;;; org <built-in>
   (org-hide :foreground hidden)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   ;;;; vimish-fold
   ((vimish-fold-fringe &override) :foreground teal)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light))

  ;;;; Base theme variable overrides-
  ()
  )

;;; doom-biscuit-light-theme.el ends here
