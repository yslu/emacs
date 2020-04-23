;;;;;
;;
;; Roamer's .emacs init file
;;
;; 1, Minimize customizations to be portable.
;; 2, C and Golang support
;; 
;; Face customized for MacOS, while it's easy to modify for Linux.
;;;

;;;;;
;; MELPA initialization
;;
;; Added by Package.el.  This must come before configurations of installed packages.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://stable.melpa.org/packages/")
   t))

;;;;;
;; Customized Emacs packages, modes, and faces
;;
;; Language Packages: go-guru, go-mode, lsp-mode, protobuf-mode, yaml-mode, json-mode
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 '(column-number-mode t)
 '(display-time-mode t)
 '(package-selected-packages
   (quote
    (go-guru go-mode lsp-mode yasnippet protobuf-mode yaml-mode json-mode)))
 '(tool-bar-mode nil)
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 '(default ((t (:background "black" :foreground "white" :family "Courier New" :foundry "nil" :slant normal :weight normal :height 150 :width normal)))))
;;(when (member "Avenir Next" (font-family-list)) (set-frame-font "Avenir Next" t t))

;;;;;
;; Golang support: go-mode, lsp-mode
;;
;; Install required packages from MELPA. `M-x install-package`
;;
;; References:
;;   go-mode: https://github.com/dominikh/go-mode.el
;;   lsp-mode: https://github.com/emacs-lsp/lsp-mode

;; use lsp-mode with gopls as backend
(add-hook 'go-mode-hook 'lsp-deferred)

;; Add $GOROOT and $GOPATH to exec-path and $PATH
;; When emacs is not started from a shell, these are required to enable gopls, godef, etc.
(setq exec-path (append '("/Users/yunsong/Work/go/bin") exec-path))
(setq exec-path (append '("/usr/local/go/bin") exec-path))
(setenv "PATH" (concat "/Users/yunsong/Work/go/bin:/usr/local/go/bin" ":" (getenv "PATH")))

;;;;;
;; Linux C Mode
;;
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq c-basic-offset 8))

;;;;;
;; Cscope
;;
;;(add-to-list 'load-path "~/.emacs.d/")
;; Enable cscope
;;(require 'xcscope)

;; Secondary load path for packages. Check and download packages through MELPA if possible
;;(add-to-list 'load-path "~/.emacs.d/lisp/")

;;;;;
;; Shell customizations: zsh on Mac, bash on Linux
;;
;; Stop zsh from echoing commands
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init)

;; Set default work directory
(setq default-directory "~/Work/" )

;; Open shells and split horizontally.
(shell)
(rename-buffer "z-shell")
(shell)
(rename-buffer "y-shell")
(shell)
(rename-buffer "x-shell")

(delete-window)
(split-window-horizontally)
