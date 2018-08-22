;;; prog-utils-config.el --- prog utils config   -*- lexical-binding: t; -*-

;; Copyright (C) 2017  xfwduke

;; Author: xfwduke <xfwduke@xfwdukedeMacBook.local>
;; Keywords:

;; ;;;###autoload
;; (defun do-company-mode-init ()
;;   (use-package company
;;   :config
;;   (setq company-idle-delay 0)
;;   (setq company-minimum-prefix-length 2)
;;   (add-to-list 'company-backends 'company-yasnippet)
;;   (setq company-backends (remove
;;   			  'company-clang company-backends))
;;   ;; (setq company-backends (remove
;;   ;; 			  'company-c-headers company-backends))
;;   (setq company-backends (remove
;; 			  'company-semantic company-backends))
;;   :bind (:map company-active-map
;; 	      ("C-n" . company-select-next)
;; 	      ("C-p" . company-select-previous))))

;; ;;;###autoload
;; (defun do-paredit-mode-init ()
;;   (enable-paredit-mode)
;;   (eval-after-load 'paredit-mode
;;     (progn
;;       (define-key paredit-mode-map (kbd "C-<up>") 'paredit-backward-slurp-sexp)
;;       (define-key paredit-mode-map (kbd "C-<down>") 'paredit-backward-barf-sexp))))

;; ;;;###autoload
;; (defun do-which-function-mode-init ()
;;   (which-function-mode)
;;   (setq which-func-unknown " N/A ")
;;   (set-face-background 'which-func "white")
;;   (set-face-foreground 'which-func "#0000ee")
;;   )

;; ;;;###autoload
;; (defun do-indent-guide-mode-init ()
;;   (require 'indent-guide)
;;   (set-face-foreground 'indent-guide-face "#00d700")
;;   (indent-guide-mode)
;;   )


(provide 'prog-utils-config)
