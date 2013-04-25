;; load and initialize package.el
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; include MELPA
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

(tool-bar-mode -1)

; empty the initial scratch message
(setq initial-scratch-message "")

(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)

; set a decent color theme
(require 'color-theme)
(when window-system
    (color-theme-dark-laptop))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;Clojure setup
(require 'paredit)
(require 'highlight-parentheses)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook
(lambda ()
(highlight-parentheses-mode t)
(paredit-mode t)))
(setq hl-paren-colors
'("red1" "orange1" "yellow1" "green1" "cyan1"
"slateblue1" "magenta1" "purple"))

(require 'auto-complete-config)
(ac-config-default)

; make emacs interact with clipboard properly
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [delete] 'delete-char)

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

 (setq ansi-color-names-vector
       ["black" "red" "green" "yellow" "PaleBlue" "magenta" "cyan" "white"])

(if window-system (set-exec-path-from-shell-PATH))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ein:complete-on-dot t)
 '(ein:use-auto-complete t)
 '(nrepl-lein-command "lein2"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun sh ()
  (interactive)
  (ansi-term "/bin/zsh"))


(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)


;;Setting up python
;; (defvar server-buffer-clients)
;; (when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
;;   (server-start)
;;   (defun fp-kill-server-with-buffer-routine ()
;;     (and server-buffer-clients (server-done)))
;;   (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))

;;(add-hook 'python-mode-hook '(lambda () (require 'virtualenv)))

;;(setq locale-coding-system 'utf-8)
;;(set-terminal-coding-system 'utf-8-unix)
;;(set-keyboard-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)
