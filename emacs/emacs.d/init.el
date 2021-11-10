
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(org-roam dash transient use-package s-buffer ctable deferred epc posframe auto-complete yasnippet yasnippet-snippets htmlize graphviz-dot-mode highlight-indent-guides counsel-projectile counsel-gtags counsel org rich-minority evil ensime ghub magit-popup whitespace))
 '(rainbow-delimiters-highlight-braces-p nil)
 '(safe-local-variable-values (quote ((bug-reference-bug-regexp . "#\\(?2:[0-9]+\\)"))))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;;font set for windows
(cnfonts-enable)
;; (set-frame-font "-ADBO-Source Code Pro-normal-normal-normal-*-13-*-*-*-m-0-fontset-startup")
;; (set-face-attribute 'default nil
;;                     :family "Fantasque Sans Mono"
;;                     :height 143
;;                     :weight 'normal
;;                     :width 'normal)
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset
;;                     (font-spec :family "Microsoft Yahei" :size 16)))
;;(set-fontset-font "fontset-default" 'han '("Microsoft Yahei"."unicode-bmp"))

;; ;; client font set
;; (setq window-system-default-frame-alist
;;     '(
;;         ;; if frame created on x display
;;         (x
;;          ;;(menu-bar-lines . nil)
;;          (tool-bar-lines . nil)
;;          ;; mouse
;;          (mouse-wheel-mode . 1)
;;          (mouse-wheel-follow-mouse . t)
;;          (mouse-avoidance-mode . 'exile)
;;          ;; face
;;          ;;(font . "文泉驿等宽微米黑 8")
;;          ;;(font . "anonymous 10"))
;;          ;;(font . "Monaco 10.5"))
;;          ;;(font . "monofur 13"))
;;          (font . "Source Code Pro 10"))
;;          ;;(font . "DejaVu Sans Mono 11"))
;;          ;;(font . "Envy Code R Italic 12"))
;;         ;; if on term
;;         ;;(nil
;;         ;;(menu-bar-lines . 0) (tool-bar-lines . 0)
;;         ;; (background-color . "black")
;;         ;; (foreground-color . "white")
;;         ;;)
;;      )
;; )



;;default directory
;;(setq default-directory "e:/")


;;(setq display-time-day-and-data nil)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-string-forms
      '(dayname " " month "/" day
        "  " 24-hours ":" minutes))
(display-time)
(setq column-number-mode t)

;;(setq default-frame-alist
;;      '((top . 0)(left . 50)(height . 34)(width . 85)))

;;(set-background-color "black")
;;(set-foreground-color "white")
;;(set-face-foreground 'region "green")
;;(set-face-background 'region "blue")


(global-set-key (kbd "C-c z") 'shell)
(global-set-key (kbd "<f10>") 'rename-buffer)
;; (when (fboundp 'winner-mode)
;;   (winner-mode)
;;   (windmove-default-keybindings))


(setq default-buffer-file-coding-system 'utf-8)
(setq current-language-environment "UTF-8")


;;缩进
;;(setq c-basic-offset 4)
(setq default-tab-width 4)
;;(setq tab-width 4)
(setq tab-stop-list())
(setq-default indent-tabs-mode nil)
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'java-mode-common-hook 'google-set-c-style)

;;以y/n代表yes/no
(fset 'yes-or-no-p' y-or-n-p)
;;配色
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'granger t)
;;(load-theme 'graham t)
;; (load-theme 'spolsky t)
;;(load-theme 'mccarthy t)
;;(load-theme 'wilson t)
;;(load-theme 'brin t)
;; (load-theme 'fogus t)
;; (load-theme 'junio t)
;; (load-theme 'hickey t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/color-theme/emacs-color-theme-solarized-master/")
;; (load-theme 'solarized-dark t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-theme/")
;; (load-theme 'zenburn t)
;; (load-theme 'molokai t)
;; (load-theme 'wombat t)
(add-to-list 'load-path "~/.emacs.d/color-theme/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-infodoc)
;; (color-theme-marquardt)

;;显示行号
;;(global-linum-mode t)

;;匹配括号
(show-paren-mode t)

;; 美化显示符号
;; (prettify-symbols-mode)
;; (global-prettify-symbols-mode 1)

;;是否备份
(setq make-backup-files nil)

;;不生成临时文件
;; (setq auto-save-default nil)

;;全屏
(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )

;; (desktop-save-mode 1)

;;auto-complete
;(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20201213.1255/dict")
(ac-config-default)

;;rainbow-delimiters
;; (require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; (add-to-list 'load-path "~/.emacs.d/android")
;; (require 'android-common)
;; (require 'android-compile)
;; (require 'android-host)

;; git设置 不使用vc-git
(delete 'Git vc-handled-backends)
(remove-hook 'find-file-hook 'vc-find-file-hook)

(add-to-list 'load-path "~/.emacs.d/magit/lisp/")
(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/magit/Documentation/"))

;; org-mode
(setq org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (dot . t)))

;; cscope
;; (require 'xcscope)
;; (add-hook 'java-mode-hook (function cscope:hook))
;; (setq cscope-do-not-update-database t)

;;shell mode 正常显示颜色
;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; whitespace
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style
      ;; '(face trailing tabs lines lines-tail empty
      '(face tab-mark trailing empty
             space-after-tab space-before-tab))
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; IME
;; (add-to-list 'load-path "~/.emacs.d/ibus-el")
;; (require 'ibus)
;; (add-hook 'after-init-hook 'ibus-mode-on)
;; (global-unset-key (kbd "C-SPC"))
;; (global-set-key (kbd "C-SPC") 'ibus-toggle)

;; LaTeX
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nill t t)
;; (setq TeX-autosave t)
;; (setq Tex-parse-self t)
;; (setq-default Tex-master nil)
;; (setq TeX-engine 'xetex)
;; (setq Tex-PDF-mode t)

;; (require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
;; (global-set-key [f5] 'projectile-find-file)
(setq projectile-completion-system 'ivy)
;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;keymap
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-c f") 'find-name-dired)
(global-set-key (kbd "C-c i") 'ibuffer)
(global-set-key (kbd "M-s f f") 'counsel-projectile-find-file)
(global-set-key (kbd "M-s f d") 'counsel-gtags-find-definition)
(global-set-key (kbd "M-s f r") 'counsel-gtags-find-reference)
(global-set-key (kbd "M-s f s") 'counsel-gtags-find-symbol)

;;powerline
;; (add-to-list 'load-path "~/.emacs.d/powerline")
;; (require 'powerline)
;; (powerline-center-evil-theme)
;;(powerline-evil-theme)
;;(setq powerline-default-separator 'nil)

;; evil
(evil-mode 1)

;; (beacon-mode 1)
;; smart-mode-line
;; (add-to-list 'load-path "~/.emacs.d/smart-mode-line")
(require 'smart-mode-line)
(setq sml/theme 'respectful)
(setq sml/no-confirm-load-theme t)
(sml/setup)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'fill)

;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; othe face
 ;; '(mode-line ((t (:background "orange red" :foreground "black" :box (:line-width -1 :style released-button)))))
 ;; '(mode-line-inactive ((t (:inherit mode-line :background "#444444" :foreground "white" :box (:line-width -1 :color "grey40") :weight light))))
 ;; '(powerline-active1 ((t (:inherit mode-line :background "yellow"))))
 ;; '(powerline-active2 ((t (:inherit mode-line :background "dodger blue"))))
 ;; '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "cornflower blue"))))
 ;; '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "medium orchid"))))
 ;; '(mode-line ((t (:background "forest green" :foreground "black" :box nil))))
 ;; '(powerline-active1 ((t (:inherit mode-line :background "dark goldenrod"))))
 ;; '(vertical-border ((t (:foreground "green4")))))


;; GTD
(load-file "~/.emacs.d/dto-org-gtd.el")

;; deft
(setq deft-extension "org")
(setq deft-directory "~/github/p-notes")
(setq deft-text-mode 'org-mode)
(setq deft-incremental-search nil)
(setq deft-auto-save-interval 0)
(setq deft-recursive t)
(defun cm/deft-parse-title (file contents)
  "Parse the given FILE and CONTENTS and determine the title.
  If `deft-use-filename-as-title' is nil, the title is taken to
  be the first non-empty line of the FILE.  Else the base name of the FILE is
  used as title."
  (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
    (if begin
	(string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
      (deft-base-filename file))))
(advice-add 'deft-parse-title :override #'cm/deft-parse-title)
(setq deft-strip-summary-regexp
	  (concat "\\("
		  "[\n\t]" ;; blank
		  "\\|^#\\+[[:alpha:]_]+:.*\n" ;; org-mode metadata
		  "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
		  "\\)"))
;; org-roam
(setq org-roam-v2-ack t)
(setq org-roam-directory (file-truename "~/github/p-notes"))
(org-roam-db-autosync-mode)

;; chines calendar
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

;; eshell
(defun eshell/clr()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
(defalias 'em 'find-file-other-window)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
