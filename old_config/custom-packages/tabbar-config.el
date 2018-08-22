;;; tabbar-config.el --- tabbar config               -*- lexical-binding: t; -*-

;; Copyright (C) 2017  xfwduke

;; Author: xfwduke <xfwduke@xfwdukedeMacBook.local>
;; Keywords:

;; (require 'tabbar)

;; (tabbar-mode 1)
;; (setq tabbar-separator '(1.5))

;; (if (window-system)
;;     (set-face-attribute 'tabbar-default nil
;; 			:family "Source Code Pro"
;; 			:height 1
;; 			:underline nil)
;;   (set-face-attribute 'tabbar-default nil
;; 		      :underline nil))


;; (set-face-attribute 'tabbar-selected nil
;; 		    :background "white"
;; 		    :foreground "#0000ee"
;; 		    :underline nil)

;; (set-face-attribute 'tabbar-selected-modified nil
;; 		    :background "white"
;; 		    :foreground "red")

;; (set-face-attribute 'tabbar-button nil
;; 		    :box '(:line-width 1 :color "#333333" :style nil))

;; (advice-add 'tabbar-buffer-tab-label :filter-return
;; 	    (lambda (return-val)
;; 	      (if (and (buffer-modified-p (tabbar-tab-value tab))
;; 		       (buffer-file-name (tabbar-tab-value tab)))
;; 		  (concat " + " (concat return-val " "))
;; 		(concat " " (concat return-val " ")))))

;; (add-hook 'after-save-hook 'ztl-modification-state-change)
;; (add-hook 'first-change-hook 'ztl-on-buffer-modification)

;; (provide 'tabbar-config)
