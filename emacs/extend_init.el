(setq default-frame-alist
      '(
        (width . 180)
        (height . 65)
        ))

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(setq default-directory "~/")

;; 日本語にセット
(set-language-environment 'Japanese)
;; UTF8を使う
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)

;; Show row number
(require 'linum)
(global-linum-mode 1)
;; Dont show start up's message
(setq inhibit-startup-message t)
;; Dont show menu luanch by term
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
(menu-bar-mode nil)
;; Clear default scratch
(setq initial-scratch-message "")
;; *.~ Dont Create back up file
(setq make-backup-files nil)
;;; .#* Dont Create back up file
(setq auto-save-default nil)
;; Delete auto save file when save time
(setq delete-auto-save-files t)
;; Dont split when open the file
(setq split-height-threshold nil)

;; Use space char 
(setq-default tab-width 8 indent-tabs-mode nil)

;; Clear menu bar
(menu-bar-mode -1)
;; Clear tool bar
(tool-bar-mode -1)
;; Show row numbers
(column-number-mode t)
;; Set scroll unit one
(setq scroll-conservatively 1)
;; Clear default scroll bar
(scroll-bar-mode -1)
;; Show full path in title bar
(setq frame-title-format "%f")
;; Auto reg
(electric-pair-mode 1)
;; Exchange ¥ to \
(define-key global-map [?¥] [?\\])
;; Show p
(show-paren-mode t)
;; Use Mac OS clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; Delete  
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "<left>")  'windmove-left)
(global-set-key (kbd "<down>")  'windmove-down)
(global-set-key (kbd "<up>")    'windmove-up)
(global-set-key (kbd "<right>") 'windmove-right)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode swift-mode gnuplot-mode doxy-graph-mode markdown-mode nyan-mode tabbar modus-themes company-anaconda company-arduino company-box company use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(imenu-list-entry-face-1 ((t (:foreground "white")))))

(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 3) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq completion-ignore-case t)
(defvar company-dabbrev-downcase nil)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next) ;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
(define-key company-active-map (kbd "C-i") 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定

(require 'modus-themes)                                ;; 1
(setq modus-themes-italic-constructs t                 ;; 2
      modus-themes-bold-constructs nil                 ;; 3
      modus-themes-region '(bg-only no-extend))        ;; 4
(modus-themes-load-themes)                             ;; 5
(modus-themes-load-vivendi)                           ;; 6
(global-set-key (kbd "<f5>") 'modus-themes-toggle)     ;; 7


;; (setq modus-themes-slanted-constructs t
;;       modus-themes-bold-constructs t
;;       modus-themes-no-mixed-fonts t
;;       modus-themes-subtle-line-numbers t
;;       modus-themes-mode-line '(moody borderless)
;;       modus-themes-syntax 'faint
;;       modus-themes-paren-match 'intense-bold
;;       modus-themes-region 'bg-only
;;       modus-themes-diffs 'deuteranopia
;;       modus-themes-org-blocks 'gray-background
;;       modus-themes-variable-pitch-ui t
;;       modus-themes-variable-pitch-headings t
;;       modus-themes-scale-headings t
;;       modus-themes-scale-1 1.1
;;       modus-themes-scale-2 1.15
;;       modus-themes-scale-3 1.21
;;       modus-themes-scale-4 1.27
;;       modus-themes-scale-title 1.33)

(require 'tabbar)
(tabbar-mode)

(tabbar-mwheel-mode nil)                  ;; マウスホイール無効
(setq tabbar-buffer-groups-function nil)  ;; グループ無効
(setq tabbar-use-images nil)              ;; 画像を使わない
(setq tabbar-separator '(2.0))            ;; たぶの長さ

(global-set-key (kbd "s-{") 'tabbar-backward-tab)
(global-set-key (kbd "s-}") 'tabbar-forward-tab)

(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                     ((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
                     ((equal "*term*" (buffer-name b)) b) ; *scratch*バッファは表示する
                     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
