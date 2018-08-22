;;; prog-mode-config.el --- prog mode config         -*- lexical-binding: t; -*-

;; Copyright (C) 2017  xfwduke

;; Author: xfwduke <xfwduke@xfwdukedeMacBook.local>
;; Keywords:


(add-to-list 'load-path
	     (expand-file-name "custom-packages/prog-mode-configs" user-emacs-directory))

(require 'prog-utils-config)

;;;###autoload
(defun init-c-mode ()
  (require 'c-mode-config)
  (require 'irony)
  (flycheck-mode 1)
  ;; (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  ;; (add-to-list 'flycheck-clang-include-path "/usr/src/linux-headers-4.9.0-3-amd64/include")
  ;; (add-to-list 'flycheck-clang-include-path "/usr/include/")
  ;; (add-to-list 'flycheck-clang-include-path "/lib/modules/4.9.0-3-amd64/source/include/")
  ;; (add-to-list 'flycheck-gcc-include-path "/usr/include/")
  ;; (add-to-list 'flycheck-gcc-include-path "/lib/modules/4.9.0-3-amd64/source/include/")
  ;; (flycheck-pos-tip-mode)
  ;; (setq flycheck-disabled-checkers '(c/c++-clang))
  ;; (setq flycheck-enabled-checkers '(c/c++-gcc))
  (irony-mode 1)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (yas-global-mode 1)
  (do-company-mode-init)
  (company-mode-on)
  (add-to-list 'company-backends 'company-irony)
  (add-to-list 'company-backends 'company-irony-c-headers)
  (do-c-mode-init))

;; ;;;###autoload
;; (defun init-golang-mode ()
;;   (require 'golang-mode-config)
;;   (yas-global-mode 1)
;;   (do-golang-mode-init)
;;   (do-company-mode-init)
;;   (company-mode-on)
;;   (setq company-backends (add-to-list 'company-backends 'company-go)))

;; ;;;###autoload
;; (defun init-python-mode ()
;;   (require 'python-mode-config)
;;   (do-python-mode-init)
;;   (do-company-mode-init)
;;   (do-which-function-mode-init))

;; ;;;###autoload
;; (defun init-lisp-mode ()
;;   (require 'slime-mode-config)
;;   (do-slime-mode-init)
  ;; (do-which-function-mode-init)
  ;; (do-paredit-mode-init)
  ;; (rainbow-delimiters-mode)
  ;; (do-indent-guide-mode-init))

;; ;;;###autoload
;; (defun init-elisp-mode ()
;;   "elisp mode 在启用 solarize theme的时候
;; 不知道为什么主题中 rainbow delimiter 的 face 定义会失效
;; solarized-definitions.el 中的 solarized-color-definitions: 
;;                 ;; (rainbow-delimiters-depth-1-face (:inherit outline-1))
;;                 ;; (rainbow-delimiters-depth-2-face (:inherit outline-2))
;;                 ;; (rainbow-delimiters-depth-3-face (:inherit outline-3))
;;                 ;; (rainbow-delimiters-depth-4-face (:inherit outline-4))
;;                 ;; (rainbow-delimiters-depth-5-face (:inherit outline-5))
;;                 ;; (rainbow-delimiters-depth-6-face (:inherit outline-6))
;;                 ;; (rainbow-delimiters-depth-7-face (:inherit outline-7))
;;                 ;; (rainbow-delimiters-depth-8-face (:inherit outline-8))
;; outline[1-8] 没有值了
;; 改成
;;                 (rainbow-delimiters-depth-1-face (,@fg-blue))
;;                 (rainbow-delimiters-depth-2-face (,@fg-cyan))
;;                 (rainbow-delimiters-depth-3-face (,@fg-yellow))
;;                 (rainbow-delimiters-depth-4-face (,@fg-red))
;;                 (rainbow-delimiters-depth-5-face (,@fg-base0))
;;                 (rainbow-delimiters-depth-6-face (,@fg-base01))
;;                 (rainbow-delimiters-depth-7-face (,@fg-orange))
;;                 (rainbow-delimiters-depth-8-face (,@fg-violet))
;; 能正常工作
;; "
;;   (rainbow-delimiters-mode)
;;   (do-which-function-mode-init)
;;   (do-paredit-mode-init)
;;   (company-mode)
;;   (do-company-mode-init)
;;   (do-indent-guide-mode-init))


(provide 'prog-mode-config)
