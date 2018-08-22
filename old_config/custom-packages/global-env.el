;; (electric-pair-mode 1)
;; (menu-bar-mode -1)
;; (set-face-foreground 'minibuffer-prompt "white")
;; (setq inhibit-startup-screen t)
;; (setq shell-file-name "/bin/bash")

;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-13"))

;; (setq-default mode-line-format
;; 	      '(
;; 		"%e" mode-line-front-space
;; 		(:eval (concat "No." (window-numbering-get-number-string)))
;; 		" %l:%c  "
;; 		mode-line-modified
;; 		"  "
;; 		default-directory
;; 		"%b  "
;; 		(vc-mode vc-mode)
;; 		"  (%m)  "
;; 		(which-func-mode ("" which-func-format " "))
;; 		"%p"
;; 		"(%I)"
;; 		mode-line-end-spaces))

;; (require 'window-numbering)
;; (window-numbering-mode 1)

;; (require 'paren)
;; (show-paren-mode 1)
;; (set-face-background 'show-paren-match "#00ff00")
;; (set-face-foreground 'show-paren-match "#0000ff")
;; (set-face-attribute 'show-paren-match nil :weight 'extra-bold)



;; (define-key input-decode-map "\e[1;5A" [C-up])
;; (define-key input-decode-map "\e[1;5B" [C-down])
;; (define-key input-decode-map "\e[1;5C" [C-right])
;; (define-key input-decode-map "\e[1;5D" [C-left])
;; (define-key input-decode-map "\e[1;9A" [M-up])
;; (define-key input-decode-map "\e[1;9B" [M-down])
;; (define-key input-decode-map "\e[1;9C" [M-right])
;; (define-key input-decode-map "\e[1;9D" [M-left])
;; (define-key input-decode-map "\e[1;10A" [M-S-up])
;; (define-key input-decode-map "\e[1;10B" [M-S-down])
;; (define-key input-decode-map "\e[1;10C" [M-S-right])
;; (define-key input-decode-map "\e[1;10D" [M-S-left])

(provide 'global-env)
