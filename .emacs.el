
(add-to-list 'load-path "~/src/org-mode/lisp")

(add-to-list 'load-path "~/src/org-mode/contrib/lisp")

(setq org-src-tab-acts-natively nil)

(setq org-list-allow-alphabetical +1)

(require 'org)
(require 'ox-beamer)
(require 'ox-md)
(require 'htmlize)

(require 'ox-confluence)

(setq htmlize-output-type 'inline-css)
(setq org-html-htmlize-output-type htmlize-output-type)

(defconst gcr/org-version "8.2.10")

(defun gcr/warn-org-version ()
  "Warn of org misconfiguration."
  (interactive)
  (when (not (version= (org-version) gcr/org-version))
    (warn "Insufficient org-mode requirements. Expected %S. Found: %S " gcr/org-version (org-version))))
(gcr/warn-org-version)

(setq org-export-coding-system 'utf-8)

(setq org-export-preserve-breaks nil)

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "BLOCKED" "REVIEW" "DONE")))

(setq org-startup-with-inline-images (display-graphic-p))

(setq org-export-copy-to-kill-ring nil)

(setq org-completion-use-ido +1)
(setq org-outline-path-complete-in-steps nil)
(setq org-completion-use-iswitchb nil)

(setq org-use-speed-commands +1)

(setq org-confirm-shell-link-function 'y-or-n-p)

(setq org-confirm-elisp-link-function 'y-or-n-p)

(setq org-enforce-todo-dependencies +1)

(gcr/on-gui
 (require 'org-mouse))

(setq org-ellipsis "…")

(setq org-hide-leading-stars +1)

(setq org-fontify-emphasized-text +1)

(setq org-pretty-entities +1)

(setq org-highlight-latex-and-related '(latex script entities))

(require 'org-ac)
(org-ac/config-default)

(setq org-footnote-define-inline +1)
(setq org-footnote-auto-label 'random)
(setq org-footnote-auto-adjust nil)
(setq org-footnote-section nil)

(setq org-catch-invisible-edits 'error)

(setq org-loop-over-headlines-in-active-region t)

(setq org-export-with-toc nil)

(setq org-startup-folded "nofold")

(setq org-image-actual-width t)

(setq org-hide-emphasis-markers +1)

(setq org-startup-align-all-tables +1)

(setq org-html-checkbox-type 'unicode)

(defadvice org-latex-export-to-pdf (before before-org-latex-export-to-pdf activate)
  (gcr/save-all-file-buffers))

(let ((pkg 'org-show))
  (gcr/on-gui
   (if (not (el-get-package-is-installed pkg))
       (warn "You wanted %S to be installed, but it isnt. Fix this." pkg)
     (let ((fil (concat (el-get-package-directory pkg) "org-show.el")))
       (if (not (f-exists? fil))
           (warn "You wanted %S to exist, but it doesn't. Fix this." fil)
         (load fil)))))
  (gcr/not-on-gui (warn "You wanted %S to be loaded, but it won't be… it doesn't work without a GUI for some reason." pkg)))

(defun gcr/org-babel-after-execute-hook ()
  "Personal settings for the `org-babel-after-execute-hook'."
  (interactive)
  (org-redisplay-inline-images))

(add-hook 'org-babel-after-execute-hook 'gcr/org-babel-after-execute-hook)

(require 'ob-sml nil 'noerror)

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
   (sml . t)
   (sql . t)))

(setq org-babel-use-quick-and-dirty-noweb-expansion nil)

(setq org-src-fontify-natively nil)

(setq org-src-preserve-indentation +1)

(setq org-edit-src-content-indentation 0)

(setq org-src-strip-leading-and-trailing-blank-lines t)

(add-to-list
 'org-structure-template-alist
 '("el" "#+begin_src emacs-lisp\n?\n#+end_src" "<src lang=\"emacs-lisp\">\n?\n</src>"))

(mapc (lambda (asc)
        (let ((org-sce-dc (downcase (nth 1 asc))))
          (setf (nth 1 asc) org-sce-dc)))
      org-structure-template-alist)

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

(setq org-babel-min-lines-for-block-output 0)

(setq org-edit-src-auto-save-idle-delay 0)

(setq org-edit-src-turn-on-auto-save nil)

(setq org-src-window-setup 'current-window)

(setq org-babel-results-keyword "NAME")

(setq org-babel-no-eval-on-ctrl-c-ctrl-c +1)

(setq org-babel-noweb-wrap-start "«")
(setq org-babel-noweb-wrap-end "»")

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

(defun gcr/vc-next-action ()
  "If in org source block, exit it before `vc-next-action'."
  (interactive)
  (when (condition-case nil
            (org-src-in-org-buffer)
          (error nil))
    (org-edit-src-exit))
  (gcr/save-all-file-buffers)
  (vc-next-action nil))

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

(setq org-edit-src-code nil)

(let* ((allowed '(exports
                  file
                  noweb
                  noweb-ref
                  session
                  tangle))
       (new-ls
        (--filter (member (car it) allowed)
                  org-babel-common-header-args-w-values)))
  (setq org-babel-common-header-args-w-values new-ls))

(gcr/set-org-babel-default-header-args :comments "noweb")

(gcr/set-org-babel-default-header-args :results "output replace")

(gcr/set-org-babel-default-header-args :exports "both")

(gcr/set-org-babel-default-header-args :noweb "no-export")

(gcr/set-org-babel-default-header-args :padline "yes")

(setq org-confirm-babel-evaluate nil)
(gcr/set-org-babel-default-header-args :eval "always")

(setq org-export-babel-evaluate 'inline-only)

(gcr/set-org-babel-default-inline-header-args :eval "always")
(gcr/set-org-babel-default-inline-header-args :results "value replace")

(gcr/set-org-babel-default-header-args:R :session "*R*")

(eval-after-load 'ox '(require 'ox-koma-letter))

(eval-after-load 'ox-koma-letter
  '(progn
     (add-to-list 'org-latex-classes
                  '("my-letter"
                    "\\documentclass[paper=letter, pagesize, fontsize=10pt, parskip]{scrlttr2}
\\usepackage[english]{babel}
\\usepackage[osf]{mathpazo}"))

     (setq org-koma-letter-default-class "my-letter")))

(setq org-koma-letter-class-option-file "UScommercial9 KomaDefault")

(add-to-list 'ispell-skip-region-alist '("^#\\+begin_src ". "#\\+end_src$"))

(add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC ". "#\\+END_SRC$"))

(add-to-list 'ispell-skip-region-alist '("^#\\+begin_example ". "#\\+end_example$"))
(add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_EXAMPLE ". "#\\+END_EXAMPLE$"))

(add-to-list 'ispell-skip-region-alist '("\:PROPERTIES\:$" . "\:END\:$"))

(add-to-list 'ispell-skip-region-alist '("\\[fn:.+:" . "\\]"))

(add-to-list 'ispell-skip-region-alist '("^http" . "\\]"))

(add-to-list 'ispell-skip-region-alist '("=.*" . ".*="))

(add-to-list 'ispell-skip-region-alist '("- \\*.+" . ".*\\*: "))

(let (void)
  (--each
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
        "TITLE")
    (gcr/ispell-a2isra (gcr/ispell-org-header-lines-regexp it))))

(define-key org-mode-map (kbd "C-,") (lambda () (interactive) (insert " \\larr ")))

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

(defun gcr/org-src-mode-hook ()
  (local-set-key (kbd "C-2") 'org-edit-src-exit)
  (visual-line-mode))

(add-hook 'org-src-mode-hook 'gcr/org-src-mode-hook)
