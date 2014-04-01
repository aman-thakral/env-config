(package-initialize)

;; include MELPA
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))
;;  '("marmalade" . "http://marmalade-repo.org/packages/"))

;(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

;(load-file "~/bin/cedet-1.0.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;(global-srecode-minor-mode 1)            ; Enable template insertion menu

(tool-bar-mode -1)

; empty the initial scratch message
(setq initial-scratch-message "")

(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)

(elpy-enable)
(elpy-use-ipython)

; set a decent color theme
(require 'color-theme)
(when window-system
    (color-theme-initialize)
    (color-theme-dark-laptop))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

; make emacs interact with clipboard properly
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [delete] 'delete-char)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; fix the PATH variable
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-default-minor-modes (quote (eldoc-mode flymake-mode yas-minor-mode auto-complete-mode)))
 '(elpy-rpc-python-command "~/.virtualenvs/atigeo/bin/python")
 '(python-check-command "flake8")
 '(python-indent-guess-indent-offset nil)
 '(python-shell-interpreter "~/.virtualenvs/atigeo/bin/ipython")
 '(python-shell-interpreter-args "")
 '(python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: ")
 '(python-shell-prompt-regexp "In \\[[0-9]+\\]: "))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
