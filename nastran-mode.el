;;; nastran-mode.el --- Nastran file editing major mode
;; Package-Version: 0.1

;; "Copyright" (C) 2014 Free Software Foundation, Inc.

;; Author: Damien Profeta <damien@ounim.fr>
;; $Id: textile-mode.el 6 2006-03-30 22:37:08Z juba $

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

;; This package provide a major mode to edit nastran file

;;; Code:


(setq nastran-keyword-elements '("CGAP" "CHEXA" "CMASS2" "CONM" "CONM2" "CONROD" "CPENTA" "CQUAD4" "CQUAD8" "CROD" "CTETRA" "CTRIA3" "CTRIA6" "CWELD" "GENEL" "PLOTEL" "RBAR" "RBE2" "RBE3" "CELAS2" "CELAS1" "CBAR" "CBEAM" "CBUSH>"))
(setq nastran-keyword-proprietes '("CORD1C" "CORD1R" "CORD1S" "CORD2C" "CORD2R" "CORD2S" "MAT1" "MAT2" "MAT8" "MATS1" "PBAR" "PBARL" "PBEAM" "PBUSH" "PCOMP" "PELAS" "PGAP" "PSHELL" "PSOLID" "PWELD"))
(setq nastran-keyword-spc '("AUTOSPC" "BILIN" "GRDPNT" "K" "POST" "PRTMAXIM" "UD" "VONMISES" "Z" "ALIGN" "ALL" "AUTO" "BCONP" "BFRIC" "BLSEG" "BOUTPUT" "BWIDTH" "BY" "CORNER" "ELEMID" "ENDT" "FORM" "G" "GRIDID" "K6ROT" "LGDISP" "LOG" "LOGICAL" "MAXRATIO" "NEWSEQ" "NO" "NOCOMPS" "NONE" "OFF" "OGEOM" "ON" "OUTPUT2" "OUTPUT4" "BUFFSIZE" "PATVER" "PHASE" "PLASTIC" "PLOT" "PRINT" "PROJECT" "PUNCH" "Q" "QQ" "QT" "REAL" "SNORM" "SORT1" "SORT2" "SPOT" "SYSTEM" "T" "THRU" "TQ" "TT" "UNIT" "XYPLOT" "YES" "SYM" "STATUS" "OPTEXIT" "CRIT" "THRESH" "SPARSEDR" "DFREQ"))
(setq nastran-keyword-load '("ANALYSIS" "DESSUB" "ACCEL" "ACCELERATION" "ASET1" "DAREA" "DLOAD" "FREQ" "FREQ1" "FREQ5" "RANDOM" "RLOAD2" "TABLED" "DISP" "DISPLACEMENT" "ECHO" "EIGR" "EIGRL" "ELFORCE" "FORCE" "GRAV" "LABEL" "LOAD" "MAXLINES" "METHOD" "MOMENT" "MPC" "MPCADD" "MPCFORCES" "OLOAD" "OUTPUT" "PLOAD4" "RANDPS" "REPCASE" "SET" "SPC" "SPC" "SPC1" "SPCADD" "SPCD" "SPCFORCE" "SPCFORCES" "STRESS" "SUBCASE" "SUBTITLE" "SUPORT" "TABLED1" "TABRND1" "TEMP" "TEMPD" "TITLE" "XYPRINT" "GROUNDCHECK" "SDAMPING" "RESVEC"))
(setq nastran-keyword-param  '("ALTER" "ASSIGN" "COMPILE" "COPY" "INPUTT4" "SEALL" "SUPER" "TYPE" "ADD" "BEGIN" "BULK" "CEND" "DIAG" "DMIIN" "ENDDATA" "EQUIV" "ID" "INCLUDE" "INIT" "MATGEN" "MERGE" "NASTRAN" "NLPARM" "PARAM" "PARAML" "PROJ" "PURGE" "RESTART" "SETVAL" "SOL" "TIME"))
(setq nastran-keyword-noeud '("GRID" "SPOINT"))
(setq nastran-keyword-optimisation '("DESVAR" "DVPREL1" "DVPREL2" "DVMREL1" "DVMREL2" "DRESP1" "DCONSTR"))

(setq nastran-keyword-elements-regexp (regexp-opt nastran-keyword-elements 'words))
(setq nastran-keyword-proprietes-regexp (regexp-opt nastran-keyword-proprietes 'words))
(setq nastran-keyword-spc-regexp (regexp-opt nastran-keyword-spc 'words))
(setq nastran-keyword-load-regexp (regexp-opt nastran-keyword-load 'words))
(setq nastran-keyword-param-regexp (regexp-opt nastran-keyword-param 'words))
(setq nastran-keyword-noeud-regexp (regexp-opt nastran-keyword-noeud 'words))
(setq nastran-keyword-optimisation-regexp (regexp-opt nastran-keyword-optimisation 'words))

(setq nastran-keyword-elements nil)
(setq nastran-keyword-proprietes nil)
(setq nastran-keyword-spc nil)
(setq nastran-keyword-load nil)
(setq nastran-keyword-param nil)
(setq nastran-keyword-noeud nil)
(setq nastran-keyword-optimisation nil)

(setq nastran-font-lock-keywords
      `(
        (,nastran-keyword-elements-regexp . font-lock-type-face)
        (,nastran-keyword-proprietes-regexp . font-lock-constant-face)
        (,nastran-keyword-spc-regexp . font-lock-builtin-face)
        (,nastran-keyword-load-regexp . font-lock-doc-face)
        (,nastran-keyword-param-regexp . font-lock-function-name-face)
        (,nastran-keyword-noeud-regexp . font-lock-negation-char-face)
        (,nastran-keyword-optimisation-regexp . font-lock-reference-face)))

(setq my-nastran-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; $ is a comment delimiter
    (modify-syntax-entry ?$ "< b" table)
    (modify-syntax-entry ?\n "> b" table)
    table))

;;;###autoload (add-to-list 'auto-mode-alist '("\\.blk\\'" . nastran-mode))

  (define-derived-mode nastran-mode prog-mode "Simple Nastran Mode"
  :syntax-table my-nastran-mode-syntax-table
  (setq font-lock-defaults '((nastran-font-lock-keywords)))
  (font-lock-fontify-buffer))

(provide 'nastran-mode)
;;; nastran-mode ends here
