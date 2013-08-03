(require 'package)
(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(setq-default transient-mark-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; no backup
(setq make-backup-files nil)

;; Input Chinese, conflict with ibus short cut
(global-unset-key (kbd "S-<SPC>"))
;;(define-key (kbd "S-<SPC>") nil)

;; color theme(M-x package-install xx)
(load-theme 'zenburn t)
;; (load-theme 'solarized-dark t)

(require 'ido)
(ido-mode t)

;;set ipython as default python shell
;;(setq
;; python-shell-interpreter "ipython"
;; python-shell-interpreter-args ""
;; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;; python-shell-completion-setup-code
;;   "from IPython.core.completerlib import module_completion"
;; python-shell-completion-module-string-code
;;   "';'.join(module_completion('''%s'''))\n"
;; python-shell-completion-string-code
;;   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;;el-get
;;https://github.com/dimitri/el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)


;;enable jedi autocompletion
;;(add-hook 'python-mode-hook 'auto-complete-mode)
;;(add-hook 'python-mode-hook 'jedi:setup)

;;enable flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; python
(elpy-enable)
;; use IPtython
(elpy-use-ipython)

;; ess
(require 'ess-site)

 ;; Clojure
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(setq auto-mode-alist (cons '("\\.edn$" . clojure-mode) auto-mode-alist))  ; *.edn are Clojure files
(setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist)) ; *.cljs are Clojure files
 
;; nREPL customizations
(require 'nrepl)
(setq nrepl-hide-special-buffers t)                                        ; Don't show buffers like connection or server
(setq nrepl-popup-on-error nil)                                            ; Don't popup new buffer for errors (show in nrepl buffer)
(setq nrepl-popup-stacktraces-in-repl t)                                   ; Display stacktrace inline
 
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)          ; Enable eldoc - shows fn argument list in echo area
(add-hook 'nrepl-mode-hook 'paredit-mode)                                  ; Use paredit in *nrepl* buffer
 
(add-to-list 'same-window-buffer-names "*nrepl*")                          ; Make C-c C-z switch to *nrepl*
 
;; Scala
;; Ensime
(add-to-list 'load-path "/home/lxd/.emacs.d/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;;enable linum mode
;;(add-hook 'python-mode-hook 'linum-mode)
(global-linum-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("3d6b08cd1b1def3cc0bc6a3909f67475e5612dba9fa98f8b842433d827af5d30" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
'(font-lock-warning-face ((t (:inherit nil :foreground "red" :background nil))))
'(linum-highlight-face ((t (:inherit default :background "color-238" :foreground "white"))))
'(show-paren-match ((((class color) (background dark)) (:inherit nil :foreground "red")))))
