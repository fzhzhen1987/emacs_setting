;;加载init-packages等配置
;;(load-file"~/.emacs.d/init-packages.el")
(add-to-list 'load-path "~/.emacs.d/fzh_emacs")

;;快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


(require 'init-packages)
(require 'init-ui)
(require 'init-keybindings)

(setq custom-file (expand-file-name "fzh_emacs/custom.el" user-emacs-directory))


(load-file custom-file)

;; c-mode indent
(defun my-c-mode-hook ()
  (c-set-style "linux")
;  (define-key c-mode-map (kbd "C-c C-t") 'ff-find-other-file)
  )

(add-hook 'c-mode-hook 'my-c-mode-hook)


;;手动刷新buff
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))



;; 打开.c结尾文件使用c-mode 
(setq auto-mode-alist
      (append
       '(("\\.c\\'" . c-mode)
	 ("\\.h\\'" . c-or-c++-mode)
	 )
       '(("\\.mk\\'" . makefile-gmake-mode)
	 ("\\.make\\'" . makefile-gmake-mode)
	 ("[Mm]akefile\\'" . makefile-gmake-mode))
       auto-mode-alist))




;下面的设置必须在加载helm-gtags

(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'helm-projectile)



;(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

(global-set-key (kbd "C-h C-b") 'helm-resume)

