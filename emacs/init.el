(setq read-process-output-max (* 1024 1024)) ;; 1 MiB
(setq gc-cons-threshold (* 96 (* 1024 1024))) ;; 96 MiB
(setq package-native-compile t)
(setq native-comp-speed 3)
(setq native-comp-async-jobs-number 8)
(setq show-paren-delay 0.0)
(setq which-key-idle-delay 0.5)
(menu-bar-mode 0)
(which-key-mode t)
(recentf-mode t)
(save-place-mode t)
(tool-bar-mode 0)
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)
(global-auto-revert-mode t)
(defun kill-region-or-backward-word ()
  "If the region is active and non-empty, call `kill-region'. Otherwise, call`backward-kill-word'."
  (interactive)
  (call-interactively
   (if (use-region-p) 'kill-region 'backward-kill-word)))
(global-set-key (kbd "C-w") #'kill-region-or-backward-word)
(global-set-key (kbd "") 'scroll-up-line)
(global-set-key (kbd "") 'scroll-down-line)
(setq use-package-compute-statistics t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(setq package-archive-priorities
	  '(("gnu" . 30)
		("nongnu" . 20)
		("melpa-stable" . 10)
		("melpa" . 0)))
(package-initialize)
(use-package marginalia
  :ensure t
  :hook (vertico-mode . marginalia-mode))
(use-package lsp-mode
  :ensure t)
(use-package company
  :ensure t)
(require 'lsp-mode)
(add-hook 'rust-ts-mode-hook #'lsp-deferred)
(add-hook 'rust-mode-hook #'lsp-deferred)
(add-hook 'after-init-hook 'global-company-mode)
(setq-default tab-width 4)
(setq-default truncate-lines t)
(lsp-inlay-hints-mode)
										;(add-hook 'icomplete-minibuffer-setup-hook ;; truncate lines in icomplete lists used by fido
										;  (lambda () (setq truncate-lines t)))
(require-theme 'modus-themes) ;; load builtin theme module modus
(load-theme 'modus-vivendi) ;; from it, load vivendi theme
;; (global-display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq completion-auto-help nil) ;; disable builtin minibuffer completion
(setq major-mode-remap-alist
	  '((python-mode . python-ts-mode))) ;; just add more whenevrr i need it
(add-to-list 'auto-mode-alist '("\.rs\'" . rust-ts-mode))
(use-package consult
  :ensure t
  ;; Replace bindings. Lazily loaded by `use-package'.
  :bind (;; C-c bindings in`mode-specific-map'
		 ("C-c M-x" . consult-mode-command)
		 ("C-c h" . consult-history)
		 ("C-c k" . consult-kmacro)
		 ("C-c m" . consult-man)
		 ("C-c i" . consult-info)
		 ([remap Info-search] . consult-info)
		 ;; C-x bindings in `ctl-x-map'
		 ("C-x M-:" . consult-complex-command)
		 ;; orig. repeat-complex-command
		 ("C-x b" . consult-buffer)
		 ;; orig. switch-to-buffer
		 ("C-x 4 b" . consult-buffer-other-window)
		 ;; orig. switch-to-buffer-other-window
		 ("C-x 5 b" . consult-buffer-other-frame) ;; orig. switch-to-buffer-other-frame
		 ("C-x t b" . consult-buffer-other-tab) ;; orig. switch-to-buffer-other-tab
		 ("C-x r b" . consult-bookmark) ;; orig. bookmark-jump
		 ("C-x p b" . consult-project-buffer)
		 ;; orig. project-switch-to-buffer
		 ;; Custom M-# bindings for fast register access
		 ("M-#" . consult-register-load)
		 ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
		 ("C-M-#" . consult-register)      ;; Other custom bindings
		 ("M-y" . consult-yank-pop)                ;; orig. yank-pop      ;; M-g bindings in`goto-map'
		 ("M-g e" . consult-compile-error)
		 ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
		 ("M-g g" . consult-goto-line)             ;; orig. goto-line
		 ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
		 ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
		 ("M-g m" . consult-mark)
		 ("M-g k" . consult-global-mark)
		 ("M-g i" . consult-imenu)
		 ("M-g I" . consult-imenu-multi)
		 ;; M-s bindings in `search-map'
		 ("M-s d" . consult-find)                  ;; Alternative: consult-fd
		 ("M-s c" . consult-locate)
		 ("M-s g" . consult-grep)
		 ("M-s G" . consult-git-grep)
		 ("M-s r" . consult-ripgrep)
		 ("M-s l" . consult-line)
		 ("M-s L" . consult-line-multi)
		 ("M-s k" . consult-keep-lines)
		 ("M-s u" . consult-focus-lines)
		 ;; Isearch integration
		 ("M-s e" . consult-isearch-history)
		 :map isearch-mode-map
		 ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
		 ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
		 ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
		 ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
		 )
  ;; Enable automatic preview at point in the _Completions_ buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Tweak the register preview for `consult-register-load',   ;;`consult-register-store' and the built-in commands.  This improves the
  ;; register formatting, adds thin separator lines, register sorting and hides
  ;; the window mode line.
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
		xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-" "S-"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (keymap-set consult-narrow-map (concat consult-narrow-key " ?") #'consult-narrow-help)   )
  ;; Optionally configure a different project root function.
  ;; 1. project.el (the default)
  ;;(setq consult-project-function #'consult--default-project--function)
  ;; 2. vc.el (vc-root-dir)
										;(setq consult-project-function (lambda (_) (vc-root-dir)))
  ;; 3. locate-dominating-file
										;(setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  ;; 4. projectile.el (projectile-project-root)
  (autoload 'projectile-project-root "projectile")
										;(setq consult-project-function (lambda (_) (projectile-project-root)))
  ;; 5. Disable project support
  ;;(setq consult-project-function nil)
  )

(use-package projectile
  :ensure t
  :init
  (projectile-mode t)
  (define-key projectile-mode-map
			  (kbd "C-c p") 'projectile-command-map)   )
;; Enable Vertico.
(use-package vertico
  :ensure t
  :custom
  ;; (vertico-scroll-margin 0)
  ;; Different scroll margin
  ;; (vertico-count 20)
  ;; Show more candidates
  ;; (vertico-resize t)
  ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t)
  ;; Enable cycling for`vertico-next/previous'
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(savehist-mode t)

;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))
(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("M-." . embark-dwim)        ;; good alternative: C-;
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc. You may adjust the
  ;; Eldoc strategy, if you want to see the documentation from
  ;; multiple providers. Beware that using this can be a little
  ;; jarring since the message shown in the minibuffer can be more
  ;; than one line, causing the modeline to move up and down:

  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
			   '("\`\_Embark Collect \(Live\|Completions\)\_"
				 nil
				 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
(use-package orderless
  :ensure t
  :custom
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
(use-package auctex
  :ensure t)
