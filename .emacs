;; load and initialize package.el
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; include marmalade repos in your package archive list
(add-to-list 'package-archives '("marmalade" .
                                 "http://marmalade-repo.org/packages/"))

(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

(tool-bar-mode -1)

; empty the initial scratch message
(setq initial-scratch-message "")

; set a decent color theme
(require 'color-theme)
(when window-system
    (color-theme-dark-laptop))

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
(setq ansi-color-names-vector
  ["black" "red" "green" "yellow" "PaleBlue" "magenta" "cyan" "white"])

(if window-system (set-exec-path-from-shell-PATH))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nrepl-lein-command "lein2"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
