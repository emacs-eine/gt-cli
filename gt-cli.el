;;; gt-cli.el --- A command-line interface for gt  -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Jen-Chieh Shen

;; Author: Jen-Chieh Shen <jcs090218@gmail.com>
;; Maintainer: Jen-Chieh Shen <jcs090218@gmail.com>
;; URL: https://github.com/emacs-eine/gt-cli
;; Version: 1.0.0
;; Package-Requires: ((emacs "26.1")
;;                    (gt "3.2.1")
;;                    (commander "0.7.0")
;;                    (msgu "0.1.0"))
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A command-line interface for Google Translate
;;

;;; Code:

(require 'gt)
(require 'msgu)

(defvar gt-cli--text
  nil)

(defvar gt-cli--target-language
  "en")

(defvar gt-cli--source-language
  "auto")

;;;###autoload
(defun gt-cli ()
  "Translate text and output to standard output."
  ;; TODO: ..
  )

(provide 'gt-cli)
;;; gt-cli.el ends here
