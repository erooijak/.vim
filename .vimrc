syntax on

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection

" Toggle paste with F2 so that pasting from external applications goes well
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Mapping ctrl-c ctrl-space to intellisense
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Ruby and Rails preferences
set term=xterm-256color"
colorscheme wombat256mod
set guifont=Monaco:h12
let g:NERDTreeWinPos = "left"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" || "<php \r %>" " displays <%%> correctly both PHP and Rails
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$commands 

" Transparent background
hi Normal          ctermfg=252 ctermbg=none
hi NonText         ctermfg=250 ctermbg=none

" Be able to focus with mouse
set mouse=a

" Display line numbers
set number

" Pathogen for easier installation to certain paths
execute pathogen#infect()

" NERDTree navigation
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows=0

" 4 spaces for tab
set expandtab
set tabstop=4
set shiftwidth=4

" Add empty line before or after cursor in normal mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>

