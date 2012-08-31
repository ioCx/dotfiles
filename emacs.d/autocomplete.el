(provide 'autocomplete)

(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/el-get/yasnippet/snippets")

(require 'auto-complete-config)
(require 'auto-complete-clang)
(require 'auto-complete-yasnippet)

(require 'auto-complete-emacs-lisp)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")

                                        ;(ac-config-default)

(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/../../../../include/c++/4.7.1
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/../../../../include/c++/4.7.1/x86_64-unknown-linux-gnu
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/../../../../include/c++/4.7.1/backward
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/include
 /usr/local/include
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/include-fixed
 /usr/include
"
               )))

(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev
                             ac-source-dictionary
                             ac-source-filename
                             ac-source-words-in-same-mode-buffers))
  ;; (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (add-hook 'auto-complete 'ac-common-setup)
  (global-auto-complete-mode t))

(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

(my-ac-config)

;; auto-complete-latex
;(setq ac-l-dict-directory "~/emacs.d/el-get/auto-complete-latex/ac-l-dict")
;(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of {{{latex-mode}}}
;(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
;  (setq ac-sources
;     (append '(ac-source-math-latex ac-source-latex-commands  ac-source-math-unicode)
;               ac-sources))
;)
;(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(ac-set-trigger-key "TAB")
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)

;; Key mappings
(setq ac-use-menu-map t)

;(define-key ac-menu-map "\C-n" 'ac-next)
;(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-menu-map (kbd "TAB") 'ac-next)
;(define-key ac-menu-map (kbd "M-TAB") 'ac-previous)
(define-key ac-menu-map (kbd "<backtab>") 'ac-previous)
