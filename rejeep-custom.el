;;; rejeep-custom.el --- Custom settings and colors

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(truncate-lines t)
 '(yas/prompt-functions (quote (yas/dropdown-prompt yas/ido-prompt yas/x-prompt yas/completing-prompt yas/no-prompt))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(diff-added ((t (:inherit diff-changed :foreground "green"))))
 '(diff-changed ((nil (:foreground "yellow"))))
 '(diff-removed ((t (:inherit diff-changed :foreground "red")))))
