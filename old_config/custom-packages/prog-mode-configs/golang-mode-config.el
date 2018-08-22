;;;###autoload

;; (defun do-golang-mode-init ()
;;   (setq gofmt-command "goimports")
;;   (setq compile-command (concat "go build -v " buffer-file-name))
;;   (local-set-key (kbd "M-.") 'godef-jump)
;;   (local-set-key (kbd "M-,") 'pop-tag-mark)
;;   (local-set-key (kbd "C-c l") 'gofmt)
;;   (local-set-key (kbd "C-c C-l") 'gofmt)
;;   (local-set-key (kbd "C-c b") 'compile)
;;   (local-set-key (kbd "C-c C-b") 'compile)
;;   (local-set-key (kbd "C-c r") 'go-run)
;;   (local-set-key (kbd "C-c C-r") 'go-run)
;;   (local-set-key (kbd "C-c o") 'go-guru-helm)
;;   (local-set-key (kbd "C-c C-o") 'go-guru-helm)
;;   (setq tab-width 4)
;;   (add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
;;   (global-flycheck-mode)
;;   (require 'go-flycheck))

;; ;;;###autoload
;; (defun go-guru-helm ()
;;   (interactive)
;;   (helm :sources (helm-build-in-buffer-source "go-guru-helm"
;; 		   :data '(go-guru-describe
;; 			   go-guru-freevars
;; 			   go-guru-implements
;; 			   go-guru-peers
;; 			   go-guru-referrers
;; 			   go-guru-definition
;; 			   go-guru-pointsto
;; 			   go-guru-callstack
;; 			   go-guru-whicherrs
;; 			   go-guru-callers
;; 			   go-guru-callees
;; 			   go-guru-expand-region
;; 			   go-guru-set-scope)
;; 		   :action (lambda (candidate)
;; 		   	     (funcall-interactively (intern candidate))))
;; 	:buffer "*go-guru command*"))

;; (provide 'golang-mode-config)
