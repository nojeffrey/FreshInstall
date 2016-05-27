(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package jedi
	     :ensure t)


;;(add-to-list 'load-path "/home/scottie/.emacs.d/")


(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 120))

;;ORG-MODE
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; fontify code in code blocks
(setq org-src-fontify-natively t)

; Add short cut keys for the org-agenda
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)


(put 'upcase-region 'disabled nil)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


;;bro-mode
;; (setq exec-path (append exec-path '("/opt/bro/bin/bro")))
;; (setenv "PATH" (concat (getenv "PATH") "/opt/bro/bin/bro/"))
;; (setenv "BROPATH" "/opt/bro/bin/bro:/opt/bro/share/broctl/scripts:/opt/bro/share/bro/policy:/opt/bro/share/bro/site")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/bro-mode/")
;; (setq bro-event-bif "/opt/bro/share/bro/base/event.bif.bro")
;; (setq bro-tracefiles "~/tracefiles")
;; (require 'bro-mode)

;; multi-cursor mode:

(use-package jedi
	     :ensure t)

(use-package multiple-cursors
             :ensure t)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;jedi python autocomplete
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;;save location change
(setq backup-directory-alist `(("." . "~/.saves")))


;;open wiki.org on startup
(find-file "~/wiki/wiki.org")

;;disable overwrite mode
(define-key global-map [(insert)] nil)
(define-key global-map [(control insert)] 'overwrite-mode)

;; helm
;; [Facultative] Only if you have installed async.
;;(add-to-list 'load-path "/home/scottie/.emacs.d/async")

;; (add-to-list 'load-path "/home/scottie/.emacs.d/helm")
;;(require 'helm-config)
(use-package helm
             :ensure t)

(global-set-key (kbd "M-x") 'helm-M-x)
(setq org-agenda-include-diary t)
