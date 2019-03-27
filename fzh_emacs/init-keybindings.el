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


;;reload init.el
(global-set-key (kbd "<f6>") 'eval-buffer)


;;swiper
;;(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'find-function)
(global-set-key (kbd "<f1> v") 'find-variable)
(global-set-key (kbd "C-x b") 'switch-to-buffer)


;;windresize
(global-set-key (kbd "C-h C-m") 'windresize)


;;手动刷新buff快捷键
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)


;;键位
(global-set-key (kbd "C-<left>") 'backward-sexp)
(global-set-key (kbd "C-<right>") 'forward-sexp)
(global-set-key (kbd "M-n") 'er/expand-region)

;;高亮当前同样单词
(global-set-key (kbd "C-h C-o") 'highlight-symbol-at-point)
(global-set-key (kbd "C-h C-f") 'unhighlight-regexp)

;;buffer删除
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-h C-k") 'kill-some-buffers)

;;开始标记单词
(global-set-key (kbd "C-h C-h") 'set-mark-command)

;;这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;;bookmark
(global-set-key (kbd "C-h C-j l") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-h C-j a") 'bookmark-set)

;;C-w删除区域和C-k删除行整合到C-k
(global-set-key (kbd "C-k") 'joseph-kill-region-or-line)

;;向前删除一个单词
(global-set-key (kbd "C-w") 'backward-kill-word)


;;注释代码
(global-set-key "\M-;" 'fzh-comment-dwim-line)

;;删除前一个字符
(global-set-key (kbd "C-l") 'delete-backward-char)

;;缩进区域或者整个buff
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)


;bookmark
(global-set-key (kbd "C-h C-j l") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-h C-j a") 'bookmark-set)


;;使用dired mode时,打开不同的目录都不会生成新的buff
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


;;company 使用C-n C-p上下选择
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;;在helm-ag模式中加入wgrep模式，可是只能使用一次，第二次使用需要从M-x中查找
;;所以加到全局变量中
;;(with-eval-after-load 'helm-ag
;;  (define-key helm-ag-mode-map (kbd "C-c C-p") 'wgrep-change-to-wgrep-mode))
(global-set-key (kbd "C-c C-p ") 'wgrep-change-to-wgrep-mode) 


;;iedit实现多行同时编辑
(global-set-key (kbd "C-h m") 'iedit-mode)


(provide 'init-keybindings)
