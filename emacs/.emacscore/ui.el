;;; ui.el --- UI configuration of GNU Emacs  -*- lexical-binding: t -*-

;; yes-or-no-p to y-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Disable system beep
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; display file name in title
(setq-default frame-title-format
	      (list '((buffer-file-name " %f"
                                        (dired-directory dired-directory
                                                         (revert-buffer-function " %b" ("%b – Dir:  " default-directory)))))))

;; Current them for graphic and terminal mode
(if (display-graphic-p)
    ;; load and configure material theme
    (pcase current-theme
      ("material" (progn
                    (load "~/.emacscore/themes/material.el")
                    (load "~/.emacscore/themes/helpers/tabbar-material-style.el")
                    (load "~/.emacscore/themes/helpers/mode-line-material.el")
                    (enable-theme 'material)))
      ("solarized" (progn
                     (load "~/.emacs.d/solarized/solarized.el")
                     (load "~/.emacs.d/solarized/solarized-theme.el")
                     (load "~/.emacs.d/solarized/solarized-light-theme.el")
                     (load "~/.emacscore/themes/helpers/tabbar-solarized-light-style.el")
                     (enable-theme 'solarized-light))))
  (progn (load "~/.emacscore/themes/smyx.el")
         (enable-theme 'smyx)))

;; hide scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
; hide tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; hide menu bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; Disable scroll
(put 'scroll-left 'disabled nil)
;; do not show splash screen
(setq inhibit-splash-screen t)

;; Set up cursor type and cursor color
(blink-cursor-mode 0)
(setq-default cursor-type 'bar)

;; Set up line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format " %d ")

;; Highlight current line
(global-hl-line-mode 1)

;; highlight search
(setq search-highlight t)
(setq query-replace-highlight t)

;;
;; highlight and pair-brackets brackets
;;
(require 'paren)
(setq show-paren-style 'expression)
(show-paren-mode t)

;; auto complete
(electric-pair-mode 1)
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            (?\' . ?\')
			    (?\& . ?\&)
			    (?\| . ?\|)
                            (?\`  . ?\`)))

(cond ((file-directory-p "/usr/share/fonts/fira-code")
       (set-frame-font "Fira Code-14"))
      (t
       (set-frame-font "Monospace-14")))

;; region color
(set-face-attribute 'region nil :background "gray15")

;; Set fonts
(custom-set-faces
 '(show-paren-match ((t (:background "#116599" :foreground "white")))))

;; Navigation
(windmove-default-keybindings)

;; Hide sparators
(fringe-mode '(0 . 0))

;; auto complete mini buffer
(icomplete-mode t)

;; CUA mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

;; do not store ac-comphist.dat in ~/.emacs.d/
(when (require 'auto-complete-config nil 'noerror)
  (setq ac-comphist-file  "~/.cache/ac-comphist.dat")
  (ac-config-default))

;; Enable column number in mode-line
(setq column-number-mode t)

;; Load popup and auto-complete
(add-to-list 'load-path "~/.emacs.d/popup")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
