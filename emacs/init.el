;; -*- lexical-binding: t; -*-
(setq read-process-output-max (* 1024 1024)) ;; 1 MiB
(setq gc-cons-threshold (* 96 (* 1024 1024))) ;; 96 MiB
(setq package-native-compile t)
(setq native-comp-speed 3)
(setq native-comp-async-jobs-number 8)
(setq show-paren-delay 0.0)
(setq which-key-idle-delay 0.5)
(setq mouse-wheel-scroll-amount 3)
(setq scroll-margin 50)
(setq select-enable-clipboard nil)
(setq select-enable-primary nil)
(menu-bar-mode 0)
(which-key-mode t)
(recentf-mode t)
(save-place-mode t)
(tool-bar-mode 0)
(xterm-mouse-mode t)
(electric-pair-mode t)
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)
(global-auto-revert-mode t)
(defun kill-region-or-backward-word ()
  "If the region is active and non-empty, call `kill-region'. Otherwise, call`backward-kill-word'."
  (interactive)
  (call-interactively
   (if (use-region-p) 'kill-region 'backward-kill-word)))
(global-set-key (kbd "C-w") #'kill-region-or-backward-word)
;; (global-set-key (kbd "") 'scroll-up-line)
;; (global-set-key (kbd "") 'scroll-down-line)
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
(add-to-list 'default-frame-alist
             '(font . "Terminus-9"))
(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode t))
(use-package marginalia
  :ensure t
  :hook (vertico-mode . marginalia-mode))
(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'lsp))
(use-package lsp-ui
  :ensure t)
(use-package company
  :ensure t)
(require 'lsp-mode)
(add-hook 'rust-ts-mode-hook #'lsp-deferred)
(add-hook 'rust-mode-hook #'lsp-deferred)
(add-hook 'after-init-hook 'global-company-mode)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
;;(setq c-basic-offset 4)
(setq tab-stop-list nil)
(setq indent-line-function 'insert-tab)

(setq-default truncate-lines t)
(lsp-inlay-hints-mode)
(setq lsp-inlay-hint-enable t)

(require-theme 'modus-themes) ;; load builtin theme module modus
(load-theme 'modus-vivendi) ;; from it, load vivendi theme
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq completion-auto-help nil) ;; disable builtin minibuffer completion
(setq major-mode-remap-alist
      '((python-mode . python-ts-mode))) ;; just add more whenevrr i need it

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
(use-package ess
  :ensure t)
(use-package rust-mode
  :ensure t)

(keymap-set comint-mode-map "C-n" #'comint-next-input)
(keymap-set comint-mode-map "C-p" #'comint-previous-input)

(setq comint-prompt-read-only t)

(use-package kkp
  :ensure t
  :config (global-kkp-mode t))

;;; typst mode  config
(use-package typst-ts-mode
  :ensure t)
;;; typst lsp
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
               '(typst-ts-mode . "typst"))

  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection "tinymist")
    :activation-fn (lsp-activate-on "typst")
    :server-id 'tinymist)))

(setq interprogram-cut-function nil)
(setq interprogram-paste-function nil)

;;; editing styles section
;;; meow 
(use-package meow
  :config
  (defun my-meow-reverse-find (n ch)
    (interactive)
    (negative-argument (meow-find n ch)))
  
  (defun meow-setup ()
    (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
    (setq meow-use-cursor-position-hack t)
    (meow-motion-overwrite-define-key
     '("j" . meow-next)
     '("k" . meow-prev)
     '("<escape>" . ignore))
    (meow-leader-define-key
     ;; Use SPC (0-9) for digit arguments.
     '("1" . meow-digit-argument)
     '("2" . meow-digit-argument)
     '("3" . meow-digit-argument)
     '("4" . meow-digit-argument)
     '("5" . meow-digit-argument)
     '("6" . meow-digit-argument)
     '("7" . meow-digit-argument)
     '("8" . meow-digit-argument)
     '("9" . meow-digit-argument)
     '("0" . meow-digit-argument)
     '("/" . meow-keypad-describe-key)
     '("?" . meow-cheatsheet))
    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("9" . meow-expand-9)
     '("8" . meow-expand-8)
     '("7" . meow-expand-7)
     '("6" . meow-expand-6)
     '("5" . meow-expand-5)
     '("4" . meow-expand-4)
     '("3" . meow-expand-3)
     '("2" . meow-expand-2)
     '("1" . meow-expand-1)
     '("-" . negative-argument)
     '(";" . meow-reverse)
     '("," . meow-inner-of-thing)
     '("." . meow-bounds-of-thing)
     '("[" . meow-beginning-of-thing)
     '("]" . meow-end-of-thing)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("b" . meow-back-word)
     '("B" . meow-back-symbol)
     '("c" . meow-change)
     '("d" . meow-delete)
                                        ;   '("D" . meow-backward-delete)
     '("D" . meow-backspace)
     '("e" . meow-next-word)
     '("E" . meow-next-symbol)
     '("F" . my-meow-reverese-find)
     '("f" . meow-find)
     '("g" . meow-cancel-selection)
     '("G" . meow-grab)
     '("h" . meow-left)
     '("H" . meow-left-expand)
     '("i" . meow-insert)
     '("I" . meow-open-above)
     '("j" . meow-next)
     '("J" . meow-next-expand)
     '("k" . meow-prev)
     '("K" . meow-prev-expand)
     '("l" . meow-right)
     '("L" . meow-right-expand)
     '("m" . meow-join)
     '("n" . meow-search)
     '("o" . meow-block)
     '("O" . meow-to-block)
                                        ;    '("p" . meow-yank-below)
     '("p" . meow-yank)
     '("q" . meow-quit)
     '("Q" . meow-goto-line)
     '("r" . meow-replace)
     '("R" . meow-swap-grab)
     '("s" . meow-kill)
     '("t" . meow-till)
     '("u" . meow-undo)
     '("U" . meow-undo-in-selection)
     '("v" . meow-visit)
     '("w" . meow-mark-word)
     '("W" . meow-mark-symbol)
     '("x" . meow-line)
     '("X" . meow-goto-line)
     '("y" . meow-save)
     '("Y" . meow-sync-grab)
     '("z" . meow-pop-selection)
     '("'" . repeat)
     '("<escape>" . ignore)))
  (meow-setup)
                                        ;(meow-global-mode 1)
  (defun my-copy-to-system-clipboard (beg end)
    (interactive (if (use-region-p)
                     (list (region-beginning) (region-end))
                   (list nil nil)))
    (gui-set-selection 'CLIPBOARD (if (and beg end)
                                      (buffer-substring-no-properties beg end)
                                    "idk what to put here to output a error message")))
  
  (defun my-cut-to-system-clipboard (beg end)
    (interactive (if (use-region-p)
                     (list (region-beginning) (region-end))
                   (list nil nil)))
    (gui-set-selection 'CLIPBOARD (if (and beg end)
                                      (buffer-substring-no-properties beg end)
                                    "idk what to put here to output a error message"))
    (delete-region (if (and beg end)
                       (buffer-substring-no-properties beg end))))
  
  (defvar-keymap my-space-prefix
    :doc "my prefix mappings"
    "b" 'consult-buffer
    "d" 'dired
    "f" 'find-file
    "y" 'my-copy-to-system-clipboard)
  ;; (define-key meow-keypad-state-keymap (kbd "f") 'find-file)
  ;; (keymap-set meow-keypad-state-keymap "SPC" my-space-prefix)
  ;; (keymap-set meow-keypad-state-keymap "f" 'find-file)
  (keymap-set meow-normal-state-keymap "SPC" my-space-prefix)
  (defvar meow-cursor-type-default 'box)
  (defvar meow-cursor-type-normal 'box)
  (defvar meow-cursor-type-motion 'box)
  (defvar meow-cursor-type-insert '(bar . 4))
  (defvar meow-cursor-type-keypad 'hollow)
  )



(use-package systemd                    ; Major mode for files related to systemd
  :ensure t)

;; this also works for meow's cursor customization, this should just be upstreamed into emacs for gods sak
(use-package evil-terminal-cursor-changer
  :ensure t
  :config
  (unless (display-graphic-p)
    (require 'evil-terminal-cursor-changer)
    (evil-terminal-cursor-changer-activate)))

;; evil config
(use-package evil
  :ensure t
  :config
  (evil-set-leader '(normal visual) (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>f") 'find-file)
  (evil-define-key 'normal 'global (kbd "<leader>b") 'consult-buffer)
  (evil-define-operator evil-yank-to-system (beg end type)
    (interactive "<R>")
    (evil-yank beg end type ?+))
  ;; SPC-y to yank to system clipboard
  (evil-define-key 'visual 'global (kbd "<leader>y") 'evil-yank-to-system)

  (evil-define-operator evil-yank-line-to-system (beg end type)
    :motion evil-line-or-visual-line
    :move-pointn nil
    (interactive "<R>")
    (evil-yank-line beg end type ?+))
  (evil-define-key 'normal 'global (kbd "<leader>y") 'evil-yank-line-to-system)
  
  (evil-define-operator evil-paste-after-from-system (&optional count)
    :supress-operator t
    (interactive  "P")
    (evil-paste-after (or count 1) ?+))
  (evil-define-key 'normal 'global (kbd "<leader>p") 'evil-paste-after-from-system)

  (evil-define-operator evil-paste-before-from-system (&optional count)
    :supress-operator t
    (interactive  "P")
    (evil-paste-before (or count 1) ?+))
  (evil-define-key 'normal 'global (kbd "<leader>P") 'evil-paste-before-from-system)

  (evil-define-key 'insert 'global (kbd "S-<insert>") 'evil-paste-after-from-system)
  (evil-define-key nil 'global (kbd "C-<insert>") 'evil-yank-to-system)

  (evil-define-key 'insert 'global (kbd "C-n") nil)
  (evil-define-key 'insert 'global (kbd "C-p") nil)
  (evil-define-key 'insert 'global (kbd "C-k") nil)

  (setq evil-disable-insert-state-bindings t
        evil-mode-line-format nil
        evil-insert-state-cursor '(bar "White")
        evil-visual-state-cursor '(box "White")))

;;; easy minibuffer menu creator
(defun custom-popup (prompt default-index content)
  "Pop up menu
Takes args: prompt, default-index, content).
Where the content is any number of (string, function) pairs,
each representing a menu item."
  (let ((choice
         (funcall completing-read-function
                  prompt
                  content
                  nil
                  t
                  nil
                  nil
                  (nth default-index content))))
    (pcase-let ((`(,_text . ,action) (assoc choice content)))
      (funcall action))))

;;; edit style switcher
(defun disable-other-styles ()
  (evil-mode 0)
  (meow-global-mode 0))

(defun switch-edit-style-to-evil ()
  (disable-other-styles)
  (evil-mode 1))

(defun switch-edit-style-to-meow ()
  (disable-other-styles)
  (meow-global-mode 1))

(defvar edit-styles-definition
  ;; (content, prompt, default_index)
  '(("emacs" . disable-other-styles)
    ("evil" . switch-edit-style-to-evil)
    ("meow" . switch-edit-style-to-meow)))

(defun switch-edit-style ()
  (interactive)
  (custom-popup "Select edit style: " 1 edit-styles-definition))

(switch-edit-style-to-meow)

;;; Set up wl-copy and wl-paste in terminal Emacs
;; (when (and (string= (getenv "XDG_SESSION_TYPE") "wayland")
;;            (executable-find "wl-copy")
;;            (executable-find "wl-paste"))
;;   (defun my-wl-copy (text)
;;     "Copy with wl-copy if in terminal, otherwise use the original value of `interprogram-cut-function'."
;;     (if (display-graphic-p)
;;         (gui-select-text text)
;;       (let ((wl-copy-process
;;              (make-process :name "wl-copy"
;;                            :buffer nil
;;                            :command '("wl-copy")
;;                            :connection-type 'pipe)))
;;         (process-send-string wl-copy-process text)
;;         (process-send-eof wl-copy-process))))
;;   (defun my-wl-paste ()
;;     "Paste with wl-paste if in terminal, otherwise use the original value of `interprogram-paste-function'."
;;     (if (display-graphic-p)
;;         (gui-selection-value)
;;       (shell-command-to-string "wl-paste --no-newline")))
;;   (setq interprogram-cut-function #'my-wl-copy)
;;   (setq interprogram-paste-function #'my-wl-paste))

;; smartparens
(use-package smartparens
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config (sp-use-smartparens-bindings)
  ;; load default config
  (require 'smartparens-config))

