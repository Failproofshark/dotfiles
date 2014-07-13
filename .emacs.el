;;Extension paths
(add-to-list 'load-path "~/.emacs.d/src/")

;;Set the font (this will be commented out for systems without this font
(add-to-list 'default-frame-alist '(font . "Inconsolata-12"))

;;Default indent for anything (must use ctrl-q tab)
(setq-default indent-tabs-mode nil
              tab-width 4
              c-basic-offset 4
              c-default-style "k&r")

;;Easier buffer switchin
(ido-mode t)

;;Startup screen and other nonsense gui
(setq inhibit-startup-screen -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;;Set color theme
(load-theme 'wombat)

;;Change this depending on the system
(setq temporary-backup-directory "~/.emacs_backups")
(setq backup-directory-alist
      `((".*" . ,temporary-backup-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-backup-directory t)))

;;SGML hook (HTML mode is based on this)
(defun sgml-hook-customization ()
  (setq sgml-basic-offset 4))
(add-hook 'sgml-mode-hook
          (sgml-hook-customization))

;;GLSL mode
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))

;;Python mode hook
(add-hook 'python-mode-hook
          '(lambda () (eldoc-mode 1)) t)

;;SLIME
(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime-autoloads)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))
