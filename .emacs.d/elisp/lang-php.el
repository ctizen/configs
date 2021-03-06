;;; -\*- lexical-binding: t -\*-

(use-package php-mode
 :ensure t
 ;;:mode
 ;;(“\\.php\\’” . php-mode)
 )

;;(add-to-list ‘auto-mode-alist ‘(“\\.php$” . php-mode))

(setq lsp-clients-php-server-command "phpls")

(use-package phpunit
 :ensure t)

(use-package company
 :ensure t
 :config
 (setq company-idle-delay 0.3)
 (global-company-mode 1)
 ;;(global-set-key (kbd “C-\<tab\>”) ‘company-complete)
 )

(use-package flycheck)

(use-package lsp-mode
 :config
 (setq lsp-prefer-flymake nil)
 :hook (php-mode . lsp)
 :commands lsp)

(use-package lsp-ui
 :requires lsp-mode flycheck
 :config
 (setq lsp-ui-doc-enable t
 lsp-ui-doc-use-childframe t
 lsp-ui-doc-position ‘top
 lsp-ui-doc-include-signature t
 lsp-ui-sideline-enable nil
 lsp-ui-flycheck-enable t
 lsp-ui-flycheck-list-position ‘right
 lsp-ui-flycheck-live-reporting t
 lsp-ui-peek-enable t
 lsp-ui-peek-list-width 60
 lsp-ui-peek-peek-height 25
 lsp-ui-sideline-enable nil)

(add-hook ‘lsp-mode-hook ‘lsp-ui-mode))

(use-package company-lsp
 :commands company-lsp)

(provide 'lang-php)
