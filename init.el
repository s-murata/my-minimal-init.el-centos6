(let ((default-directory (expand-file-name "~/.emacs.d/local-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(load "emacs21-256color-hack.el")

(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

(global-font-lock-mode t)

(setq make-backup-files nil)

(setq completion-ignore-case t)

(global-auto-revert-mode 1)

(global-hl-line-mode t)
(custom-set-faces
'(hl-line ((t (:background "color-236"))))
)

(show-paren-mode t)
(setq show-paren-style 'mixed)

(transient-mark-mode t)

;; cperl-mode
(autoload 'cperl-mode "cperl-mode" nil t) ;; cperl-modeを使ってます。
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode)) ;; shebang(#!…)に"perl"があったらcperl-mode
(add-to-list 'auto-mode-alist '("\\.\\(p[lm]\\|f?cgi\\|t\\)$" . cperl-mode)) ;; こういう拡張子もcperl-mode
(defalias 'perl-mode 'cperl-mode) ;; perl-modeもcperl-mode
(setq cperl-highlight-variables-indiscriminately t)
(setq cperl-indent-parens-as-block t)
(setq cperl-indent-subs-specially nil)

(setq indent-tabs-mode nil)

(add-hook 'cperl-mode-hook 
          (function (lambda ()
                      (set-face-background 'cperl-hash-face "black")
                      (set-face-background 'cperl-array-face "black")
)))

;; dsvn.el
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

;;; Visual Basic mode
(load-library "visual-basic-mode")
(add-to-list 'auto-mode-alist
   '("\\.\\(frm\\|bas\\|cls\\|vbs\\)$" . visual-basic-mode))