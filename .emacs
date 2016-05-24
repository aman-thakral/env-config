(require 'package)

;; include MELPA
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))
;;  '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)
(require 'virtualenv)

(require 'ido)
(ido-mode t)

;;(let ((virtualenv-workon-starts-python nil))
(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)


;(load-file "~/bin/cedet-1.0.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;(global-srecode-minor-mode 1)            ; Enable template insertion menu


(setq default-indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)
(setq default-highlight-indentation-mode nil)

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
	(setenv "PATH" path-from-shell)
	(setq exec-path (split-string path-from-shell path-separator))))

;; Configuring Python IDE
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/.virtualenvs/")
(add-hook 'python-mode-hook (lambda ()
                              (hack-local-variables)
                              (when (boundp 'project-venv-name)
                                (venv-workon project-venv-name))))

(defun project-directory (buffer-name)
  "Returns the root directory of the project that contains the
given buffer. Any directory with a .git or .jedi file/directory
is considered to be a project root."
  (interactive)
  (let ((root-dir (file-name-directory buffer-name)))
    (while (and root-dir
                (not (file-exists-p (concat root-dir ".git")))
                (not (file-exists-p (concat root-dir ".jedi"))))
      (setq root-dir
            (if (equal root-dir "/")
                nil
              (file-name-directory (directory-file-name root-dir)))))
    root-dir))

(defun project-name (buffer-name)
  "Returns the name of the project that contains the given buffer."
  (let ((root-dir (project-directory buffer-name)))
    (if root-dir
        (file-name-nondirectory
         (directory-file-name root-dir))
      nil)))

(defun jedi-setup-venv ()
  "Activates the virtualenv of the current buffer."
  (let ((project-name (project-name buffer-file-name)))
    (when project-name (venv-workon project-name))))

(setq jedi:setup-keys t)
(require 'jedi)

(add-hook 'python-mode-hook 'jedi-setup-venv)
(add-hook 'python-mode-hook 'jedi:setup)

(when (require 'elpy nil t)
  (elpy-enable)
  (elpy-use-ipython)
  (setq elpy-rpc-backend "jedi"))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-default-minor-modes (quote (eldoc-mode flymake-mode auto-complete-mode)))
 '(elpy-rpc-python-command "python")
 '(global-linum-mode t)
 '(jedi:complete-on-dot t)
 '(jedi:environment-root "~/.virtualenvs/")
 '(python-check-command "flake8")
 '(python-indent-guess-indent-offset nil)
 '(python-shell-interpreter "ipython")
 '(python-shell-interpreter-args "")
 '(python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: ")
 '(python-shell-prompt-regexp "In \\[[0-9]+\\]: ")
 '(safe-local-variable-values (quote ((project-venv-name . "mb-main") (project-venv-name . "askwhen")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Put these at the end to visually check if all else worked
(tool-bar-mode -1)

(require 'uniquify)

; empty the initial scratch message
(setq initial-scratch-message "")
(require 'neotree)
(neotree-show)

; set a decent color theme
(require 'color-theme)
(when window-system
    (color-theme-initialize)
    (color-theme-dark-laptop))
