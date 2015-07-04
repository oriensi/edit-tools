
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(menu-bar-mode nil)
 '(package-selected-packages (quote (whitespace dash)))
 '(rainbow-delimiters-highlight-braces-p nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;;(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;;'(mode-line ((t (:foreground "black" :background "#bb55ff" :box nil)))))
;;'(default ((t (:family "Bitstream Charter" :foundry "bitstream" :slant italic :weight normal :height 120 :width normal)))))

;;font
;;(set-default-font "Monaco-10")
;;(set-default-font "monofur-12")
;;(set-default-font "Bitstream Charter-12")
;;(set-fontset-font "fontset-default" 'han '("Microsoft Yahei"."unicode-bmp"))
;; client font set
(setq window-system-default-frame-alist
    '(
        ;; if frame created on x display
        (x
         ;;(menu-bar-lines . nil)
         (tool-bar-lines . nil)
         ;; mouse
         (mouse-wheel-mode . 1)
         (mouse-wheel-follow-mouse . t)
         (mouse-avoidance-mode . 'exile)
         ;; face
         ;;(font . "文泉驿等宽微米黑 8")
         ;;(font . "anonymous 10"))
         ;;(font . "Monaco 10.5"))
         ;;(font . "monofur 13"))
         (font . "Source Code Pro 10"))
         ;;(font . "DejaVu Sans Mono 11"))
         ;;(font . "Envy Code R 12"))
        ;; if on term
        ;;(nil
        ;;(menu-bar-lines . 0) (tool-bar-lines . 0)
        ;; (background-color . "black")
        ;; (foreground-color . "white")
        ;;)
     )
)



;;default directory
;;(setq default-directory "e:/")


;;(setq display-time-day-and-data nil)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-string-forms
      '(dayname " " month "/" day
        "  " 24-hours ":" minutes))
(display-time)

;;(setq default-frame-alist
;;      '((top . 0)(left . 50)(height . 34)(width . 85)))

;;(set-background-color "black")
;;(set-foreground-color "white")
;;(set-face-foreground 'region "green")
;;(set-face-background 'region "blue")

(setq default-buffer-file-coding-system 'utf-8)
(setq current-language-environment "UTF-8")


;;缩进
;;(setq c-basic-offset 4)
(setq default-tab-width 4)
;;(setq tab-width 4)
(setq tab-stop-list())
(setq-default indent-tabs-mode nil)


;;以y/n代表yes/no
(fset 'yes-or-no-p' y-or-n-p)
;;配色
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'granger t)
;;(load-theme 'graham t)
;;(load-theme 'spolsky t)
;;(load-theme 'mccarthy t)
;;(load-theme 'wilson t)
;;(load-theme 'brin t)
;;(load-theme 'fogus t)
;;(load-theme 'junio t)
;;(load-theme 'hickey t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/color-theme/")
;;(load-theme 'zenburn t)
(load-theme 'molokai t)
;;(load-theme 'wombat t)
;; (add-to-list 'load-path "~/.emacs.d/color-theme/color-theme-6.6.0/")
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-charcoal-black)

;;显示行号
;;(global-linum-mode t)

;;匹配括号
(show-paren-mode t)

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

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

;;rainbow-delimiters
;; (require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-to-list 'load-path "~/.emacs.d/android")
(require 'android-common)
(require 'android-compile)
(require 'android-host)

;;powerline
(add-to-list 'load-path "~/.emacs.d/powerline")
(require 'powerline)
;;(powerline-center-theme)
(powerline-default-theme)

;;不使用vc-git
(delete 'Git vc-handled-backends)
(remove-hook 'find-file-hook 'vc-find-file-hook)

(add-to-list 'load-path "~/.emacs.d/magit/lisp")
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list "~/.emacs.d/magit/lisp/")))
(defvar magit-emacsclient-executable nil)
(require 'magit)

;; org-mode
(setq org-src-fontify-natively t)

;; cscope
(require 'xcscope)
(add-hook 'java-mode-hook (function cscope:hook))
(setq cscope-do-not-update-database t)

;;keymap
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-c f") 'find-name-dired)
(global-set-key (kbd "C-c i") 'ibuffer)

;;shell mode 正常显示颜色
;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; whitespace
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style
      ;; '(face trailing tabs lines lines-tail empty
      '(face tab-mark trailing empty
             space-after-tab space-before-tab))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

(custom-set-faces
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

 '(mode-line ((t (:background "forest green" :foreground "black" :box nil))))
 '(powerline-active1 ((t (:inherit mode-line :background "dark goldenrod"))))
 '(vertical-border ((t (:foreground "green4")))))
