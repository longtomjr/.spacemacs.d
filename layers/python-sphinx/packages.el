;;; packages.el --- python-sphinx layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <Herman Ewert>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `python-sphinx-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `python-sphinx/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `python-sphinx/pre-init-PACKAGE' and/or
;;   `python-sphinx/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst python-sphinx-packages
  '(
      python
      python-docstring
      sphinx-doc
      ))

(defun python-sphinx/init-python-docstring()
  (use-package python-docstring
    :defer t
    :init
    (progn
      (setq python-docstring-sentence-end-double-space 'f))
    )
  )

(defun python-sphinx/init-sphinx-doc()
  (use-package sphinx-doc
    :defer t
    :init (progn
            (spacemacs/declare-prefix-for-mode 'python-mode "mi" "insert")))
  )

(defun python-sphinx/post-init-sphinx-doc()
  (add-hook 'python-mode-hook 'sphinx-doc-mode))

(defun python-sphinx/post-init-python-docstring()
  (add-hook 'python-mode-hook 'python-docstring-mode))

(defun python-sphinx/post-init-python()
  (spacemacs|use-package-add-hook python
    :post-config (spacemacs/set-leader-keys-for-major-mode 'python-mode
                   "id" 'sphinx-doc)))

;;; packages.el ends here
