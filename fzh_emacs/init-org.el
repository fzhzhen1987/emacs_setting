
;;文件后缀为.txt文件使用org-mode
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))


;;org-edit-src-code弹出的Source Code Blocks设置
(require 'org)
(setq org-src-fontify-natively t
      org-src-preserve-indentation t
      org-src-tab-acts-natively t)


;;将C语言模式添加到org-src-lang-modes,可以通过describe-variable查看org-mode下
;;支持的编程语言格式
(add-to-list 'org-src-lang-modes '("C" . c))


;;org-insert-src-block函数,新建<s tab
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))


;;绑定org-insert-src-block按键,保存source block内容C-x C-s
(add-hook 'org-mode-hook '(lambda ()
;; keybinding for editing source code blocks
    (local-set-key (kbd "C-c e") 'org-edit-src-code)
;; keybinding for inserting code blocks
    (local-set-key (kbd "C-c i") 'org-insert-src-block)
			    ))

(provide 'init-org)
