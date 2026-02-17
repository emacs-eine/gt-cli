;;; gt-cli.el --- A command-line interface for gt  -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Jen-Chieh Shen

;; Author: Jen-Chieh Shen <jcs090218@gmail.com>
;; Maintainer: Jen-Chieh Shen <jcs090218@gmail.com>
;; URL: https://github.com/emacs-eine/gt-cli
;; Version: 1.0.0
;; Package-Requires: ((emacs "28.1")
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

(defgroup gt-cli nil
  "A command-line interface for gt."
  :prefix "gt-cli-"
  :group 'tool
  :link '(url-link :tag "Repository" "https://github.com/emacs-eine/gt-cli"))

(defcustom gt-cli-source-language "auto"
  "The default source language you wish to translate from."
  :type 'string
  :group 'gt-cli)

(defcustom gt-cli-target-language "ko"
  "The default target language you wish to translate to."
  :type 'string
  :group 'gt-cli)

;; internal use
(defvar gt-cli--text nil)

;;;###autoload
(defun gt-cli (src-lang target-lang text)
  "Translate text and output to standard output."
  (when (string-empty-p text)
    (error "Translation text cannot be an empty string" text))
  (let ((old-kill-ring kill-ring)
        (gt-langs (or gt-langs
                      (list src-lang target-lang)))
        (gt-default-translator (or gt-default-translator
                                   (gt-translator :engines (gt-google-engine)
                                                  :render  (gt-kill-ring-render)))))
    (msgu-silent
      (with-temp-buffer
        (insert text)
        (mark-whole-buffer)
        (call-interactively #'gt-translate))
      ;; Pause until result came in.
      (while (equal old-kill-ring kill-ring)
        (sit-for 0.2)))
    (princ (car kill-ring))))

(provide 'gt-cli)
;;; gt-cli.el ends here
