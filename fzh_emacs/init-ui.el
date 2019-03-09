;;定义yes为y
(defalias 'yes-or-no-p 'y-or-n-p)


;;关闭菜单栏
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)


;;关闭启动画面
(setq inhibit-startup-message t)


;;光标样式
(setq-default cursor-type 'bar)


;;取消自动保存和备份
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq recentf-mode nil)
;;(setq recentf-list nil)


;;高亮当前行
(global-hl-line-mode t)


;;全屏显示
(setq initial-frame-alist (quote ((fullscreen . maximized))))


;;括号配对显示 在after-init模式下使用show-paren
(add-hook 'after-init-hook 'show-paren-mode)

;;在括号中也显示括号头尾
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))


;;删除选定 配合鼠标shift,标记后可以可替换
(delete-selection-mode t)


;;C-k删除整行包括回车
(setq kill-whole-line t)


;;操作read-only buffer不提示警告
(setq kill-read-only-ok t)


;;将C-k和C-w功能整合到C-k
(defun joseph-kill-region-or-line(&optional arg)
  "this function is a wrapper of (kill-line).
  When called interactively with no active region, this function
  will call (kill-line) ,else kill the region."
  (interactive "P")
  (if mark-active
      (if (= (region-beginning) (region-end) ) (kill-line arg)
	(kill-region (region-beginning) (region-end)))
    (kill-line arg)))


;;当没有选中区域,默认复制整行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Current row has been selected!")
     (list (line-beginning-position)
           (line-beginning-position 2)))))


;;注释代码
(defun fzh-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))


;;重新缩进全部缓冲去代码
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max))) ;;indent-region 需要的参数是(point-min) 和(point-max)

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion			;;在执行语句之前会保存光标位置,执行语句之后恢复光标位置
    (if (region-active-p)		;;判断成立就进入一个indent-region mode  -p就是判断的作用
        (progn				;;如果成立 就会得到 region-beginning 开始位置 和 region-end 结束位置
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn				;;否则就执行下面的整个buff都缩进
        (indent-buffer)
        (message "Indent buffer.")))))


;;在顶部显示行所在函数名,模式栏中的函数显示关闭
(which-func-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format ""))))

(setq mode-line-misc-info
      ;; We remove Which Function Mode from the mode line, because it's mostly
      ;; invisible here anyway.
      (assq-delete-all 'which-function-mode mode-line-misc-info))


;; c-mode indent
(defun my-c-mode-hook ()
  (c-set-style "linux")
 ;; (define-key c-mode-map (kbd "C-c C-t") 'ff-find-other-file)
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


;; 打开.c结尾文件使用c-mode,Makefile用gun make
(setq auto-mode-alist
      (append
       '(("\\.c\\'" . c-mode)
	 ("\\.h\\'" . c-or-c++-mode)
	 )
       '(("\\.mk\\'" . makefile-gmake-mode)
	 ("\\.make\\'" . makefile-gmake-mode)
	 ("[Mm]akefile\\'" . makefile-gmake-mode))
       auto-mode-alist))


;; always delete and copy recursively 递归删除或拷贝不询问
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)


;;使用dired mode时,打开不同的目录都不会生成新的buff
(put 'dired-find-alternate-file 'disabled nil)


;;C-x C-j 打开当前目录的dired mode
(require 'dired-x)


;;当使用dired mode 打开复制元和复制先,使用复制会自动提示复制先目录
(setq dired-dwim-target t)


;;在elisp模式下'符号取消自动匹配
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)


;;在两种模式中禁用匹配符号
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)


;;删除win下文件的末尾回车符号,使用remove-dos-eol
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min));;跳转到行数的开头
  (while (search-forward "\r" nil t) (replace-match "")));;循环查找\r结尾替换成空字符串



(provide 'init-ui)
