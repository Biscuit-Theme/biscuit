(deftheme biscuit "biscuit")

;;; Variables
(eval-and-compile
  (defvar biscuit-colors-alist
    '(("biscuit-fg"                . "#ffe9c7")
      ("biscuit-bg"                . "#1A1515")
      ("biscuit-black"             . "#2d2424")
      ("biscuit-red"               . "#Cf223E")
      ("biscuit-green"             . "#F07342")
      ("biscuit-yellow"            . "#E39C45")
      ("biscuit-blue"              . "#756D94")
      ("biscuit-magenta"           . "#AE3F82")
      ("biscuit-cyan"              . "#949f6b")
      ("biscuit-white"             . "#DCC9BC")
      ("biscuit-bright-black"      . "#725a5a")
      ("biscuit-bright-red"        . "#e3556f")
      ("biscuit-bright-green"      . "#f49d75")
      ("biscuit-bright-yellow"     . "#edbf86")
      ("biscuit-bright-blue"       . "#9894b3")
      ("biscuit-bright-magenta"    . "#ca6bac")
      ("biscuit-bright-cyan"       . "#b0b893")
      ("biscuit-bright-white"      . "#DCC9BC")
      ("biscuit-comment"           . "#9c8181")
      ("biscuit-highlight"         . "#2d2424")
      ("biscuit-warning"           . "#edbf86")
      ("biscuit-error"             . "#e3556f"))))

(defvar biscuit-use-variable-pitch nil
  "When non-nil, use variable pitch face for some headings and titles.")

(defvar biscuit-scale-org-headlines nil
  "Whether `org-mode' headlines should be scaled.")

(defvar biscuit-scale-outline-headlines nil
  "Whether `outline-mode' headlines should be scaled.")

(defvar biscuit-scale-shr-headlines nil
  "Whether `shr' headlines should be scaled.")

(defcustom biscuit-distinct-line-numbers t
  "Whether line numbers should look distinct."
  :type 'boolean
  :group 'biscuit
  :package-version '(biscuit . "1.0"))

(defcustom biscuit-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'biscuit
  :package-version '(biscuit . "1.0"))

(defcustom biscuit-height-plus-1 1.075
  "Font size +1."
  :type 'number
  :group 'biscuit
  :package-version '(biscuit . "1.0"))

(defcustom biscuit-height-plus-2 1.1
  "Font size +1."
  :type 'number
  :group 'biscuit
  :package-version '(biscuit . "1.0"))

(defcustom biscuit-height-plus-3 1.125
  "Font size +2."
  :type 'number
  :group 'biscuit
  :package-version '(biscuit . "1.0"))

(defcustom biscuit-height-plus-4 1.15
  "Font size +3."
  :type 'number
  :group 'biscuit
  :package-version '(biscuit . "1.0"))

(defcustom biscuit-height-plus-5 1.2
  "Font size +4."
  :type 'number
  :group 'biscuit
  :package-version '(biscuit . "1.0"))

(defcustom biscuit-height-plus-6 1.3
  "Font size +5."
  :type 'number
  :group 'biscuit
  :package-version '(biscuit . "1.0"))

(defmacro biscuit-with-color-variables (&rest body)
  "`let' bind all colors defined in `biscuit-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append biscuit-colors-alist))
         (z-variable-pitch (if biscuit-use-variable-pitch
                               'variable-pitch 'default)))
     ,@body))

;;; Theme Faces
(biscuit-with-color-variables
  (custom-theme-set-faces 'biscuit
                          '(button ((t (:underline t))))
                          `(default ((t (:background ,biscuit-bg :foreground ,biscuit-fg))))
                          `(cursor ((t (:background ,biscuit-white :foreground ,biscuit-bright-black))))
                          `(link ((t (:underline t :foreground ,biscuit-blue))))
                          `(link-visited ((t (:underline t :foreground ,biscuit-bright-blue))))
                          `(underline ((t (:underline t :foreground ,biscuit-yellow))))
                          `(font-lock-keyword-face ((t (:foreground ,biscuit-magenta))))
                          `(font-lock-function-name-face ((t (:foreground ,biscuit-blue))))
                          `(font-lock-string-face ((t (:foreground ,biscuit-green))))
                          `(font-lock-warning-face ((t (:inverse-video t :background ,biscuit-bg :foreground ,biscuit-error))))
                          `(font-lock-type-face ((t (:weight bold :foreground ,biscuit-yellow))))
                          `(font-lock-preprocessor-face ((t (:foreground ,biscuit-blue))))
                          `(font-lock-builtin-face ((t (:weight bold :foreground ,biscuit-yellow))))
                          `(font-lock-variable-name-face ((t (:foreground ,biscuit-red))))
                          `(font-lock-constant-face ((t (:foreground ,biscuit-yellow))))
                          `(font-lock-doc-face ((t (:slant italic :foreground ,biscuit-comment))))
                          `(font-lock-comment-face ((t (:slant italic :foreground ,biscuit-comment))))
                          `(shadow ((t (:foreground ,biscuit-comment))))
                          `(Info-quoted ((t (:inherit font-lock-constant-face))))
                          `(show-paren-match-face ((t (:inverse-video t :background ,biscuit-white :foreground ,biscuit-red))))
                          `(highline-face ((t (:background ,biscuit-black))))
                          `(ac-selection-face ((t (:background ,biscuit-magenta :foreground ,biscuit-highlight))))
                          `(ac-candidate-face ((t (:background ,biscuit-black :foreground ,biscuit-white))))
                          `(flymake-errline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,biscuit-error)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,biscuit-error :weight bold :underline t))))
                          `(flymake-warnline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,biscuit-warning)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,biscuit-warning :weight bold :underline t))))
                          `(flymake-infoline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,biscuit-green)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,biscuit-bright-green :weight bold :underline t))))
                          `(flyspell-duplicate
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,biscuit-yellow) :inherit unspecified))
                             (t (:foreground ,biscuit-yellow :weight bold :underline t))))
                          `(flyspell-incorrect
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,biscuit-red) :inherit unspecified))
                             (t (:foreground ,biscuit-bright-red :weight bold :underline t))))
                          `(minibuffer-prompt ((t (:foreground ,biscuit-yellow))))
                          `(menu ((t (:foreground ,biscuit-fg :background ,biscuit-bg))))
                          `(highlight ((t (:background ,biscuit-highlight))))
                          `(hl-line-face ((,class (:background ,biscuit-highlight))
                                          (t :weight bold)))
                          `(hl-line ((,class (:background ,biscuit-highlight :extend t))
                                     (t :weight bold)))
                          `(success ((t (:foreground ,biscuit-green :weight bold))))
                          `(warning ((t (:foreground ,biscuit-warning :weight bold))))
                          `(error ((t  (:foreground ,biscuit-error))))
                          `(tooltip ((t (:foreground ,biscuit-fg :background ,biscuit-black))))
                          `(region ((t (:inverse-video t :background ,biscuit-black))))
                          `(secondary-selection ((t (:background ,biscuit-bright-black))))
                          `(trailing-whitespace ((t (:background ,biscuit-red))))
                          `(border ((t (:background ,biscuit-bright-black :foreground ,biscuit-white))))
                          `(vertical-border ((t (:foreground ,biscuit-bright-black))))
                          `(mode-line ((t (:foreground ,biscuit-white :background ,biscuit-black :weight normal
                                                       :box (:line-width 1 :color ,biscuit-black)))))
                          `(mode-line-inactive ((t (:foreground ,biscuit-comment :background ,biscuit-black :weight normal :box (:line-width 1 :color ,biscuit-black)))))
                          `(mode-line-buffer-id ((t (:weight bold :background ,biscuit-black :foreground ,biscuit-bright-white))))
                          `(mode-line-emphasis ((t (:foreground ,biscuit-fg :slant italic))))
                          `(mode-line-highlight ((t (:foreground ,biscuit-magenta :box nil :weight bold))))
                          `(fringe ((t (:underline t :background ,biscuit-bg :foreground ,biscuit-highlight))))
                          `(fill-column-indicator ((,class :foreground ,biscuit-highlight :weight semilight)))
                          `(linum ((t (:background ,biscuit-bg :foreground ,biscuit-white))))
                          `(line-number ((t (:foreground ,(if biscuit-distinct-line-numbers biscuit-white biscuit-bg)
                                                         ,@(when biscuit-distinct-line-numbers
                                                             (list :background biscuit-bg))))))
                          `(line-number-current-line ((t (:inherit line-number :foreground ,(if biscuit-distinct-line-numbers biscuit-bright-white biscuit-white)
                                                                   ,@(when biscuit-distinct-line-numbers
                                                                       (list :background biscuit-black))))))
                          `(header-line ((t (:foreground ,biscuit-yellow
                                                         :background ,biscuit-black
                                                         :box (:line-width -1 :style released-button)
                                                         :extend t))))
                          `(widget-field ((t (:foreground ,biscuit-fg :background ,biscuit-bright-black))))
                          `(widget-button ((t (:underline t))))
                          `(escape-glyph ((t (:foreground ,biscuit-yellow :weight bold))))
                          `(dired-directory ((t (:weight bold :foreground ,biscuit-blue))))
                          `(lazy-highlight ((t (:foreground ,biscuit-blue :background ,biscuit-bg :inverse-video t))))
                          `(isearch ((t (:inverse-video t :background ,biscuit-highlight :foreground ,biscuit-bright-blue))))
                          `(isearch-fail ((t (:background ,biscuit-bg :inherit font-lock-warning-face :inverse-video t))))
                          `(isearch-lazy-highlight-face ((t (:inverse-video t :foreground ,biscuit-yellow))))
                          `(grep-context-face ((t (:foreground ,biscuit-fg))))
                          `(grep-error-face ((t (:foreground ,biscuit-red :weight bold :underline t))))
                          `(grep-hit-face ((t (:foreground ,biscuit-bright-blue))))
                          `(grep-match-face ((t (:foreground ,biscuit-bright-blue :weight bold))))
                          `(match ((t (:background ,biscuit-black :foreground ,biscuit-bright-blue :weight bold))))
                          `(completions-annotations ((t (:foreground ,biscuit-white))))
                          `(completions-common-part ((t (:foreground ,biscuit-bright-blue))))
                          `(completions-first-difference ((t (:foreground ,biscuit-bright-white))))
                          ;; ido
                          `(ido-first-match ((t (:foreground ,biscuit-blue :weight bold))))
                          `(ido-only-match ((t (:foreground ,biscuit-green :weight bold))))
                          `(ido-subdir ((t (:foreground ,biscuit-yellow))))
                          `(ido-indicator ((t (:foreground ,biscuit-yellow :background ,biscuit-bright-red))))
                          ;; org-mode
                          `(org-agenda-date-today
                            ((t (:foreground ,biscuit-fg :slant italic :weight bold))) t)
                          `(org-agenda-structure
                            ((t (:inherit font-lock-comment-face))))
                          `(org-archived ((t (:foreground ,biscuit-fg :weight bold))))
                          `(org-block ((t (:background ,biscuit-black :foreground ,biscuit-white :extend t))))
                          `(org-block-begin-line ((t (:foreground ,biscuit-comment :background ,biscuit-black :extend t))))
                          `(org-code ((t (:foreground ,biscuit-bright-yellow ))))
                          `(org-checkbox ((t (:background ,biscuit-bg :foreground ,biscuit-fg
                                                          :box (:line-width 1 :style released-button)))))
                          `(org-date ((t (:foreground ,biscuit-blue :underline t))))
                          `(org-deadline-announce ((t (:foreground ,biscuit-red))))
                          `(org-done ((t (:weight bold :weight bold :foreground ,biscuit-green))))
                          `(org-formula ((t (:foreground ,biscuit-yellow))))
                          `(org-headline-done ((t (:foreground ,biscuit-green))))
                          `(org-hide ((t (:background ,biscuit-bg :foreground ,biscuit-bg))))
                          `(org-verbatim ((t (:foreground ,biscuit-bright-yellow))))
                          `(org-meta-line ((t (:foreground ,biscuit-comment))))
                          `(org-indent ((t (:background ,biscuit-bg :foreground ,biscuit-bg))))
                          `(org-level-1 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-blue
                                                      ,@(when biscuit-scale-org-headlines
                                                          (list :height biscuit-height-plus-6))))))
                          `(org-level-2 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-green
                                                      ,@(when biscuit-scale-org-headlines
                                                          (list :height biscuit-height-plus-5))))))
                          `(org-level-3 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-magenta
                                                      ,@(when biscuit-scale-org-headlines
                                                          (list :height biscuit-height-plus-4))))))
                          `(org-level-4 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-red
                                                      ,@(when biscuit-scale-org-headlines
                                                          (list :height biscuit-height-plus-3))))))
                          `(org-level-5 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-blue
                                                      ,@(when biscuit-scale-org-headlines
                                                          (list :height biscuit-height-plus-2))))))
                          `(org-level-6 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-green
                                                      ,@(when biscuit-scale-org-headlines
                                                          (list :height biscuit-height-plus-1))))))
                          `(org-level-7 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-magenta))))
                          `(org-level-8 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-red))))
                          `(org-link ((t (:foreground ,biscuit-blue :underline t))))
                          `(org-scheduled ((t (:foreground ,biscuit-green))))
                          `(org-scheduled-previously ((t (:foreground ,biscuit-red))))
                          `(org-scheduled-today ((t (:foreground ,biscuit-blue))))
                          `(org-sexp-date ((t (:foreground ,biscuit-blue :underline t))))
                          `(org-special-keyword ((t (:inherit font-lock-comment-face))))
                          `(org-table ((t (:foreground ,biscuit-blue))))
                          `(org-tag ((t (:weight bold :weight bold))))
                          `(org-time-grid ((t (:foreground ,biscuit-yellow))))
                          `(org-todo ((t (:weight bold :foreground ,biscuit-red :weight bold))))
                          `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
                          `(org-warning ((t (:weight bold :foreground ,biscuit-error :weight bold :underline nil))))
                          `(org-column ((t (:background ,biscuit-bg))))
                          `(org-column-title ((t (:background ,biscuit-bg :underline t :weight bold))))
                          `(org-mode-line-clock ((t (:foreground ,biscuit-fg :background ,biscuit-bg))))
                          `(org-mode-line-clock-overrun ((t (:foreground ,biscuit-bg :background ,biscuit-red))))
                          `(org-ellipsis ((t (:foreground ,biscuit-yellow :underline t))))
                          `(org-footnote ((t (:foreground ,biscuit-cyan :underline t))))
                          `(org-document-title ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-blue
                                                             :weight bold
                                                             ,@(when biscuit-scale-org-headlines
                                                                 (list :height biscuit-height-plus-4))))))
                          `(org-document-info ((t (:foreground ,biscuit-magenta))))
                          `(org-document-info-keyword ((t (:foreground ,biscuit-comment))))
                          `(org-habit-ready-face ((t :background ,biscuit-green)))
                          `(org-habit-alert-face ((t :background ,biscuit-yellow :foreground ,biscuit-bg)))
                          `(org-habit-clear-face ((t :background ,biscuit-blue)))
                          `(org-habit-overdue-face ((t :background ,biscuit-red)))
                          `(org-habit-clear-future-face ((t :background ,biscuit-blue)))
                          `(org-habit-ready-future-face ((t :background ,biscuit-green)))
                          `(org-habit-alert-future-face ((t :background ,biscuit-yellow :foreground ,biscuit-bg)))
                          `(org-habit-overdue-future-face ((t :background ,biscuit-red)))
                          ;; org-ref
                          `(org-ref-ref-face ((t :underline t)))
                          `(org-ref-label-face ((t :underline t)))
                          `(org-ref-cite-face ((t :underline t)))
                          `(org-ref-glossary-face ((t :underline t)))
                          `(org-ref-acronym-face ((t :underline t)))
                          ;; flycheck
                          `(flycheck-error
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,biscuit-error) :inherit unspecified))
                             (t (:foreground ,biscuit-error :weight bold :underline t))))
                          `(flycheck-warning
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,biscuit-warning) :inherit unspecified))
                             (t (:foreground ,biscuit-warning :weight bold :underline t))))
                          `(flycheck-info
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,biscuit-cyan) :inherit unspecified))
                             (t (:foreground ,biscuit-cyan :weight bold :underline t))))
                          `(flycheck-fringe-error ((t (:foreground ,biscuit-error :weight bold))))
                          `(flycheck-fringe-warning ((t (:foreground ,biscuit-warning :weight bold))))
                          `(flycheck-fringe-info ((t (:foreground ,biscuit-cyan :weight bold))))
                          ;; company-mode
                          `(company-tooltip ((t (:foreground ,biscuit-fg :background ,biscuit-black))))
                          `(company-tooltip-annotation ((t (:foreground ,biscuit-blue :background ,biscuit-black))))
                          `(company-tooltip-annotation-selection ((t (:foreground ,biscuit-blue :background ,biscuit-black))))
                          `(company-tooltip-selection ((t (:foreground ,biscuit-bright-white :background ,biscuit-highlight))))
                          `(company-tooltip-mouse ((t (:background ,biscuit-black))))
                          `(company-tooltip-common ((t (:foreground ,biscuit-green))))
                          `(company-tooltip-common-selection ((t (:foreground ,biscuit-green))))
                          `(company-scrollbar-fg ((t (:background ,biscuit-black))))
                          `(company-scrollbar-bg ((t (:background ,biscuit-bright-black))))
                          `(company-preview ((t (:background ,biscuit-bright-green))))
                          `(company-preview-common ((t (:foreground ,biscuit-bright-green :background ,biscuit-black))))
                          ;; term, ansi-term, vterm
                          `(term-color-black ((t (:foreground ,biscuit-bg
                                                              :background , biscuit-bg))))
                          `(term-color-red ((t (:foreground ,biscuit-red
                                                            :background ,biscuit-bright-red))))
                          `(term-color-green ((t (:foreground ,biscuit-green
                                                              :background ,biscuit-bright-green))))
                          `(term-color-yellow ((t (:foreground ,biscuit-yellow
                                                               :background ,biscuit-bright-yellow))))
                          `(term-color-blue ((t (:foreground ,biscuit-blue
                                                             :background ,biscuit-bright-blue))))
                          `(term-color-magenta ((t (:foreground ,biscuit-magenta
                                                                :background ,biscuit-bright-magenta))))
                          `(term-color-cyan ((t (:foreground ,biscuit-cyan
                                                             :background ,biscuit-bright-cyan))))
                          `(term-color-white ((t (:foreground ,biscuit-fg
                                                              :background ,biscuit-fg))))
                          '(term-default-fg-color ((t (:inherit biscuit-fg))))
                          '(term-default-bg-color ((t (:inherit biscuit-bg))))
                          ;; diff-mode
                          `(diff-added ((t (:foreground ,biscuit-bright-green :background: ,biscuit-black :extend t))))
                          `(diff-changed ((t  (:foreground ,biscuit-warning :background: ,biscuit-black :extend t))))
                          `(diff-removed ((t (:foreground ,biscuit-error :background: ,biscuit-black :extend t))))
                          `(diff-indicator-added ((t (:inherit diff-added))))
                          `(diff-indicator-changed ((t (:inherit diff-changed))))
                          `(diff-indicator-removed ((t (:inherit diff-removed))))
                          `(diff-refine-added   ((t (:background ,biscuit-bright-green :foreground ,biscuit-black))))
                          `(diff-refine-changed ((t (:background ,biscuit-warning :foreground ,biscuit-black))))
                          `(diff-refine-removed ((t (:background ,biscuit-error :foreground ,biscuit-black))))
                          `(diff-header ((,class (:background ,biscuit-black))
                                         (t (:background ,biscuit-fg :foreground ,biscuit-bg))))
                          `(diff-file-header
                            ((,class (:background ,biscuit-black :foreground ,biscuit-fg :weight bold))
                             (t (:background ,biscuit-fg :foreground ,biscuit-bg :weight bold))))
                          ;; diff-hl
                          `(diff-hl-change ((,class (:inverse-video t :foreground ,biscuit-warning :background ,biscuit-bg))))
                          `(diff-hl-delete ((,class (:inverse-video t :foreground ,biscuit-error :background ,biscuit-bg))))
                          `(diff-hl-insert ((,class (:inverse-video t :foreground ,biscuit-bright-green :background ,biscuit-bg))))
                          ;; tab-bar
                          `(tab-bar ((t (:height 1.1 :foreground ,biscuit-white :background ,biscuit-black))))
                          `(tab-bar-tab ((t (:background ,biscuit-black
                                                         :foreground ,biscuit-magenta
                                                         :box (:line-width 1 :style released-button)))))
                          `(tab-bar-tab-inactive ((t (:inherit tab-bar-tab
                                                               :background ,biscuit-black
                                                               :foreground ,biscuit-comment))))

                          ;; tab-line
                          `(tab-line ((t (:foreground ,biscuit-white :background ,biscuit-black))))
                          `(tab-line-close-highlight ((t (:foreground ,biscuit-red))))
                          `(tab-line-tab ((t (:background ,biscuit-black
                                                          :foreground ,biscuit-magenta
                                                          :box (:line-width 1 :style released-button)))))
                          `(tab-line-tab-inactive ((t (:inherit tab-line-tab
                                                                :background ,biscuit-black
                                                                :foreground ,biscuit-comment))))
                          ;; vertico
                          `(vertico-current ((t (:background ,biscuit-black :foreground ,biscuit-yellow :weight bold))))
                          `(vertico-multiline ((t (:foreground ,biscuit-green :weight bold))))
                          `(vertico-group-title ((t (:foreground ,biscuit-green :weight bold))))
                          `(vertico-group-separator ((t (:foreground ,biscuit-green :weight bold))))
                          ;; selectrum
                          `(selectrum-current-candidate ((t (:background ,biscuit-black :foreground ,biscuit-yellow :weight bold))))
                          `(selectrum-primary-highlight ((t (:foreground ,biscuit-blue :weight bold))))
                          `(selectrum-secondary-highlight ((t (:foreground ,biscuit-magenta :weight bold))))
                          ;; orderless
                          `(orderless-match-face-0 ((t (:foreground ,biscuit-blue))))
                          `(orderless-match-face-1 ((t (:foreground ,biscuit-magenta))))
                          `(orderless-match-face-2 ((t (:foreground ,biscuit-green))))
                          `(orderless-match-face-3 ((t (:foreground ,biscuit-cyan))))
                          ;; helm
                          `(helm-header
                            ((t (:foreground ,biscuit-green
                                             :background ,biscuit-bg
                                             :underline nil
                                             :box nil
                                             :extend t))))
                          `(helm-source-header
                            ((t (:foreground ,biscuit-yellow
                                             :background ,biscuit-black
                                             :underline nil
                                             :weight bold
                                             :box (:line-width -1 :style released-button)
                                             :extend t))))
                          `(helm-selection ((t (:background ,biscuit-black :weight bold :underline nil))))
                          `(helm-selection-line ((t (:background ,biscuit-black))))
                          `(helm-visible-mark ((t (:foreground ,biscuit-bg :background ,biscuit-bright-yellow))))
                          `(helm-candidate-number ((t (:foreground ,biscuit-green :background ,biscuit-black))))
                          `(helm-separator ((t (:foreground ,biscuit-red :background ,biscuit-bg))))
                          `(helm-time-zone-current ((t (:foreground ,biscuit-green :background ,biscuit-bg))))
                          `(helm-time-zone-home ((t (:foreground ,biscuit-red :background ,biscuit-bg))))
                          `(helm-bookmark-addressbook ((t (:foreground ,biscuit-yellow :background ,biscuit-bg))))
                          `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
                          `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
                          `(helm-bookmark-gnus ((t (:foreground ,biscuit-magenta :background ,biscuit-bg))))
                          `(helm-bookmark-info ((t (:foreground ,biscuit-green :background ,biscuit-bg))))
                          `(helm-bookmark-man ((t (:foreground ,biscuit-yellow :background ,biscuit-bg))))
                          `(helm-bookmark-w3m ((t (:foreground ,biscuit-magenta :background ,biscuit-bg))))
                          `(helm-buffer-not-saved ((t (:foreground ,biscuit-red :background ,biscuit-bg))))
                          `(helm-buffer-process ((t (:foreground ,biscuit-cyan :background ,biscuit-bg))))
                          `(helm-buffer-saved-out ((t (:foreground ,biscuit-fg :background ,biscuit-bg))))
                          `(helm-buffer-size ((t (:foreground ,biscuit-white :background ,biscuit-bg))))
                          `(helm-ff-directory ((t (:foreground ,biscuit-cyan :background ,biscuit-bg :weight bold))))
                          `(helm-ff-file ((t (:foreground ,biscuit-fg :background ,biscuit-bg :weight normal))))
                          `(helm-ff-file-extension ((t (:foreground ,biscuit-fg :background ,biscuit-bg :weight normal))))
                          `(helm-ff-executable ((t (:foreground ,biscuit-green :background ,biscuit-bg :weight normal))))
                          `(helm-ff-invalid-symlink ((t (:foreground ,biscuit-red :background ,biscuit-bg :weight bold))))
                          `(helm-ff-symlink ((t (:foreground ,biscuit-yellow :background ,biscuit-bg :weight bold))))
                          `(helm-ff-prefix ((t (:foreground ,biscuit-bg :background ,biscuit-yellow :weight normal))))
                          `(helm-grep-cmd-line ((t (:foreground ,biscuit-cyan :background ,biscuit-bg))))
                          `(helm-grep-file ((t (:foreground ,biscuit-fg :background ,biscuit-bg))))
                          `(helm-grep-finish ((t (:foreground ,biscuit-green :background ,biscuit-bg))))
                          `(helm-grep-lineno ((t (:foreground ,biscuit-white :background ,biscuit-bg))))
                          `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
                          `(helm-grep-running ((t (:foreground ,biscuit-red :background ,biscuit-bg))))
                          `(helm-match ((t (:foreground ,biscuit-yellow :background ,biscuit-black :weight bold))))
                          `(helm-match-item ((t (:foreground ,biscuit-yellow :background ,biscuit-black :weight bold))))
                          `(helm-moccur-buffer ((t (:foreground ,biscuit-cyan :background ,biscuit-bg))))
                          `(helm-mu-contacts-address-face ((t (:foreground ,biscuit-white :background ,biscuit-bg))))
                          `(helm-mu-contacts-name-face ((t (:foreground ,biscuit-fg :background ,biscuit-bg))))
                          ;; ivy
                          `(ivy-confirm-face ((t (:foreground ,biscuit-green :background ,biscuit-bg))))
                          `(ivy-current-match ((t (:foreground ,biscuit-yellow :background ,biscuit-black :weight bold))))
                          `(ivy-cursor ((t (:foreground ,biscuit-bg :background ,biscuit-fg))))
                          `(ivy-match-required-face ((t (:foreground ,biscuit-red :background ,biscuit-bg :weight bold))))
                          `(ivy-minibuffer-match-face-1 ((t (:foreground ,biscuit-magenta :weight bold ))))
                          `(ivy-minibuffer-match-face-2 ((t (:foreground ,biscuit-blue :weight bold))))
                          `(ivy-minibuffer-match-face-3 ((t (:foreground ,biscuit-green :weight bold))))
                          `(ivy-minibuffer-match-face-4 ((t (:foreground ,biscuit-cyan :weight bold))))
                          `(ivy-remote ((t (:foreground ,biscuit-blue :background ,biscuit-bg))))
                          `(ivy-subdir ((t (:foreground ,biscuit-yellow :background ,biscuit-bg))))
                          ;; swiper
                          `(swiper-line-face ((t (:background ,biscuit-highlight))))
                          ;; helpful
                          `(helpful-heading ((t (:foreground ,biscuit-bright-green :height 1.2))))
                          ;; which function
                          `(which-func ((t (:foreground ,biscuit-blue))))
                          ;; rainbow-delimiters
                          `(rainbow-delimiters-depth-1-face ((t (:foreground ,biscuit-bright-blue))))
                          `(rainbow-delimiters-depth-2-face ((t (:foreground ,biscuit-bright-green))))
                          `(rainbow-delimiters-depth-3-face ((t (:foreground ,biscuit-bright-magenta))))
                          `(rainbow-delimiters-depth-4-face ((t (:foreground ,biscuit-bright-yellow))))
                          `(rainbow-delimiters-depth-5-face ((t (:foreground ,biscuit-bright-red))))
                          `(rainbow-delimiters-depth-6-face ((t (:foreground ,biscuit-bright-cyan))))
                          `(rainbow-delimiters-depth-7-face ((t (:foreground ,biscuit-blue))))
                          `(rainbow-delimiters-depth-8-face ((t (:foreground ,biscuit-green))))
                          `(rainbow-delimiters-depth-9-face ((t (:foreground ,biscuit-magenta))))
                          `(rainbow-delimiters-depth-10-face ((t (:foreground ,biscuit-yellow))))
                          `(rainbow-delimiters-depth-11-face ((t (:foreground ,biscuit-red))))
                          `(rainbow-delimiters-depth-12-face ((t (:foreground ,biscuit-cyan))))
                          ;; gnus
                          `(gnus-group-mail-1 ((t (:weight bold :inherit gnus-group-mail-1-empty))))
                          `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
                          `(gnus-group-mail-2 ((t (:weight bold :inherit gnus-group-mail-2-empty))))
                          `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
                          `(gnus-group-mail-3 ((t (:weight bold :inherit gnus-group-mail-3-empty))))
                          `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
                          `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
                          `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
                          `(gnus-group-news-1 ((t (:weight bold :inherit gnus-group-news-1-empty))))
                          `(gnus-group-news-2 ((t (:weight bold :inherit gnus-group-news-2-empty))))
                          `(gnus-group-news-3 ((t (:weight bold :inherit gnus-group-news-3-empty))))
                          `(gnus-group-news-4 ((t (:weight bold :inherit gnus-group-news-4-empty))))
                          `(gnus-group-news-5 ((t (:weight bold :inherit gnus-group-news-5-empty))))
                          `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
                          `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
                          `(gnus-header-content ((t (:inherit message-header-other))))
                          `(gnus-header-from ((t (:inherit message-header-other))))
                          `(gnus-header-name ((t (:inherit message-header-name))))
                          `(gnus-header-newsgroups ((t (:inherit message-header-other))))
                          `(gnus-header-subject ((t (:inherit message-header-subject))))
                          `(gnus-summary-cancelled ((t (:foreground ,biscuit-yellow))))
                          `(gnus-summary-high-ancient ((t (:foreground ,biscuit-blue :weight bold))))
                          `(gnus-summary-high-read ((t (:foreground ,biscuit-green :weight bold))))
                          `(gnus-summary-high-ticked ((t (:foreground ,biscuit-yellow :weight bold))))
                          `(gnus-summary-high-unread ((t (:foreground ,biscuit-fg :weight bold))))
                          `(gnus-summary-low-ancient ((t (:foreground ,biscuit-blue))))
                          `(gnus-summary-low-read ((t (:foreground ,biscuit-green))))
                          `(gnus-summary-low-ticked ((t (:foreground ,biscuit-yellow))))
                          `(gnus-summary-low-unread ((t (:foreground ,biscuit-fg))))
                          `(gnus-summary-normal-ancient ((t (:foreground ,biscuit-blue))))
                          `(gnus-summary-normal-read ((t (:foreground ,biscuit-green))))
                          `(gnus-summary-normal-ticked ((t (:foreground ,biscuit-yellow))))
                          `(gnus-summary-normal-unread ((t (:foreground ,biscuit-fg))))
                          `(gnus-summary-selected ((t (:foreground ,biscuit-yellow :weight bold))))
                          `(gnus-cite-1 ((t (:foreground ,biscuit-blue))))
                          `(gnus-cite-2 ((t (:foreground ,biscuit-blue))))
                          `(gnus-cite-3 ((t (:foreground ,biscuit-blue))))
                          `(gnus-cite-4 ((t (:foreground ,biscuit-green))))
                          `(gnus-cite-5 ((t (:foreground ,biscuit-green))))
                          `(gnus-cite-6 ((t (:foreground ,biscuit-green))))
                          `(gnus-cite-7 ((t (:foreground ,biscuit-red))))
                          `(gnus-cite-8 ((t (:foreground ,biscuit-red))))
                          `(gnus-cite-9 ((t (:foreground ,biscuit-red))))
                          `(gnus-cite-10 ((t (:foreground ,biscuit-yellow))))
                          `(gnus-cite-11 ((t (:foreground ,biscuit-yellow))))
                          `(gnus-group-news-1-empty ((t (:foreground ,biscuit-yellow))))
                          `(gnus-group-news-2-empty ((t (:foreground ,biscuit-green))))
                          `(gnus-group-news-3-empty ((t (:foreground ,biscuit-green))))
                          `(gnus-group-news-4-empty ((t (:foreground ,biscuit-blue))))
                          `(gnus-group-news-5-empty ((t (:foreground ,biscuit-blue))))
                          `(gnus-group-news-6-empty ((t (:foreground ,biscuit-bright-blue))))
                          `(gnus-group-news-low-empty ((t (:foreground ,biscuit-comment))))
                          `(gnus-signature ((t (:foreground ,biscuit-yellow))))
                          `(gnus-x-face ((t (:background ,biscuit-bg :foreground ,biscuit-comment))))
                          ;; shr
                          `(shr-h1 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-blue
                                                 ,@(when biscuit-scale-shr-headlines
                                                     (list :height biscuit-height-plus-6))))))
                          `(shr-h2 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-green
                                                 ,@(when biscuit-scale-shr-headlines
                                                     (list :height biscuit-height-plus-5))))))
                          `(shr-h3 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-magenta
                                                 ,@(when biscuit-scale-shr-headlines
                                                     (list :height biscuit-height-plus-4))))))
                          `(shr-h4 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-bright-red
                                                 ,@(when biscuit-scale-shr-headlines
                                                     (list :height biscuit-height-plus-3))))))
                          `(shr-h5 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-blue
                                                 ,@(when biscuit-scale-shr-headlines
                                                     (list :height biscuit-height-plus-2))))))
                          `(shr-h6 ((t (:inherit ,z-variable-pitch :foreground ,biscuit-green
                                                 ,@(when biscuit-scale-shr-headlines
                                                     (list :height biscuit-height-plus-1))))))
                          `(shr-code ((t (:foreground ,biscuit-bright-yellow ))))
                          `(shr-link ((t (:inherit link))))
                          `(shr-selected-link ((t (:inherit link-visited))))
                          ;; message
                          `(message-cited-text ((t (:inherit font-lock-comment-face))))
                          `(message-header-name ((t (:foreground ,biscuit-comment))))
                          `(message-header-other ((t (:foreground ,biscuit-magenta))))
                          `(message-header-to ((t (:foreground ,biscuit-yellow :weight bold))))
                          `(message-header-cc ((t (:foreground ,biscuit-yellow :weight bold))))
                          `(message-header-newsgroups ((t (:foreground ,biscuit-yellow :weight bold))))
                          `(message-header-subject ((t (:foreground ,biscuit-bright-blue :weight bold))))
                          `(message-header-xheader ((t (:foreground ,biscuit-magenta))))
                          `(message-mml ((t (:foreground ,biscuit-yellow :weight bold))))
                          `(message-separator ((t (:inherit font-lock-comment-face))))
                          `(message-cited-text-1 ((t (:foreground ,biscuit-blue))))
                          `(message-cited-text-2 ((t (:foreground ,biscuit-green))))
                          `(message-cited-text-3 ((t (:foreground ,biscuit-yellow))))
                          `(message-cited-text-4 ((t (:foreground ,biscuit-red))))
                          `(mm-uu-extract ((t (:background ,biscuit-black :foreground ,biscuit-bright-green))))
                          ;; notmuch
                          `(notmuch-crypto-decryption ((t (:foreground ,biscuit-bg :background ,biscuit-magenta))))
                          `(notmuch-crypto-part-header ((t (:foreground ,biscuit-bright-blue))))
                          `(notmuch-crypto-signature-bad ((t (:foreground ,biscuit-bg :background ,biscuit-error))))
                          `(notmuch-crypto-signature-good ((t (:foreground ,biscuit-bg :background ,biscuit-green))))
                          `(notmuch-crypto-signature-good-key ((t (:foreground ,biscuit-bg :background ,biscuit-yellow))))
                          `(notmuch-crypto-signature-unknown ((t (:foreground ,biscuit-bg :background ,biscuit-error))))
                          `(notmuch-hello-logo-background ((t (:background ,biscuit-black))))
                          `(notmuch-wash-cited-text ((t (:foreground ,biscuit-cyan))))
                          `(notmuch-tag-face ((t (:foreground ,biscuit-yellow))))
                          `(notmuch-tag-unread ((t (:foreground ,biscuit-magenta))))
                          `(notmuch-tag-added ((t (:underline ,biscuit-green))))
                          `(notmuch-tag-deleted ((t (:strike-through ,biscuit-red))))
                          `(notmuch-tag-flagged ((t (:foreground ,biscuit-blue))));
                          `(notmuch-message-summary-face ((t (:inherit highlight))))
                          `(notmuch-search-date ((t (:inherit default))))
                          `(notmuch-search-count ((t (:inherit default))))
                          `(notmuch-search-subject ((t (:inherit default))))
                          `(notmuch-search-matching-authors ((t (:inherit default))))
                          `(notmuch-search-non-matching-authors ((t (:inherit shadow))))
                          `(notmuch-search-flagged-face ((t (:foreground ,biscuit-blue))))
                          `(notmuch-search-unread-face ((t (:weight bold))))
                          `(notmuch-tree-match-author-face ((t (:foreground ,biscuit-blue))))
                          `(notmuch-tree-match-date-face ((t (:foreground ,biscuit-yellow))))
                          `(notmuch-tree-match-tag-face ((t (:foreground ,biscuit-cyan))))
                          `(notmuch-tree-no-match-face ((t (:inherit font-lock-comment-face))))
                          ;; mu4e
                          `(mu4e-unread-face ((t (:foreground ,biscuit-green :weight normal))))
                          `(mu4e-replied-face ((t (:foreground ,biscuit-comment))))
                          `(mu4e-flagged-face ((t (:foreground ,biscuit-blue :weight normal))))
                          `(mu4e-warning-face ((t (:foreground ,biscuit-red :slant normal :weight bold))))
                          `(mu4e-trashed-face ((t (:foreground ,biscuit-comment :strike-through t))))
                          `(mu4e-cited-1-face ((t (:foreground ,biscuit-bright-blue :slant italic :weight normal))))
                          `(mu4e-cited-2-face ((t (:foreground ,biscuit-bright-green :slant italic :weight normal))))
                          `(mu4e-cited-3-face ((t (:foreground ,biscuit-bright-magenta :slant italic :weight normal))))
                          `(mu4e-cited-4-face ((t (:foreground ,biscuit-bright-red :slant italic :weight normal))))
                          `(mu4e-cited-5-face ((t (:foreground ,biscuit-blue :slant italic :weight normal))))
                          `(mu4e-cited-6-face ((t (:foreground ,biscuit-green :slant italic :weight normal))))
                          `(mu4e-cited-7-face ((t (:foreground ,biscuit-magenta :slant italic :weight normal))))
                          `(mu4e-view-url-number-face ((t (:foreground ,biscuit-yellow :weight normal))))
                          `(mu4e-header-highlight-face
                            ((t (,@(and (>= emacs-major-version 27) '(:extend t))
                                 :inherit unspecified
                                 :foreground unspecified :background ,biscuit-bg
                                 :underline unspecified  :weight unspecified))))
                          `(mu4e-view-contact-face ((t (:foreground ,biscuit-fg  :weight normal))))
                          `(mu4e-view-header-key-face ((t (:inherit message-header-name :weight normal))))
                          `(mu4e-view-header-value-face ((t (:foreground ,biscuit-cyan :weight normal :slant normal))))
                          `(mu4e-view-link-face ((t (:inherit link))))
                          `(mu4e-view-special-header-value-face ((t (:foreground ,biscuit-blue :weight normal :underline nil))))))

;;;###autoload
(and load-file-name
     (boundp 'biscuit-load-path)
     (add-to-list 'biscuit-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'biscuit)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; biscuit.el ends here
