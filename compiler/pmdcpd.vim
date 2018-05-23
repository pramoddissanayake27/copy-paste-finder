" Vim compiler file
" Compiler:     Copy/Paste Detector of PMD
" Maintainer:   Skycolor Radialsum
" Last Change:  2018-03-05
"
" This file is used by Copy/Paste Finder plugin (see cpf.vim).
" Copy/Paste Finder is a Vim plugin for viewing copied-pasted code
" side-by-side
"
" PMD is an extensible cross-language static code analyzer.
" see https://pmd.github.io/ to download it and for more info.
"

if exists("current_compiler")
  finish
endif

let current_compiler = "pmdcpd"

let s:cpo_save = &cpo
set cpo&vim

if exists(":CompilerSet") != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" Example of cpd's output
"   || Found a 6 line (47 tokens) duplication in the following files:
"   || Starting at line 3886 of file.cpp

" FIXME: makeprg is valid only for Microsoft Windows
CompilerSet makeprg=cpd.bat\ --minimum-tokens\ 20\ --language\ cpp\ --files\ .

CompilerSet errorformat=Starting\ at\ line\ %l\ of\ %f

" NOTE: au command below works with single file/window;
"       but can cause problems with many buffers/files/windows.
" au QuickfixCmdPost make call Cpf_Init()

let &cpo = s:cpo_save
unlet s:cpo_save

