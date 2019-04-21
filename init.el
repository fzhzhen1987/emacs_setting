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
(require 'init-org)

(setq custom-file (expand-file-name "fzh_emacs/custom.el" user-emacs-directory))


(load-file custom-file)


;;下面的设置必须在加载helm-gtags

(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'helm-projectile)



;;(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)
