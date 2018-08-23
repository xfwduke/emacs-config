;;; init.el --- emacs init file

;;; Commentary:

;;; Code:
;; (declare-function helm-make-source)


;; melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (add-to-list
   'package-archives
   '("org" . "http://orgmode.org/elpa/")
   t)
  (package-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(benchmark-init dockerfile-mode elisp-mode go-flycheck company-yasnippet unicad uniquify linum-highlight-current-line-number xclip company-racer ob-rust x86-lookup racer flycheck-rust cargo rust-mode docker-compose-mode nasm-mode ob-go company-lua lua-mode org htmlize go-impl geiser company-erlang erlang flycheck-rebar3 company-go clang-format yaml-mode helm-go-package sr-speedbar helm-cscope go-eldoc go-snippets syslog-mode auto-save-buffers-enhanced helm-projectile company-c-headers company-irony company-irony-c-headers irony irony-eldoc go-guru company go-mode spice-mode indent-guide graphviz-dot-mode color-theme-solarized rainbow-delimiters unicode-fonts highlight-indent-guides virtualenvwrapper helm-flycheck py-autopep8 flycheck elpy markdown-mode helm use-package paredit systemtap-mode highlight-current-line window-numbering tabbar slime-company relative-line-numbers buttercup))))

(eval-when-compile
  (require 'use-package))
;; (require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (byte-recompile-directory (expand-file-name "~/.emacs.d/elpa") 0)
(setq-default tab-width 4)
(electric-pair-mode 1)
(menu-bar-mode -1)
(set-face-foreground 'minibuffer-prompt "white")
(setq inhibit-startup-screen t)
(setq shell-file-name "/bin/bash")
(add-to-list 'default-frame-alist '(font . "Source Code Pro-13"))
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])
(define-key input-decode-map "\e[1;9A" [M-up])
(define-key input-decode-map "\e[1;9B" [M-down])
(define-key input-decode-map "\e[1;9C" [M-right])
(define-key input-decode-map "\e[1;9D" [M-left])
(define-key input-decode-map "\e[1;10A" [M-S-up])
(define-key input-decode-map "\e[1;10B" [M-S-down])
(define-key input-decode-map "\e[1;10C" [M-S-right])
(define-key input-decode-map "\e[1;10D" [M-S-left])

(xterm-mouse-mode t)
(global-set-key (kbd "<mouse-4>") (lambda ()
				    (interactive)
				    (scroll-down 1)))

(global-set-key (kbd "<mouse-5>") (lambda ()
				    (interactive)
				    (scroll-up 1)))
(setq mouse-drag-copy-region t)
(xclip-mode +1)

;; backup will be inhibited if the file was tracked by Version Control (eg: git)
(defvar backup-file-dir (expand-file-name "~/.emacs_saves"))
(unless (file-exists-p backup-file-dir)
  (make-directory backup-file-dir))

(setq backup-by-copying t)
(setq backup-directory-alist `((".*" . ,backup-file-dir)))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files backup-file-dir))
    (when
	(and (backup-file-name-p file)
	     (> (- current
		   (float-time (nth 5 (file-attributes file))))
		week))
      (message "%s" file)
      (delete-file file))))

(defface org-block-begin-line
  '((t (:foreground "00ffd7" :background "#5f0087")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "#878787")))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:foreground "00ffd7" :background "#5f0087")))
  "Face used for the line delimiting the end of source blocks.")

;; (require 'color-theme)
(defvar use-custom-solarized-dark-p nil)
(require 'color-theme-solarized)
(require 'solarized-definitions)
(setq solarized-termcolors 256)
(if use-custom-solarized-dark-p
    (setq solarized-colors (remove (assoc 'base03 solarized-colors) solarized-colors)))

(load-theme 'solarized t)

(set-terminal-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)

(defun comment-or-uncomment-line-or-region()
  "comment code"
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
  (next-logical-line))
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-line-or-region)

(use-package window-numbering
  :config
  (window-numbering-mode 1)
  (window-numbering-clear-mode-line)
  (setq-default
   mode-line-format
   '((:eval
      (simple-mode-line-render
       ;; left
       (format-mode-line
		(quote
		 ("%e"
		  mode-line-front-space
		  (:eval (concat "No." (window-numbering-get-number-string)))
          " [%l/%i:%c] "
		  mode-line-modified
		  " "
		  default-directory
		  "%b "
		  (vc-mode vc-mode)
		  " "
          mode-line-misc-info
		  )))
       ;; right
       (format-mode-line
		(quote
		 (
		  "%m: "
          mode-line-modes
		  )
		 ))))))
  :preface
  (defun simple-mode-line-render (left right)
	"Return a string of `window-width' length containing LEFT, and RIGHT aligned respectively."
	(let* ((available-width (- (window-width) (length left) 2)))
      (format (format "%%s %%%ds" available-width) left right))))

(use-package autoinsert
  :config
  (auto-insert-mode)
  (setq auto-insert-directory (concat (expand-file-name user-emacs-directory) "file_template"))
  (setq auto-insert-query nil)
  (add-to-list 'auto-insert-alist '(org-mode . "my-org-template.org"))
  (add-to-list 'auto-insert-alist '(python-mode . "my-python-template.py"))
  (advice-add 'auto-insert :around #'yasnippet-expand-after-auto-insert)
  :preface
  (defun yasnippet-expand-after-auto-insert (orig-fun &rest args)
    (let ((is-new-file (and (not buffer-read-only)
			    (or (eq this-command 'auto-insert)
				(and auto-insert (bobp) (eobp))))))
      (apply orig-fun args)
      (let ((old-point-max (point-max)))
	(when is-new-file
	  (goto-char old-point-max)
	  (yas/expand-snippet (buffer-substring-no-properties (point-min) (point-max)))
	  (delete-region (point-min) old-point-max))))))

(use-package which-func
  :defer t
  :init
  (which-function-mode t)
  :config
  (setq which-func-unknown " N/A ")
  (set-face-background 'which-func "white")
  (set-face-foreground 'which-func "#0000ee"))

(use-package linum-highlight-current-line-number
  :load-path "site-packages")

(use-package linum
  :init
  (global-linum-mode t)
  :config
  (if use-custom-solarized-dark-p
      (set-face-background 'linum "black")
    (set-face-background 'linum "#1c1c1c"))
  (set-face-foreground 'linum "#005f5f"))

(use-package highlight-current-line
  :config
  (global-hl-line-mode 1)
  (set-face-attribute hl-line-face
		      nil
		      :background "black"))

(use-package flycheck
  :defer t
  :hook ((emacs-lisp-mode
		  lisp-mode
		  scheme-mode
		  erlang-mode
		  python-mode) . flycheck-mode))

(use-package paren
  :config
  (show-paren-mode 1)
  (set-face-background 'show-paren-match "#00ff00")
  (set-face-foreground 'show-paren-match "#0000ff")
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold))

(use-package tabbar
  :preface
  (defun ztl-modification-state-change ()
    (tabbar-set-template tabbar-current-tabset nil)
    (tabbar-display-update))
  (defun ztl-on-buffer-modification ()
    (set-buffer-modified-p t)
    (ztl-modification-state-change))
  :config
  (add-hook 'after-save-hook 'ztl-modification-state-change)
  (add-hook 'first-change-hook 'ztl-on-buffer-modification)
  (tabbar-mode 1)
  (setq tabbar-separator '(1.5))
  (advice-add 'tabbar-buffer-tab-label :filter-return
	      (lambda (return-val)
		(if (and (buffer-modified-p (tabbar-tab-value tab))
			 (buffer-file-name (tabbar-tab-value tab)))
		    (concat " + " (concat return-val " "))
		  (concat " " (concat return-val " ")))))
  (if (window-system)
      (set-face-attribute 'tabbar-default nil
			  :family "Source Code Pro"
			  :height 1
			  :underline nil)
    (if use-custom-solarized-dark-p
	(set-face-attribute 'tabbar-default nil
			    :underline nil)
      (set-face-attribute 'tabbar-default nil
			  :background "#1c1c1c"
			  :underline nil)))
  (set-face-attribute 'tabbar-selected nil
		      :background "white"
		      :foreground "#0000ee"
		      :underline nil)
  (set-face-attribute 'tabbar-selected-modified nil
		      :background "white"
		      :foreground "red")
  (set-face-attribute 'tabbar-button nil
		      :box '(:line-width 1 :color "#333333" :style nil)))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package auto-save-buffers-enhanced
  :config
  (auto-save-buffers-enhanced t))

(use-package unicad
  :load-path "site-packages")


(use-package helm
  :demand t
  :config
  (helm-mode 1)
  (require 'helm-config)
  (setq helm-split-window-inside-p           t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-move-to-line-cycle-in-source     t
	helm-ff-search-library-in-sexp t
	helm-ff-file-name-history-use-recentf t
	helm-M-x-fuzzy-match t
	helm-echo-input-in-header-line t
	helm-apropos-fuzzy-match t
	helm-scroll-amount                    8)
  :bind (("M-x" . helm-M-x)
	 ("C-s" . helm-occur)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-mini)
	 ("C-x C-f" . helm-find-files)
	 ("C-h <SPC>" . helm-all-mark-rings)
	 ("C-c h" . helm-command-prefix))
  :bind (:map helm-command-map
	      ("TAB" . helm-execute-persistent-action)
	      ("p" . helm-projectile)
	      ("i" . helm-semantic-or-imenu)))

(use-package company
  :demand t
  :bind (:map company-active-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous))
  :config
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-backends (remove 'company-clang company-backends))
  (setq company-backends (remove 'company-semantic company-backends))
  (setq company-backends (remove 'company-xcode company-backends)))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package company-yasnippet
  :defer t
  :config
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-yasnippet)))

(use-package go-flycheck
  :defer t
  :load-path (lambda ()
	       (list (concat (getenv "GOPATH") "src/github.com/dougm/goflymake")))
  :config
  (global-flycheck-mode 1))

(use-package go-impl
  :defer t
  :after (helm)
  :config
  (add-to-list 'helm-completing-read-handlers-alist '(go-impl . nil)))

(use-package go-mode
  :defer t
  :config
  (go-mode)
  (setq gofmt-command "goimports")
  (setq compile-command (concat "go build -v " buffer-file-name))
  (setq indent-tabs-mode 1)
  (add-to-list 'company-backends 'company-go)
  (setq company-begin-commands '(self-insert-command))
  (go-eldoc-setup)
  :bind (:map go-mode-map
	      ("M-." . godef-jump)
	      ("M-," . pop-tag-mark)
	      ("C-c l" . gofmt)
	      ("C-c C-l" . gofmt)
	      ("C-c b" . compile)
	      ("C-c C-b" . compile)
	      ("C-c r" . go-run)
	      ("C-c C-r" . go-run)
	      ("C-c h o" . go-guru-helm)
	      ("C-c d" . godoc-at-point))
  :preface
  (defun go-run ()
    (interactive)
    (shell-command (concat "go run "
			   (read-shell-command "go run: " buffer-file-name))))
  (defun go-guru-helm ()
    (interactive)
    (helm :sources (helm-build-in-buffer-source "go-guru-helm"
		     :data '(go-guru-describe
			     go-guru-freevars
			     go-guru-implements
			     go-guru-peers
			     go-guru-referrers
			     go-guru-definition
			     go-guru-pointsto
			     go-guru-callstack
			     go-guru-whicherrs
			     go-guru-callers
			     go-guru-callees
			     go-guru-expand-region
			     go-guru-set-scope)
		     :action (lambda (candidate)
			       (funcall-interactively (intern candidate))))
	  :buffer "*go-guru command*")))

(use-package paredit
  :defer t
  :hook ((emacs-lisp-mode lisp-mode scheme-mode) . paredit-mode)
  :bind (:map paredit-mode-map
	      ("C-<up>" . paredit-backward-slurp-sexp)
	      ("C-<down>" . paredit-backward-barf-sexp)))

(use-package rainbow-delimiters
  :defer t
  :hook ((emacs-lisp-mode lisp-mode erlang-mode scheme-mode) . rainbow-delimiters-mode))

(use-package elisp-mode
  :defer t
  :config
  (add-to-list 'company-backends 'company-elisp))

(use-package erlang
  :defer t
  :bind (:map erlang-mode-map
	      ("C-c l" . erlang-indent-current-buffer)
	      ("C-c h o" . erlang-tempo-helm))
  :config
  ;; (global-flycheck-mode)
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  (add-to-list 'company-backends 'company-erlang)
  (company-erlang-init)
  (ivy-erlang-complete-init)
  :preface
  (defun erlang-tempo-helm ()
    (interactive)
    (helm :sources (helm-build-in-buffer-source "erlang-tempo-helm"
		     :data '(tempo-template-erlang-if
			     tempo-template-erlang-loop
			     tempo-template-erlang-spec
			     tempo-template-erlang-case
			     tempo-template-erlang-after
			     tempo-template-erlang-author
			     tempo-template-erlang-module
			     tempo-template-erlang-receive
			     tempo-template-erlang-gen-lib
			     tempo-template-erlang-gen-fsm
			     tempo-template-erlang-function
			     tempo-template-erlang-gen-event
			     tempo-template-erlang-wx-object
			     tempo-template-erlang-supervisor
			     tempo-template-erlang-application
			     tempo-template-erlang-gen-corba-cb
			     tempo-template-erlang-large-header
			     tempo-template-erlang-small-server
			     tempo-template-erlang-small-header
			     tempo-template-erlang-ts-test-suite
			     tempo-template-erlang-normal-header
			     tempo-template-erlang-generic-server
			     tempo-template-erlang-ct-test-suite-l
			     tempo-template-erlang-ct-test-suite-s
			     tempo-template-erlang-supervisor-bridge
			     tempo-template-erlang-gen-statem-StateName
			     tempo-template-erlang-gen-statem-handle-event)
		     :action (lambda (candidate)
			       (funcall-interactively (intern candidate))))
	  :buffer "*erlang-tempo command")))

(use-package python-mode
  :defer t
  :config
  (setq python-indent-offset 4))

(use-package elpy
  :defer t
  :config
  (setq elpy-rpc-backend "jedi")
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--simple-prompt --pprint")
  (elpy-enable)
  (unbind-key "C-c C-r f" elpy-mode-map)
  :bind (:map elpy-mode-map
	      ("C-c l" . elpy-format-code)
	      ("C-c C-l" . elpy-format-code)))

(use-package dockerfile-mode
  :defer t
  :mode "Dockerfile\\'")

(use-package org
  :defer t
  :config
  (setq org-confirm-babel-evaluate nil)
  (setq org-src-fontify-natively t)
  (setq org-startup-truncated nil)
  (setq org-html-validation-link nil)
  (setq org-html-htmlize-output-type 'css)
  (org-babel-do-load-languages 'org-babel-load-languages
			       '((shell . t)
				 (python . t)
				 (erlang . t)
				 (C . t)
				 (dot . t)
				 (lisp . t)
				 (ditaa . t)
				 (go . t)
				 (matlab . t)))
  (setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")
  (set-face-foreground 'org-meta-line "#585858")
  (set-face-foreground 'org-block "#bcbcbc")
  (set-face-foreground 'org-document-info-keyword "#585858")
  (set-face-foreground 'org-document-info "#585858")
  (set-face-foreground 'org-document-title "white")
  (set-face-foreground 'org-table "#00afd7")
  (set-face-foreground 'org-code "#00af5f")
  (add-to-list 'org-structure-template-alist
	       '("cpp" "#+header: :results output\n#+header: :exports both\n#+header: :tangle no\n#+header: :flags -std=c++17 -Isrc\n#+header: :includes \n#+header: :namespaces std\n#+header: :main no\n#+BEGIN_SRC C++ -r -l \"//\(ref:%s\)\"\n?\n#+END_SRC" ""))
  :bind (("C-c o" . org-open-at-point)))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :config
  (setq markdown-command "multimarkdown")
  (setq markdown-css-paths '("/home/xfwduke/Documents/github-markdown.css"))
  (setq markdown-xhtml-body-preamble "<article class='markdown-body'>")
  (setq markdown-xhtml-body-epilogue "</article>")
  (setq markdown-xhtml-header-content "
<style>
	.markdown-body {
  		box-sizing: border-box;
  		min-width: 200px;
  		max-width: 980px;
  		margin: 0 auto;
  		padding: 45px;
  	}

  	@media (max-width: 767px) {
  		.markdown-body {
  			padding: 15px;
  		}
  	}
</style>
"))

;; (use-package benchmark-init
;;   :init
;;   (benchmark-init/activate)
;;   :hook
;;   (after-init . benchmark-init/deactivate))

(provide 'init)
;;;
