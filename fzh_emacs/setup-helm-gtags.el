(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in Eshell for the same reason as above
(add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; key bindings

(define-key helm-gtags-mode-map (kbd "C-j f") 'helm-gtags-find-tag-from-here)

(define-key helm-gtags-mode-map (kbd "C-j r") 'helm-gtags-find-rtag)
(define-key helm-gtags-mode-map (kbd "C-j s") 'helm-gtags-find-symbol)

(define-key helm-gtags-mode-map (kbd "C-j h s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "C-j h f") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j h i") 'helm-semantic-or-imenu)

(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)


(define-key helm-gtags-mode-map (kbd "C-j p") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-j n") 'helm-gtags-next-history)

(define-key helm-gtags-mode-map (kbd "C-j o") 'helm-gtags-find-tag-other-window)

(define-key helm-gtags-mode-map (kbd "C-j b") 'helm-gtags-resume)
(define-key helm-gtags-mode-map (kbd "C-j c") 'helm-projectile-find-file)
(define-key helm-gtags-mode-map (kbd "C-j v") 'helm-gtags-select-path)

(define-key helm-gtags-mode-map (kbd "C-j a") 'helm-projectile-ag)
(provide 'setup-helm-gtags)
