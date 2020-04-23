# .emacs
  It's been pretty painful adding Golang support to emacs, and those "helpful"
  articles were based on strong assumptions and sometimes outdated.

  Thus, I'd list the steps setting up go-mode for emacs. Mostly focusing on
  those necessary steps.

## References
  Though you can look at README files of these projects, you may fail multiple
  times when trying them out. I still list them here for your reference. Open
  the links in new tabs in case you need to take a close look.
  1. 'go-mode' can be found at: https://github.com/dominikh/go-mode.el
  2. 'lsp-mode' is at: https://github.com/emacs-lsp/lsp-mode
  3. 'gopls' is at: https://github.com/golang/tools/blob/master/gopls/doc/emacs.md

  I wouldn't try those obsolated tools nor suggest wasting your time with them.
  Use ONLY those mainstream suports if possible.
  
## Installations
  Understand these steps before you start.
	
  1. Emacs should be the latest version on your system. Please try to update it
  to save your time in the future.
  2. Install the latest versions of MELPA Packages: 'go-guru', 'go-mode', 'lsp-mode'

    In case you already installed these packages, check their versions. Use the latest
    versions from MELPA. DO NOT waste your time with old versions.
  
  3. Install Golang packages:
	 - gopls: 
	 ```sh
	 $ go get golang.org/x/tools/gopls
	 ```
	 - guru: 
	 ```sh
	 $ go get golang.org/x/tools/cmd/guru
	 ```
  4. Update your .emacs file. Read the emacs file in this repo and copy the following
  sections to your .emacs file under your home directory.
  
  	;; use lsp-mode with gopls as backend
	(add-hook 'go-mode-hook 'lsp-deferred)

	;; Add $GOROOT and $GOPATH to exec-path and $PATH
	;; When emacs is not started from a shell, these are required to enable gopls, godef, etc.
	(setq exec-path (append '("/Users/yunsong/Work/go/bin") exec-path))
	(setq exec-path (append '("/usr/local/go/bin") exec-path))
	(setenv "PATH" (concat "/Users/yunsong/Work/go/bin:/usr/local/go/bin" ":" (getenv "PATH")))
	  
  5. Restart emacs, and open a .go file. Try 'C-c C-d', 'C-c C-j', 'M-x go-guru-callers'
  6. If anything failed, check out the lsp-stderr buffer 'M-x M-b'
