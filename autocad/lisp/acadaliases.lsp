;testing for git again.
;Command Aliases

;Command aliases already in CAD.
;(defun c:f() (command "fillet"))
;(defun c:e() (command "erase"))
;(defun c:tr() (command "trim"))
;(defun c:x() (command "explode"))
;(defun c:ex() (command "extend"))

;File management
(defun c:ss() (command "qsave"))

;Layer management
(defun c:11() (command "layiso"))
(defun c:12() (command "layuniso"))
(defun c:21() (command "layoff"))
(defun c:22() (command "layon")) 
(defun c:31() (command "layfrz"))
(defun c:32() (command "laythw"))
(defun c:44() (command "laycur"))

;Sketching
(defun c:d1() (command "pline"))
(defun c:d2() (command "fillet"))
(defun c:d3() (command "extend"))

;Edit polylines/lines.
(defun c:e1() (command "pedit"))
(defun c:e2() (command "matchprop"))

;Move polylines/lines.
(defun c:s1() (command "move"))
(defun c:s2() (command "rotate"))
(defun c:s3() (command "align"))

;Remove/cut lines.
(defun c:f1() (command "break"))

;Replicate lines.
(defun c:a1() (command "copy"))
(defun c:a2() (command "offset"))
(defun c:a3() (command "array"))
(defun c:a4() (command "mirror"))

;Sheet editor.
(defun c:w1() (command "ucs"))
