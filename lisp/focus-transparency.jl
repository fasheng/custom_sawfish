;;; focus-transparency.jl --- Make non-focussed windows translucent
;; -*- lisp-mode -*-

;; Copyright (C) 2002  Free Software Foundation, Inc.

;; Author: Suraj Kumar <suraj@sunson.in>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; To use this file, put (require 'focus-transparency) somewhere in your local config
;; files (like ~/.sawfishrc).

;; This module _assumes_ that you have transset-df in PATH (which,
;; unlike the original transset that comes as part of xorg, allows one
;; to pass the window id). If you don't, you can download transset-df
;; from here:

;; http://forchheimer.se/transset-df/

;; take window out of focus and make it 0.45% opaque
(defun dim-out-of-focus-hook (win focus-mode) 
  "Makes the window that went out-of-focus, dim" 
  (system 
   (concat "transset-df -i " (number->string (window-id win)) " 0.45"))
)

;; make it completely opaque when a window comes in focus
(defun undim-in-focus-hook (win focus-mode) 
  "Makes the window that went out-of-focus, dim" 
  (system 
   (concat "transset-df -i " (number->string (window-id win)) " 1"))
)


;; setup the hooks and be done!
(add-hook 'focus-in-hook undim-in-focus-hook)
(add-hook 'focus-out-hook dim-out-of-focus-hook)


(provide 'focus-transparency)
;; end of focus-transparency.jl