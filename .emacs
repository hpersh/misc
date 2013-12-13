(defun my-c-mode-hook ()
 (outline-minor-mode 1)
 ;; (hide-other)
 ;; Auto-wrap lines at column 80
 (set-fill-column 80)
 (auto-fill-mode 1)
 (which-func-mode 1)
 (let ((mf (buffer-modified-p)))
   (setq indent-tabs-mode nil)             ; Use spaces, not TABs
   (untabify (point-min) (point-max)) ; Convert all TABs to spaces, just in case
   (cond ((and (not mf) (buffer-modified-p)) (message "!!! N.B.  Buffer untabified")))
   (set-buffer-modified-p mf)
   )
 )
;; Options Menu Settings
;; =====================
(cond
 ((and (string-match "XEmacs" emacs-version)
          (boundp 'emacs-major-version)
          (or (and
               (= emacs-major-version 19)
               (>= emacs-minor-version 14))
              (= emacs-major-version 20))
          (fboundp 'load-options-file))
 (load-options-file "/home/howard/.xemacs-options")))
;; ============================
;; End of Options Menu Settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "ASCII")
 '(delete-old-versions nil)
 '(diff-switches "-c -b -B")
 '(dired-kept-versions 200)
 '(global-font-lock-mode t nil (font-lock))
 '(kept-new-versions 200)
 '(kept-old-versions 200)
 '(show-paren-mode t nil (paren))
 '(vc-make-backup-files t)
 '(version-control t))
(add-hook 'c-mode-hook (function my-c-mode-hook))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#AE00B200C300" :foreground "#000000000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 94 :width semi-condensed :foundry "misc" :family "fixed"))))
 '(compilation-error ((t (:background "Red1" :foreground "black" :inverse-video nil))))
 '(compilation-info ((((class color) (min-colors 16) (background light)) (:background "black" :foreground "Green3" :inverse-video t))))
 '(compilation-line-number ((t (:background "black" :foreground "Goldenrod" :inverse-video t))))
 '(cvs-need-action ((((class color) (background light)) (:background "orange" :foreground "black" :weight bold))))
 '(dired-warning ((t (:inherit font-lock-warning-face :background "red" :foreground "white"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background light)) (:background "red1" :foreground "white" :weight bold)))))
(column-number-mode 1)
(load-library "byte-run.el")
;; (load-file "/home/howard/emacs/cedet-1.0pre6/common/cedet.el")
(add-to-list 'load-path "/home/howard/emacs/cscope-15.7a/contrib/xcscope")
(require 'xcscope)
;; (add-to-list 'load-path "/home/howard/emacs/ecb-2.40")
;; (require 'ecb)
(setenv "CSCOPEVER" "OS")
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)