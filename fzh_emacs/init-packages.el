;;制作自己的自动安装包脚本
(require 'cl)
(when (> emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


(defvar fzh/packages '(
		       helm
		       helm-gtags
		       helm-projectile
		       helm-swoop
		       helm-ag
		       smooth-scrolling
		       ag
		       undo-tree
		       which-key
		       company
		       windresize
		       monokai-theme
		       hungry-delete
		       swiper
		       counsel
		       smartparens
		       popwin
		       expand-region
		       wgrep-helm
		       iedit
		       powerline
		       )  "Default packages")

;;将package-selected-packages设置为我自己的列表package auto remove就不会删除我的包
(setq package-selected-packages fzh/packages)

(defun fzh/packages-installed-p ()
    (loop for pkg in fzh/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (fzh/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg fzh/packages)
      (when (not (package-installed-p pkg))
(package-install pkg))))



;;括号自动补齐
;;(require 'smartparens-config)    因为;;;###autoload会自动加载无需require
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;;(electric-pair-mode)

;;hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)


;;swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;;平滑显示
(setq smooth-scrolling-mode t)
(require 'smooth-scrolling) (setq smooth-scroll-margin 4)


;;popwin弹窗管理
(require 'popwin)
(popwin-mode 1)

(push '(" *undo-tree*" :width 0.2 :position left) popwin:special-display-config)


;;undo tree
(require 'undo-tree)
(global-undo-tree-mode)


;;显示命令
(which-key-setup-side-window-right)
(which-key-mode 1)


;;company使用
(global-company-mode t)
;;(add-hook 'after-init-hook 'global-company-mode)


;;加载主题
(load-theme 'monokai t)


;;添加powerline
(require 'powerline)
(powerline-default-theme)



;;加载此文件需要的变量名
(provide 'init-packages)
