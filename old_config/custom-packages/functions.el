;;; functions.el --- custom functions                -*- lexical-binding: t; -*-

;; Copyright (C) 2017  xfwduke

;; Author: xfwduke <xfwduke@xfwdukedeMacBook.local>
;; Keywords: 

;; ;;;###autoload
;; (defun go-run ()
;;   (interactive)
;;   (shell-command (concat "go run "
;; 			 (read-shell-command "go run: " buffer-file-name))))

;; ;;;###autoload
;; (defun toggle-line-number (-linum-type)
;;   "Switch line number mode
;;   -linum-type:
;;   0 -> close
;;   1 -> relative
;;   2 -> absolute"
;;   (interactive)
;;   (case (mod -linum-type 3)
;;     (0 (progn
;; 	 (global-relative-line-numbers-mode 0)
;; 	 (global-linum-mode 0)))
;;     (1 (progn
;; 	 (global-relative-line-numbers-mode t)
;; 	 (global-linum-mode 0)))
;;     (2 (progn
;; 	 (global-relative-line-numbers-mode 0)
;; 	 (global-linum-mode t)))))

;; ;;;###autoload
;; (defun ztl-modification-state-change ()
;;   (tabbar-set-template tabbar-current-tabset nil)
;;   (tabbar-display-update))

;; ;;;###autoload
;; (defun ztl-on-buffer-modification ()
;;   (set-buffer-modified-p t)
;;   (ztl-modification-state-change))

;; ;;;###autoload
;; (defun comment-or-uncomment-line-or-region()
;;   "comment code"
;;   (interactive)
;;   (if (region-active-p)
;;       (comment-or-uncomment-region (region-beginning) (region-end))
;;     (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
;;   (next-logical-line))

(provide 'functions)
