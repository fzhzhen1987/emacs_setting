;;加载init-packages
;;(load-file"~/.emacs.d/init-packages.el")
(add-to-list 'load-path "~/.emacs.d/fzh_emacs")
(require 'init-packages)




;;定义yes为y
(defalias 'yes-or-no-p 'y-or-n-p)

;;关闭菜单栏
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;;关闭启动画面
(setq inhibit-startup-message t)

;;快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)


;;reload init.el
(global-set-key (kbd "<f6>") 'eval-buffer)

;;取消自动保存和备份
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq recentf-mode nil)
;(setq recentf-list nil)


;;删除选定 配合鼠标shift
(delete-selection-mode t)


;;全屏显示
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;括号配对显示 在after-init模式下使用show-paren
(add-hook 'after-init-hook 'show-paren-mode)


;;高亮当前行
(global-hl-line-mode t)



(global-set-key (kbd "C-h") 'nil)

;;undo tree
(global-set-key (kbd "C-z") 'undo-tree-visualize)

;;windmove-mode
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings)
  (global-set-key (kbd "C-h C-a")  'windmove-left)
  (global-set-key (kbd "C-h C-d") 'windmove-right)
  (global-set-key (kbd "C-h C-w")    'windmove-up)
  (global-set-key (kbd "C-h C-s") 'windmove-down))


;; c-mode indent
(defun my-c-mode-hook ()
  (c-set-style "linux")
;  (define-key c-mode-map (kbd "C-c C-t") 'ff-find-other-file)
  )

(add-hook 'c-mode-hook 'my-c-mode-hook)


;;swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'find-function)
(global-set-key (kbd "<f1> v") 'find-variable)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)


;;windresize
(global-set-key (kbd "C-h C-m") 'windresize)




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

;;手动刷新buff快捷键
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)


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


;;键位
;(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-<left>") 'backward-sexp)
(global-set-key (kbd "C-<right>") 'forward-sexp)
(global-set-key (kbd "M-n") 'mark-word)

;;高亮当前同样单词
(global-set-key (kbd "C-h C-o") 'highlight-symbol-at-point)
(global-set-key (kbd "C-h C-f") 'unhighlight-regexp)

;;buffer删除
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-h C-k") 'kill-some-buffers)

;;开始标记单词
(global-set-key (kbd "C-h C-h") 'set-mark-command)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

