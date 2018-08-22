;;; file-template.el --- file templates collection   -*- lexical-binding: t; -*-

;; Copyright (C) 2017  xfwduke

;; Author: xfwduke <xfwduke@xfwdukedeMacBook.local>
;; Keywords: 

(require 'autoinsert)

(auto-insert-mode)
(setq auto-insert-directory
      (expand-file-name "file_templates" user-emacs-directory))
(setq auto-insert-query nil)

(add-hook 'python-mode-hook (lambda () (interactive)
			      (define-auto-insert "\.py" "my-python-template.py")))

(provide 'file-template)
