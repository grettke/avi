
;; [[file:~/src/avi/avi.org::*Start%20Up][Start\ Up:1]]

(setq load-prefer-newer t)

;; Start\ Up:1 ends here

;; [[file:~/src/avi/avi.org::*Run-time][Run-time:1]]

(defun gcr/emacs-version-check ()
  "Enforce version compliance."
  (interactive)
  (when (not (and (= emacs-major-version 24)
              (= emacs-minor-version 4)))
    (error
     "Incorrect Emacs runtime. Expected v24.4. Found v%s.%s"
     (number-to-string emacs-major-version)
     (number-to-string emacs-minor-version))))
(gcr/emacs-version-check)

;; Run-time:1 ends here

;; [[file:~/src/avi/avi.org::*Explain%20how%20to%20make%20sure%20that%20you%20have%20the%20right%20Org-Mode%20loaded][Explain\ how\ to\ make\ sure\ that\ you\ have\ the\ right\ Org-Mode\ loaded:1]]

(add-to-list 'load-path "~/src/org-mode/lisp")

;; Explain\ how\ to\ make\ sure\ that\ you\ have\ the\ right\ Org-Mode\ loaded:1 ends here

;; [[file:~/src/avi/avi.org::*Explain%20how%20to%20make%20sure%20that%20you%20have%20the%20right%20Org-Mode%20loaded][Explain\ how\ to\ make\ sure\ that\ you\ have\ the\ right\ Org-Mode\ loaded:1]]

(add-to-list 'load-path "~/src/org-mode/contrib/lisp")

;; Explain\ how\ to\ make\ sure\ that\ you\ have\ the\ right\ Org-Mode\ loaded:1 ends here

;; [[file:~/src/avi/avi.org::*Discussion][Discussion:1]]

(setq org-src-tab-acts-natively nil)

;; Discussion:1 ends here

;; [[file:~/src/avi/avi.org::*Configuration][Configuration:1]]

(setq org-list-allow-alphabetical +1)

;; Configuration:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(require 'org)
(require 'ox-beamer)
(require 'ox-md)
(require 'htmlize)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(require 'ox-confluence)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq htmlize-output-type 'inline-css)
(setq org-html-htmlize-output-type htmlize-output-type)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(defconst gcr/org-version "8.3beta")

(defun gcr/warn-org-version ()
  "Warn of org misconfiguration."
  (interactive)
  (when (not (version= (org-version) gcr/org-version))
    (warn "Insufficient org-mode requirements. Expected %S. Found: %S " gcr/org-version (org-version))))
(gcr/warn-org-version)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-export-coding-system 'utf-8)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-export-preserve-breaks nil)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "BLOCKED" "REVIEW" "DONE")))

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-startup-with-inline-images (display-graphic-p))

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-export-copy-to-kill-ring nil)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-completion-use-ido +1)
(setq org-outline-path-complete-in-steps nil)
(setq org-completion-use-iswitchb nil)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-use-speed-commands +1)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-confirm-shell-link-function 'y-or-n-p)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-confirm-elisp-link-function 'y-or-n-p)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-enforce-todo-dependencies +1)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-ellipsis "…")

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-hide-leading-stars +1)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-fontify-emphasized-text +1)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-pretty-entities +1)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-highlight-latex-and-related '(latex script entities))

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-footnote-define-inline +1)
(setq org-footnote-auto-label 'random)
(setq org-footnote-auto-adjust nil)
(setq org-footnote-section nil)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-catch-invisible-edits 'error)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-loop-over-headlines-in-active-region t)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-export-with-toc nil)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-startup-folded "nofold")

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-image-actual-width t)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-hide-emphasis-markers +1)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-startup-align-all-tables +1)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(setq org-html-checkbox-type 'unicode)

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Org][Org:1]]

(defadvice org-latex-export-to-pdf (before before-org-latex-export-to-pdf activate)
  (gcr/save-all-file-buffers))

;; Org:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(defun gcr/org-babel-after-execute-hook ()
  "Personal settings for the `org-babel-after-execute-hook'."
  (interactive)
  (org-redisplay-inline-images))

(add-hook 'org-babel-after-execute-hook 'gcr/org-babel-after-execute-hook)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(org-babel-do-load-languages
 'org-babel-load-languages
 '((calc . t)
   (css . t)
   (dot . t)
   (ditaa . t)
   (emacs-lisp . t)
   (js . t)
   (latex . t)
   (lilypond . t)
   (makefile . t)
   (org . t)
   (perl . t)
   (python . t)
   (plantuml . t)
   (R . t)
   (scheme . t)
   (sh . t)
   (sql . t)))

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-babel-use-quick-and-dirty-noweb-expansion nil)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-src-fontify-natively nil)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-src-preserve-indentation +1)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-edit-src-content-indentation 0)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-src-strip-leading-and-trailing-blank-lines t)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(add-to-list
 'org-structure-template-alist
 '("el" "#+begin_src emacs-lisp\n?\n#+end_src" "<src lang=\"emacs-lisp\">\n?\n</src>"))

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(mapc (lambda (asc)
        (let ((org-sce-dc (downcase (nth 1 asc))))
          (setf (nth 1 asc) org-sce-dc)))
      org-structure-template-alist)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(add-to-list
 'org-structure-template-alist
 '("r" "#+begin_src R\n?\n#+end_src" "<src lang=\"R\"></src>"))
(add-to-list
 'org-structure-template-alist
 '("p" "#+begin_src plantuml\n?\n#+end_src" "<src lang=\"plantuml\"></src>"))
(add-to-list
 'org-structure-template-alist
 '("sh" "#+begin_src sh\n?\n#+end_src" "<src lang=\"sh\"></src>"))
(add-to-list
 'org-structure-template-alist
 '("d" "#+begin_src ditaa\n?\n#+end_src" "<src lang=\"ditaa\"></src>"))

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(defun gcr/org-babel-tangle (orig-fun &rest args)
  "Display tangling time."
  (gcr/save-all-file-buffers)
  (let ((start (current-time)))
    (message (concat "org-babel-tangle BEFORE: <"
                     (format-time-string "%Y-%m-%dT%T%z")
                     ">"))
    (apply orig-fun args)
    (let* ((dur (float-time (time-since start)))
           (msg (format "Tangling complete after: %.06f seconds" dur)))
      (message (concat "org-babel-tangle AFTER: <"
                       (format-time-string "%Y-%m-%dT%T%z")
                       ">"))
      (message msg)
      (gcr/on-gui (alert msg :title "org-mode")))))

(advice-add 'org-babel-tangle :around #'gcr/org-babel-tangle)

(advice-add 'org-ascii-export-as-ascii :before #'gcr/save-all-file-buffers)

(defadvice org-html-export-to-html (before before-org-html-export-to-html activate)
  (gcr/save-all-file-buffers)
  (message (concat "org-html-export-to-html BEFORE: <"
                   (format-time-string "%Y-%m-%dT%T%z")
                   ">")))

(defadvice org-html-export-to-html (after after-org-html-export-to-html activate)
  (message (concat "org-html-export-to-html AFTER: <"
                   (format-time-string "%Y-%m-%dT%T%z")
                   ">")))

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-babel-min-lines-for-block-output 0)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-edit-src-auto-save-idle-delay 0)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-edit-src-turn-on-auto-save nil)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-src-window-setup 'current-window)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-babel-results-keyword "NAME")

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-babel-no-eval-on-ctrl-c-ctrl-c +1)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-babel-noweb-wrap-start "«")
(setq org-babel-noweb-wrap-end "»")

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(defun gcr/org-edit-src-code-plus-name ()
  "Edit the well-described source code block.

Attribution: URL `https://lists.gnu.org/archive/html/emacs-orgmode/2014-09/msg00778.html'

Attribtion: URL `http://emacs.stackexchange.com/a/8168/341'"
  (interactive)
  (let* ((eop  (org-element-at-point))
         (name (or (org-element-property :name (org-element-context eop))
                  "ॐ"))
         (lang (org-element-property :language eop))
         (buff-name (concat "*Org Src " name "[" lang "]*"))
         (file-name (buffer-file-name)))
    (org-edit-src-code nil nil buff-name)
    (setq buffer-file-name file-name)))

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(defun gcr/vc-next-action ()
  "If in org source block, exit it before `vc-next-action'."
  (interactive)
  (when (condition-case nil
            (org-src-in-org-buffer)
          (error nil))
    (org-edit-src-exit))
  (gcr/save-all-file-buffers)
  (vc-next-action nil))

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(defun gcr/src-block-check ()
  (interactive)
  (org-element-map (org-element-parse-buffer 'element) 'src-block
    (lambda (src-block)
      (let ((language (org-element-property :language src-block)))
        (cond ((null language)
               (error "Missing language at position %d"
                      (org-element-property :post-affiliated src-block)))
              ((not (assoc-string language org-babel-load-languages))
               (error "Unknown language at position %d"
                      (org-element-property :post-affiliated src-block)))))))
  (message "Source blocks checked in %s." (buffer-name (buffer-base-buffer))))

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Babel][Babel:1]]

(setq org-edit-src-code nil)

;; Babel:1 ends here

;; [[file:~/src/avi/avi.org::*Core%20Babel%20Configuration][Core\ Babel\ Configuration:1]]

(defun gcr/set-org-babel-default-header-args (property value)
  "Easily set system header arguments in org mode.

PROPERTY is the system-wide value that you would like to modify.

VALUE is the new value you wish to store.

Attribution: URL `http://orgmode.org/manual/System_002dwide-header-arguments.html#System_002dwide-header-arguments'"
  (setq org-babel-default-header-args
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args))))

(defun gcr/set-org-babel-default-inline-header-args (property value)
  "See `gcr/set-org-babel-default-header-args'; same but for inline header args."
  (setq org-babel-default-inline-header-args
        (cons (cons property value)
              (assq-delete-all property org-babel-default-inline-header-args))))

(defun gcr/set-org-babel-default-header-args:R (property value)
  "See `gcr/set-org-babel-default-header-args'; same but for R.

This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:R
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:R))))

(defun gcr/ispell-org-header-lines-regexp (h)
  "Help ispell ignore org header lines."
  (interactive)
  (cons (concat "^#\\+" h ":") ".$"))

(defun gcr/ispell-a2isra (block-def)
  "Add to the ispell skip region alist the BLOCK-DEF."
  (interactive)
  (add-to-list 'ispell-skip-region-alist block-def))

;; Core\ Babel\ Configuration:1 ends here

;; [[file:~/src/avi/avi.org::*Comments%20%5Bfn:1e1a7e1f:%20http://orgmode.org/manual/comments.html#comments%5D][Comments\ \[fn:1e1a7e1f:\ http://orgmode\.org/manual/comments\.html\#comments\]:1]]

(gcr/set-org-babel-default-header-args :comments "noweb")

;; Comments\ \[fn:1e1a7e1f:\ http://orgmode\.org/manual/comments\.html\#comments\]:1 ends here

;; [[file:~/src/avi/avi.org::*Results%20%5Bfn:1625d11f:%20http://orgmode.org/manual/results.html#results%5D][Results\ \[fn:1625d11f:\ http://orgmode\.org/manual/results\.html\#results\]:1]]

(gcr/set-org-babel-default-header-args :results "output replace")

;; Results\ \[fn:1625d11f:\ http://orgmode\.org/manual/results\.html\#results\]:1 ends here

;; [[file:~/src/avi/avi.org::*Exports%20%5Bfn:7dad95aa:%20http://orgmode.org/manual/exports.html#exports%5D][Exports\ \[fn:7dad95aa:\ http://orgmode\.org/manual/exports\.html\#exports\]:1]]

(gcr/set-org-babel-default-header-args :exports "both")

;; Exports\ \[fn:7dad95aa:\ http://orgmode\.org/manual/exports\.html\#exports\]:1 ends here

;; [[file:~/src/avi/avi.org::*Noweb%20%5Bfn:3da67e2d:%20http://orgmode.org/manual/noweb.html#noweb%5D][Noweb\ \[fn:3da67e2d:\ http://orgmode\.org/manual/noweb\.html\#noweb\]:1]]

(gcr/set-org-babel-default-header-args :noweb "no-export")

;; Noweb\ \[fn:3da67e2d:\ http://orgmode\.org/manual/noweb\.html\#noweb\]:1 ends here

;; [[file:~/src/avi/avi.org::*Padline%20%5Bfn:508104fc:%20http://orgmode.org/manual/padline.html%5D][Padline\ \[fn:508104fc:\ http://orgmode\.org/manual/padline\.html\]:1]]

(gcr/set-org-babel-default-header-args :padline "yes")

;; Padline\ \[fn:508104fc:\ http://orgmode\.org/manual/padline\.html\]:1 ends here

;; [[file:~/src/avi/avi.org::*Putting%20the%20Pieces%20Together][Putting\ the\ Pieces\ Together:1]]

(setq org-confirm-babel-evaluate nil)
(gcr/set-org-babel-default-header-args :eval "always")

;; Putting\ the\ Pieces\ Together:1 ends here

;; [[file:~/src/avi/avi.org::*Putting%20the%20Pieces%20Together][Putting\ the\ Pieces\ Together:1]]

(setq org-export-babel-evaluate 'inline-only)

;; Putting\ the\ Pieces\ Together:1 ends here

;; [[file:~/src/avi/avi.org::*Putting%20the%20Pieces%20Together][Putting\ the\ Pieces\ Together:1]]

(gcr/set-org-babel-default-inline-header-args :eval "always")
(gcr/set-org-babel-default-inline-header-args :results "value replace")

;; Putting\ the\ Pieces\ Together:1 ends here

;; [[file:~/src/avi/avi.org::*%E2%84%9D%20Specific][ℝ\ Specific:1]]

(gcr/set-org-babel-default-header-args:R :session "*R*")

;; ℝ\ Specific:1 ends here

;; [[file:~/src/avi/avi.org::*KOMA-Script][KOMA-Script:1]]

(eval-after-load 'ox '(require 'ox-koma-letter))

;; KOMA-Script:1 ends here

;; [[file:~/src/avi/avi.org::*KOMA-Script][KOMA-Script:1]]

(eval-after-load 'ox-koma-letter
  '(progn
     (add-to-list 'org-latex-classes
                  '("my-letter"
                    "\\documentclass[paper=letter, pagesize, fontsize=10pt, parskip]{scrlttr2}
\\usepackage[english]{babel}
\\usepackage[osf]{mathpazo}"))

     (setq org-koma-letter-default-class "my-letter")))

;; KOMA-Script:1 ends here

;; [[file:~/src/avi/avi.org::*KOMA-Script][KOMA-Script:1]]

(setq org-koma-letter-class-option-file "UScommercial9 KomaDefault")

;; KOMA-Script:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(add-to-list 'ispell-skip-region-alist '("^#\\+begin_src ". "#\\+end_src$"))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC ". "#\\+END_SRC$"))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(add-to-list 'ispell-skip-region-alist '("^#\\+begin_example ". "#\\+end_example$"))
(add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_EXAMPLE ". "#\\+END_EXAMPLE$"))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(add-to-list 'ispell-skip-region-alist '("\:PROPERTIES\:$" . "\:END\:$"))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(add-to-list 'ispell-skip-region-alist '("\\[fn:.+:" . "\\]"))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(add-to-list 'ispell-skip-region-alist '("^http" . "\\]"))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(add-to-list 'ispell-skip-region-alist '("=.*" . ".*="))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(add-to-list 'ispell-skip-region-alist '("- \\*.+" . ".*\\*: "))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*ispell][ispell:1]]

(mapc (lambda (it)
        (gcr/ispell-a2isra (gcr/ispell-org-header-lines-regexp it)))
      '("ATTR_LATEX"
        "AUTHOR"
        "CREATOR"
        "DATE"
        "DESCRIPTION"
        "EMAIL"
        "EXCLUDE_TAGS"
        "HTML_CONTAINER"
        "HTML_DOCTYPE"
        "HTML_HEAD"
        "HTML_HEAD_EXTRA"
        "HTML_LINK_HOME"
        "HTML_LINK_UP"
        "HTML_MATHJAX"
        "INFOJS_OPT"
        "KEYWORDS"
        "LANGUAGE"
        "LATEX_CLASS"
        "LATEX_CLASS_OPTIONS"
        "LATEX_HEADER"
        "LATEX_HEADER_EXTRA"
        "OPTIONS"
        "SELECT_TAGS"
        "STARTUP"
        "TITLE"))

;; ispell:1 ends here

;; [[file:~/src/avi/avi.org::*Hooks][Hooks:1]]

(define-key org-mode-map (kbd "C-,") (lambda () (interactive) (insert " \\larr ")))

;; Hooks:1 ends here

;; [[file:~/src/avi/avi.org::*Hooks][Hooks:1]]

(defun gcr/org-mode-hook ()
  (local-set-key (kbd "C-;") 'gcr/vc-next-action)
  (local-set-key (kbd "<return>") 'org-return-indent)
  (local-set-key (kbd "C-M-<return>") 'electric-indent-just-newline)
  (local-set-key (kbd "C-1") 'org-narrow-to-subtree)
  (local-set-key (kbd "M-1") 'widen)
  (local-set-key (kbd "C-2") 'gcr/org-edit-src-code-plus-name)
  (local-set-key (kbd "C-3") 'org-table-edit-field)
  (local-set-key (kbd "s-h") 'org-babel-check-src-block)
  (local-set-key (kbd "s-i i") 'org-babel-insert-header-arg)
  (local-set-key (kbd "s-j") 'org-babel-previous-src-block)
  (local-set-key (kbd "s-k") 'org-babel-next-src-block)
  (local-set-key (kbd "s-l") 'org-babel-demarcate-block)
  (local-set-key (kbd "s-;") 'org-babel-view-src-block-info)
  (local-set-key (kbd "s-b x") 'org-babel-expand-src-block)
  (local-set-key (kbd "s-b s") 'org-babel-switch-to-session)
  (local-set-key (kbd "s-b c") 'org-babel-switch-to-session-with-code)
  (local-set-key (kbd "s-o") 'org-babel-execute-maybe)
  (local-set-key (kbd "s-t") 'org-babel-tangle)
  (local-set-key (kbd "s-x") 'org-babel-do-key-sequence-in-edit-buffer)
  (local-set-key (kbd "s-w w") 'org-export-dispatch)
  (local-set-key (kbd "s-<f5>") 'org-babel-execute-buffer)
  (local-set-key (kbd "s-i d") 'org-display-inline-images)
  (local-set-key (kbd "s-i r") 'org-remove-inline-images)
  (local-set-key (kbd "C-.") (lambda () (interactive) (insert " \\rarr ")))
  (local-set-key (kbd "$") 'yf/org-electric-dollar)
  (when (and (fboundp 'guide-key-mode) guide-key-mode)
    (guide-key/add-local-guide-key-sequence "C-c")
    (guide-key/add-local-guide-key-sequence "C-c C-x")
    (guide-key/add-local-highlight-command-regexp "org-"))
  (fci-mode)
  (gcr/untabify-buffer-hook)
  (turn-on-stripe-table-mode)
  (linum-mode)
  (wrap-region-mode t))

(add-hook 'org-mode-hook 'gcr/org-mode-hook)

;; Hooks:1 ends here

;; [[file:~/src/avi/avi.org::*Hooks][Hooks:1]]

(defun gcr/org-src-mode-hook ()
  (local-set-key (kbd "C-2") 'org-edit-src-exit)
  (visual-line-mode))

(add-hook 'org-src-mode-hook 'gcr/org-src-mode-hook)

;; Hooks:1 ends here

;; [[file:~/src/avi/avi.org::*Package%20&%20Use-Package][Package\ &\ Use-Package:1]]

(package-initialize)

;; Package\ &\ Use-Package:1 ends here

;; [[file:~/src/avi/avi.org::*Package%20&%20Use-Package][Package\ &\ Use-Package:1]]

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Package\ &\ Use-Package:1 ends here

;; [[file:~/src/avi/avi.org::*Package%20&%20Use-Package][Package\ &\ Use-Package:1]]

(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))

;; Package\ &\ Use-Package:1 ends here

;; [[file:~/src/avi/avi.org::*Package%20&%20Use-Package][Package\ &\ Use-Package:1]]

(defun gcr/warn-use-package ()
  "Report use-package misconfiguration."
  (interactive)
  (unless (package-installed-p 'use-package)
    (warn "Please install 'use-package by hand. To do so, run `list-packages', search for it, position the cursor on it, and install it by typing `i', `x', 'yes', and finally restart EMACS.")))
(gcr/warn-use-package)
(require 'use-package)

;; Package\ &\ Use-Package:1 ends here

;; [[file:~/src/avi/avi.org::*Org-Mode%20Post-Provisioning][Org-Mode\ Post-Provisioning:1]]

(use-package ob-sml
             :ensure t
             :config
             (require 'ob-sml nil 'noerror)
             (add-to-list 'org-babel-load-languages
                          '(sml . t)))

;; Org-Mode\ Post-Provisioning:1 ends here
