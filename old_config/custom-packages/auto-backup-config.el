;;; auto-backup-config.el --- emacs auto backup config  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  xfwduke

;; Author: xfwduke <xfwduke@xfwdukedeMacBook.local>
;; Keywords:

;; backup will be inhibited if the file was tracked by Version Control (eg: git)
;; (setq backup-file-dir (expand-file-name "~/.emacs_saves"))
;; (unless (file-exists-p backup-file-dir)
;;   (make-directory backup-file-dir))

;; (setq backup-by-copying t)
;; (setq backup-directory-alist `((".*" . ,backup-file-dir)))
;; (setq delete-old-versions t)
;; (setq kept-new-versions 6)
;; (setq kept-old-versions 2)
;; (setq version-control t)
;; (let ((week (* 60 60 24 7))
;;       (current (float-time (current-time))))
;;   (dolist (file (directory-files backup-file-dir))
;;     (when
;; 	(and (backup-file-name-p file)
;; 	     (> (- current
;; 		   (float-time (nth 5 (file-attributes file))))
;; 		week))
;;       (message "%s" file)
;;       (delete-file file))))

;; (provide 'auto-backup-config)
