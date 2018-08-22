;;; slime-mode-config.el --- slime mode config         -*- lexical-binding: t; -*-

;; Copyright (C) 2017  xfwduke

;; Author: xfwduke <xfwduke@xfwdukedeMacBook.local>
;; Keywords:

;;;###autoload
;; (defun do-slime-mode-init ()

;;   (use-package slime
;;     :commands (slime)
;;     :config
;;     (setq slime-contribs '(slime-fancy))
;;     (setq slime-lisp-implementations 
;; 	  `((sbcl
;; 	     ("/usr/local/bin/sbcl"
;; 	      "--core" ,(expand-file-name "~/.slime/sbcl.core-with-swank")
;; 	      "--sysinit" ,(expand-file-name "sbclrc" user-emacs-directory))
;; 	     :init (lambda (port-file _)
;; 		     (format "(swank:start-server %S)\n" port-file)))
;; 	    (clisp
;; 	     ("/usr/local/bin/clisp"
;; 	      "-i" ,(concat user-emacs-directory "clisprc"))
;; 	     :coding-system utf-8-unix)))
;;     (setq common-lisp-hyperspec-root
;; 	  (concat "file://"
;; 		  (expand-file-name user-emacs-directory) "HyperSpec/"))
;;     (slime-setup '(slime-fancy slime-company))
;;     (advice-add 'slime :around #'split-window-around-slime)

;;   (use-package slime-repl
;;     :defer t
;;     :config
;;     (add-hook 'slime-repl-mode-hook
;; 	      (lambda ()
;; 		(paredit-mode +1)
;; 		(define-key slime-repl-mode-map
;; 		  (read-kbd-macro
;; 		   paredit-backward-delete-key) nil)))
;;     )
  
;;     :preface
;;     (defun split-window-around-slime (orig-fun &rest args)
;;       (let ((lisp-buffer (current-buffer))
;; 	    (lisp-win (selected-window)))
;; 	(split-window nil nil 'right)
;; 	(apply orig-fun args)
;; 	(select-window lisp-win)
;; 	(set-buffer lisp-buffer)))
;;     ))

;; (provide 'slime-mode-config)
