" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

syntax enable

set cindent
set foldcolumn=3

set guifont=Monaco:h12
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Make pretty
set t_Co=256 " Set terminal color scheme to support 256 colors
colorscheme wombat256

" Highlight search results
set hls

" Be able to focus with mouse
set mouse=a

" Display line numbers
set number

" 4 spaces for tab
set expandtab
set tabstop=4
set shiftwidth=4

" Add empty line before or after cursor in normal mode
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Remap ; to : and vice versa to not have to press SHIFT to go to command mode
nnoremap : ;
nnoremap ; :

" Remap CTRL-c to include removal of search highlight
nnoremap <C-c> <C-c> :noh <ENTER>

" CTRL-I to reindent whole page
nnoremap <C-i> gg=G ``

" User defined commands
com Light execute "set background=light"
com Dark execute "set background=dark"
map <C-n> :NERDTreeToggle<CR>

" An example for a vimrc file. test :
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set nobackup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" syntax on
" set background=dark
" let g:solarized_termcolors = 16
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termtrans = 1
" 
" colorscheme solarized


"Want a different map leader than \"
let mapleader=","

set number


set complete=.,w,b,u,t,i
set tags=tags;/

" set statusline=%f%w%m%h%1*%r%2*%{VarExists('b:devpath','<Rel>')}%3*%{VarExists('b:relpath','<Dev>')}%{XLockStat()}%=%-15(%l,%c%V%)%P

" jamessan's
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

set relativenumber


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
  
"  " Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬
set ts=4 sts=4 sw=4 expandtab


set hidden


map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
" execute pathogen#infect()
:imap ii <Esc>


set runtimepath^=~/.vim/bundle/ctrlp.vim
map <leader>y :CtrlPBuffer<cr>
map <leader>p :CtrlP<cr>
map <leader>p :CtrlP<cr>

" search word under cursor in complete dir structure
map <F2> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F3> :sp<cr>
map <F4> :vs<cr>
map <F5> :CtrlP<cr>
map <F6> :CtrlPBuffer<cr>
map <F7> :bp<cr>
map <F8> :bn<cr>
map <F9> :b#<bar>bd#<CR>
map <F10> :b#<bar>bd#<CR>
map <F11> :NERDTree<cr>


nnoremap <C-x> :Eval<CR>

nnoremap <D-]> =a{

" elm stuff "
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>ep :ElmPrintTypes<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>

" space centers the screen under the cursor"
nmap <space> :

nmap n nzz
nmap N Nzz

" haskell stuff "
map <silent> <Leader>e :Errors<CR>
map <leader>s :SyntasticToggleMode<CR>

"Automatically change current directory to that of the file in the buffer

"always show the last status line"
set laststatus=2

"Opens a vertical split and switches over (\v)"
nnoremap <leader>v <C-w>v<C-w>l
"Opens a horizontal split and switches over"
nnoremap <leader>s <C-w>s<C-w>j

nmap <leader>d :cd ~/Desktop<cr>:e.<cr>


" Source the vimrc file after saving it. This way, you don't have to reload  Vim to see the changes."
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

"easier navi in windows"
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"snippets via snipMate"
:filetype plugin on


"vim surround

if exists("g:loaded_surround") || &cp || v:version < 700
  finish
endif
let g:loaded_surround = 1

" Input functions {{{1

function! s:getchar()
  let c = getchar()
  if c =~ '^\d\+$'
    let c = nr2char(c)
  endif
  return c
endfunction

function! s:inputtarget()
  let c = s:getchar()
  while c =~ '^\d\+$'
    let c .= s:getchar()
  endwhile
  if c == " "
    let c .= s:getchar()
  endif
  if c =~ "\<Esc>\|\<C-C>\|\0"
    return ""
  else
    return c
  endif
endfunction

function! s:inputreplacement()
  let c = s:getchar()
  if c == " "
    let c .= s:getchar()
  endif
  if c =~ "\<Esc>" || c =~ "\<C-C>"
    return ""
  else
    return c
  endif
endfunction

function! s:beep()
  exe "norm! \<Esc>"
  return ""
endfunction

function! s:redraw()
  redraw
  return ""
endfunction

" }}}1

" Wrapping functions {{{1

function! s:extractbefore(str)
  if a:str =~ '\r'
    return matchstr(a:str,'.*\ze\r')
  else
    return matchstr(a:str,'.*\ze\n')
  endif
endfunction

function! s:extractafter(str)
  if a:str =~ '\r'
    return matchstr(a:str,'\r\zs.*')
  else
    return matchstr(a:str,'\n\zs.*')
  endif
endfunction

function! s:fixindent(str,spc)
  let str = substitute(a:str,'\t',repeat(' ',&sw),'g')
  let spc = substitute(a:spc,'\t',repeat(' ',&sw),'g')
  let str = substitute(str,'\(\n\|\%^\).\@=','\1'.spc,'g')
  if ! &et
    let str = substitute(str,'\s\{'.&ts.'\}',"\t",'g')
  endif
  return str
endfunction

function! s:process(string)
  let i = 0
  for i in range(7)
    let repl_{i} = ''
    let m = matchstr(a:string,nr2char(i).'.\{-\}\ze'.nr2char(i))
    if m != ''
      let m = substitute(strpart(m,1),'\r.*','','')
      let repl_{i} = input(match(m,'\w\+$') >= 0 ? m.': ' : m)
    endif
  endfor
  let s = ""
  let i = 0
  while i < strlen(a:string)
    let char = strpart(a:string,i,1)
    if char2nr(char) < 8
      let next = stridx(a:string,char,i+1)
      if next == -1
        let s .= char
      else
        let insertion = repl_{char2nr(char)}
        let subs = strpart(a:string,i+1,next-i-1)
        let subs = matchstr(subs,'\r.*')
        while subs =~ '^\r.*\r'
          let sub = matchstr(subs,"^\r\\zs[^\r]*\r[^\r]*")
          let subs = strpart(subs,strlen(sub)+1)
          let r = stridx(sub,"\r")
          let insertion = substitute(insertion,strpart(sub,0,r),strpart(sub,r+1),'')
        endwhile
        let s .= insertion
        let i = next
      endif
    else
      let s .= char
    endif
    let i += 1
  endwhile
  return s
endfunction

function! s:wrap(string,char,type,removed,special)
  let keeper = a:string
  let newchar = a:char
  let s:input = ""
  let type = a:type
  let linemode = type ==# 'V' ? 1 : 0
  let before = ""
  let after  = ""
  if type ==# "V"
    let initspaces = matchstr(keeper,'\%^\s*')
  else
    let initspaces = matchstr(getline('.'),'\%^\s*')
  endif
  let pairs = "b()B{}r[]a<>"
  let extraspace = ""
  if newchar =~ '^ '
    let newchar = strpart(newchar,1)
    let extraspace = ' '
  endif
  let idx = stridx(pairs,newchar)
  if newchar == ' '
    let before = ''
    let after  = ''
  elseif exists("b:surround_".char2nr(newchar))
    let all    = s:process(b:surround_{char2nr(newchar)})
    let before = s:extractbefore(all)
    let after  =  s:extractafter(all)
  elseif exists("g:surround_".char2nr(newchar))
    let all    = s:process(g:surround_{char2nr(newchar)})
    let before = s:extractbefore(all)
    let after  =  s:extractafter(all)
  elseif newchar ==# "p"
    let before = "\n"
    let after  = "\n\n"
  elseif newchar ==# 's'
    let before = ' '
    let after  = ''
  elseif newchar ==# ':'
    let before = ':'
    let after = ''
  elseif newchar =~# "[tT\<C-T><]"
    let dounmapp = 0
    let dounmapb = 0
    if !maparg(">","c")
      let dounmapb = 1
      " Hide from AsNeeded
      exe "cn"."oremap > ><CR>"
    endif
    let default = ""
    if newchar ==# "T"
      if !exists("s:lastdel")
        let s:lastdel = ""
      endif
      let default = matchstr(s:lastdel,'<\zs.\{-\}\ze>')
    endif
    let tag = input("<",default)
    if dounmapb
      silent! cunmap >
    endif
    let s:input = tag
    if tag != ""
      let keepAttributes = ( match(tag, ">$") == -1 )
      let tag = substitute(tag,'>*$','','')
      let attributes = ""
      if keepAttributes
        let attributes = matchstr(a:removed, '<[^ \t\n]\+\zs\_.\{-\}\ze>')
      endif
      let s:input = tag . '>'
      if tag =~ '/$'
        let tag = substitute(tag, '/$', '', '')
        let before = '<'.tag.attributes.' />'
        let after = ''
      else
        let before = '<'.tag.attributes.'>'
        let after  = '</'.substitute(tag,' .*','','').'>'
      endif
      if newchar == "\<C-T>"
        if type ==# "v" || type ==# "V"
          let before .= "\n\t"
        endif
        if type ==# "v"
          let after  = "\n". after
        endif
      endif
    endif
  elseif newchar ==# 'l' || newchar == '\'
    " LaTeX
    let env = input('\begin{')
    if env != ""
      let s:input = env."\<CR>"
      let env = '{' . env
      let env .= s:closematch(env)
      echo '\begin'.env
      let before = '\begin'.env
      let after  = '\end'.matchstr(env,'[^}]*').'}'
    endif
  elseif newchar ==# 'f' || newchar ==# 'F'
    let fnc = input('function: ')
    if fnc != ""
      let s:input = fnc."\<CR>"
      let before = substitute(fnc,'($','','').'('
      let after  = ')'
      if newchar ==# 'F'
        let before .= ' '
        let after = ' ' . after
      endif
    endif
  elseif newchar ==# "\<C-F>"
    let fnc = input('function: ')
    let s:input = fnc."\<CR>"
    let before = '('.fnc.' '
    let after = ')'
  elseif idx >= 0
    let spc = (idx % 3) == 1 ? " " : ""
    let idx = idx / 3 * 3
    let before = strpart(pairs,idx+1,1) . spc
    let after  = spc . strpart(pairs,idx+2,1)
  elseif newchar == "\<C-[>" || newchar == "\<C-]>"
    let before = "{\n\t"
    let after  = "\n}"
  elseif newchar !~ '\a'
    let before = newchar
    let after  = newchar
  else
    let before = ''
    let after  = ''
  endif
  let after  = substitute(after ,'\n','\n'.initspaces,'g')
  if type ==# 'V' || (a:special && type ==# "v")
    let before = substitute(before,' \+$','','')
    let after  = substitute(after ,'^ \+','','')
    if after !~ '^\n'
      let after  = initspaces.after
    endif
    if keeper !~ '\n$' && after !~ '^\n'
      let keeper .= "\n"
    elseif keeper =~ '\n$' && after =~ '^\n'
      let after = strpart(after,1)
    endif
    if before !~ '\n\s*$'
      let before .= "\n"
      if a:special
        let before .= "\t"
      endif
    endif
  endif
  if type ==# 'V'
    let before = initspaces.before
  endif
  if before =~ '\n\s*\%$'
    if type ==# 'v'
      let keeper = initspaces.keeper
    endif
    let padding = matchstr(before,'\n\zs\s\+\%$')
    let before  = substitute(before,'\n\s\+\%$','\n','')
    let keeper = s:fixindent(keeper,padding)
  endif
  if type ==# 'V'
    let keeper = before.keeper.after
  elseif type =~ "^\<C-V>"
    " Really we should be iterating over the buffer
    let repl = substitute(before,'[\\~]','\\&','g').'\1'.substitute(after,'[\\~]','\\&','g')
    let repl = substitute(repl,'\n',' ','g')
    let keeper = substitute(keeper."\n",'\(.\{-\}\)\(\n\)',repl.'\n','g')
    let keeper = substitute(keeper,'\n\%$','','')
  else
    let keeper = before.extraspace.keeper.extraspace.after
  endif
  return keeper
endfunction

function! s:wrapreg(reg,char,removed,special)
  let orig = getreg(a:reg)
  let type = substitute(getregtype(a:reg),'\d\+$','','')
  let new = s:wrap(orig,a:char,type,a:removed,a:special)
  call setreg(a:reg,new,type)
endfunction
" }}}1

function! s:insert(...) " {{{1
  " Optional argument causes the result to appear on 3 lines, not 1
  let linemode = a:0 ? a:1 : 0
  let char = s:inputreplacement()
  while char == "\<CR>" || char == "\<C-S>"
    " TODO: use total count for additional blank lines
    let linemode += 1
    let char = s:inputreplacement()
  endwhile
  if char == ""
    return ""
  endif
  let cb_save = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let reg_save = @@
  call setreg('"',"\r",'v')
  call s:wrapreg('"',char,"",linemode)
  " If line mode is used and the surrounding consists solely of a suffix,
  " remove the initial newline.  This fits a use case of mine but is a
  " little inconsistent.  Is there anyone that would prefer the simpler
  " behavior of just inserting the newline?
  if linemode && match(getreg('"'),'^\n\s*\zs.*') == 0
    call setreg('"',matchstr(getreg('"'),'^\n\s*\zs.*'),getregtype('"'))
  endif
  " This can be used to append a placeholder to the end
  if exists("g:surround_insert_tail")
    call setreg('"',g:surround_insert_tail,"a".getregtype('"'))
  endif
  if col('.') >= col('$')
    norm! ""p
  else
    norm! ""P
  endif
  if linemode
    call s:reindent()
  endif
  norm! `]
  call search('\r','bW')
  let @@ = reg_save
  let &clipboard = cb_save
  return "\<Del>"
endfunction " }}}1

function! s:reindent() " {{{1
  if exists("b:surround_indent") ? b:surround_indent : (!exists("g:surround_indent") || g:surround_indent)
    silent norm! '[=']
  endif
endfunction " }}}1

function! s:dosurround(...) " {{{1
  let scount = v:count1
  let char = (a:0 ? a:1 : s:inputtarget())
  let spc = ""
  if char =~ '^\d\+'
    let scount = scount * matchstr(char,'^\d\+')
    let char = substitute(char,'^\d\+','','')
  endif
  if char =~ '^ '
    let char = strpart(char,1)
    let spc = 1
  endif
  if char == 'a'
    let char = '>'
  endif
  if char == 'r'
    let char = ']'
  endif
  let newchar = ""
  if a:0 > 1
    let newchar = a:2
    if newchar == "\<Esc>" || newchar == "\<C-C>" || newchar == ""
      return s:beep()
    endif
  endif
  let cb_save = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let append = ""
  let original = getreg('"')
  let otype = getregtype('"')
  call setreg('"',"")
  let strcount = (scount == 1 ? "" : scount)
  if char == '/'
    exe 'norm! '.strcount.'[/d'.strcount.']/'
  elseif char =~# '[[:punct:][:space:]]' && char !~# '[][(){}<>"''`]'
    exe 'norm! T'.char
    if getline('.')[col('.')-1] == char
      exe 'norm! l'
    endif
    exe 'norm! dt'.char
  else
    exe 'norm! d'.strcount.'i'.char
  endif
  let keeper = getreg('"')
  let okeeper = keeper " for reindent below
  if keeper == ""
    call setreg('"',original,otype)
    let &clipboard = cb_save
    return ""
  endif
  let oldline = getline('.')
  let oldlnum = line('.')
  if char ==# "p"
    call setreg('"','','V')
  elseif char ==# "s" || char ==# "w" || char ==# "W"
    " Do nothing
    call setreg('"','')
  elseif char =~ "[\"'`]"
    exe "norm! i \<Esc>d2i".char
    call setreg('"',substitute(getreg('"'),' ','',''))
  elseif char == '/'
    norm! "_x
    call setreg('"','/**/',"c")
    let keeper = substitute(substitute(keeper,'^/\*\s\=','',''),'\s\=\*$','','')
  elseif char =~# '[[:punct:][:space:]]' && char !~# '[][(){}<>]'
    exe 'norm! F'.char
    exe 'norm! df'.char
  else
    " One character backwards
    call search('\m.', 'bW')
    exe "norm! da".char
  endif
  let removed = getreg('"')
  let rem2 = substitute(removed,'\n.*','','')
  let oldhead = strpart(oldline,0,strlen(oldline)-strlen(rem2))
  let oldtail = strpart(oldline,  strlen(oldline)-strlen(rem2))
  let regtype = getregtype('"')
  if char =~# '[\[({<T]' || spc
    let keeper = substitute(keeper,'^\s\+','','')
    let keeper = substitute(keeper,'\s\+$','','')
  endif
  if col("']") == col("$") && col('.') + 1 == col('$')
    if oldhead =~# '^\s*$' && a:0 < 2
      let keeper = substitute(keeper,'\%^\n'.oldhead.'\(\s*.\{-\}\)\n\s*\%$','\1','')
    endif
    let pcmd = "p"
  else
    let pcmd = "P"
  endif
  if line('.') + 1 < oldlnum && regtype ==# "V"
    let pcmd = "p"
  endif
  call setreg('"',keeper,regtype)
  if newchar != ""
    let special = a:0 > 2 ? a:3 : 0
    call s:wrapreg('"',newchar,removed,special)
  endif
  silent exe 'norm! ""'.pcmd.'`['
  if removed =~ '\n' || okeeper =~ '\n' || getreg('"') =~ '\n'
    call s:reindent()
  endif
  if getline('.') =~ '^\s\+$' && keeper =~ '^\s*\n'
    silent norm! cc
  endif
  call setreg('"',original,otype)
  let s:lastdel = removed
  let &clipboard = cb_save
  if newchar == ""
    silent! call repeat#set("\<Plug>Dsurround".char,scount)
  else
    silent! call repeat#set("\<Plug>C".(a:0 > 2 && a:3 ? "S" : "s")."urround".char.newchar.s:input,scount)
  endif
endfunction " }}}1

function! s:changesurround(...) " {{{1
  let a = s:inputtarget()
  if a == ""
    return s:beep()
  endif
  let b = s:inputreplacement()
  if b == ""
    return s:beep()
  endif
  call s:dosurround(a,b,a:0 && a:1)
endfunction " }}}1

function! s:opfunc(type,...) " {{{1
  let char = s:inputreplacement()
  if char == ""
    return s:beep()
  endif
  let reg = '"'
  let sel_save = &selection
  let &selection = "inclusive"
  let cb_save  = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let reg_save = getreg(reg)
  let reg_type = getregtype(reg)
  let type = a:type
  if a:type == "char"
    silent exe 'norm! v`[o`]"'.reg.'y'
    let type = 'v'
  elseif a:type == "line"
    silent exe 'norm! `[V`]"'.reg.'y'
    let type = 'V'
  elseif a:type ==# "v" || a:type ==# "V" || a:type ==# "\<C-V>"
    let &selection = sel_save
    let ve = &virtualedit
    if !(a:0 && a:1)
      set virtualedit=
    endif
    silent exe 'norm! gv"'.reg.'y'
    let &virtualedit = ve
  elseif a:type =~ '^\d\+$'
    let type = 'v'
    silent exe 'norm! ^v'.a:type.'$h"'.reg.'y'
    if mode() ==# 'v'
      norm! v
      return s:beep()
    endif
  else
    let &selection = sel_save
    let &clipboard = cb_save
    return s:beep()
  endif
  let keeper = getreg(reg)
  if type ==# "v" && a:type !=# "v"
    let append = matchstr(keeper,'\_s\@<!\s*$')
    let keeper = substitute(keeper,'\_s\@<!\s*$','','')
  endif
  call setreg(reg,keeper,type)
  call s:wrapreg(reg,char,"",a:0 && a:1)
  if type ==# "v" && a:type !=# "v" && append != ""
    call setreg(reg,append,"ac")
  endif
  silent exe 'norm! gv'.(reg == '"' ? '' : '"' . reg).'p`['
  if type ==# 'V' || (getreg(reg) =~ '\n' && type ==# 'v')
    call s:reindent()
  endif
  call setreg(reg,reg_save,reg_type)
  let &selection = sel_save
  let &clipboard = cb_save
  if a:type =~ '^\d\+$'
    silent! call repeat#set("\<Plug>Y".(a:0 && a:1 ? "S" : "s")."surround".char.s:input,a:type)
  else
    silent! call repeat#set("\<Plug>SurroundRepeat".char.s:input)
  endif
endfunction

function! s:opfunc2(arg)
  call s:opfunc(a:arg,1)
endfunction " }}}1

function! s:closematch(str) " {{{1
  " Close an open (, {, [, or < on the command line.
  let tail = matchstr(a:str,'.[^\[\](){}<>]*$')
  if tail =~ '^\[.\+'
    return "]"
  elseif tail =~ '^(.\+'
    return ")"
  elseif tail =~ '^{.\+'
    return "}"
  elseif tail =~ '^<.+'
    return ">"
  else
    return ""
  endif
endfunction " }}}1

nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <Plug>Dsurround  :<C-U>call <SID>dosurround(<SID>inputtarget())<CR>
nnoremap <silent> <Plug>Csurround  :<C-U>call <SID>changesurround()<CR>
nnoremap <silent> <Plug>CSurround  :<C-U>call <SID>changesurround(1)<CR>
nnoremap <silent> <Plug>Yssurround :<C-U>call <SID>opfunc(v:count1)<CR>
nnoremap <silent> <Plug>YSsurround :<C-U>call <SID>opfunc2(v:count1)<CR>
" <C-U> discards the numerical argument but there's not much we can do with it
nnoremap <silent> <Plug>Ysurround  :<C-U>set opfunc=<SID>opfunc<CR>g@
nnoremap <silent> <Plug>YSurround  :<C-U>set opfunc=<SID>opfunc2<CR>g@
vnoremap <silent> <Plug>VSurround  :<C-U>call <SID>opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>
vnoremap <silent> <Plug>VgSurround :<C-U>call <SID>opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR>
inoremap <silent> <Plug>Isurround  <C-R>=<SID>insert()<CR>
inoremap <silent> <Plug>ISurround  <C-R>=<SID>insert(1)<CR>

if !exists("g:surround_no_mappings") || ! g:surround_no_mappings
  nmap ds  <Plug>Dsurround
  nmap cs  <Plug>Csurround
  nmap cS  <Plug>CSurround
  nmap ys  <Plug>Ysurround
  nmap yS  <Plug>YSurround
  nmap yss <Plug>Yssurround
  nmap ySs <Plug>YSsurround
  nmap ySS <Plug>YSsurround
  xmap s   <Plug>VSurround
  xmap gS  <Plug>VgSurround
  if !exists("g:surround_no_insert_mappings") || ! g:surround_no_insert_mappings
    if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i")
      imap    <C-S> <Plug>Isurround
    endif
    imap      <C-G>s <Plug>Isurround
    imap      <C-G>S <Plug>ISurround
  endif
endif

" vim:set ft=vim sw=2 sts=2 et:

" Author: Nate Peterson
" Repository: https://github.com/ntpeters/vim-better-whitespace

" Prevent loading the plugin multiple times
if exists('g:loaded_better_whitespace_plugin')
    finish
endif
let g:loaded_better_whitespace_plugin = 1


" Section: Preferences

" Initializes a given global variable to a given value, if it does not yet exist.
function! s:InitVariable(var, value)
    let g:[a:var] = get(g:, a:var, a:value)
endfunction
"
" Set the highlight color for trailing whitespaces
call s:InitVariable('better_whitespace_ctermcolor', 'red')
call s:InitVariable('better_whitespace_guicolor', '#FF0000')

" Operator for StripWhitespace (empty to disable)
call s:InitVariable('better_whitespace_operator', '<leader>s')

" Set this to enable/disable whitespace highlighting
call s:InitVariable('better_whitespace_enabled', 1)

" Set this to match space characters that appear before or in-between tabs
call s:InitVariable('show_spaces_that_precede_tabs', 0)

" Set this to disable highlighting on the current line in all modes
" WARNING: This checks for current line on cursor move, which can significantly
"          impact the performance of Vim (especially on large files)
" WARNING: Ignored if g:current_line_whitespace_disabled_soft is set.
call s:InitVariable('current_line_whitespace_disabled_hard', 0)

" Set this to disable highlighting of the current line in all modes
" This setting will not have the performance impact of the above, but
" highlighting throughout the file may be overridden by other highlight
" patterns with higher priority.
call s:InitVariable('current_line_whitespace_disabled_soft', 0)

" Set this to enable stripping whitespace on file save
call s:InitVariable('strip_whitespace_on_save', 0)

" Set this to enable stripping white lines at the end of the file when we
" strip whitespace
call s:InitVariable('strip_whitelines_at_eof', 0)

" Set this to enable user confirmation before stripping whitespace on file save
call s:InitVariable('strip_whitespace_confirm', 1)

" Set this to blacklist specific filetypes
call s:InitVariable('better_whitespace_filetypes_blacklist', ['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive'])

" Skip empty (whitespace-only) lines for highlighting
call s:InitVariable('better_whitespace_skip_empty_lines', 0)

" Skip stripping whitespace on lines that have not been modified
call s:InitVariable('strip_only_modified_lines', 0)

" Skip stripping whitespace on files that have more lines than this variable
call s:InitVariable('strip_max_file_size', 1000)

" Disable verbosity by default
call s:InitVariable('better_whitespace_verbosity', 0)

" Bypass the aliases set for diff by default
if has("win32") || has("win16")
    call s:InitVariable('diff_binary', 'diff.exe')
else
    call s:InitVariable('diff_binary', 'command diff')
endif

" Section: Whitespace matching setup

" Define custom whitespace character group to include all horizontal unicode
" whitespace characters except tab (\u0009). Vim's '\s' class only includes ASCII spaces and tabs.
let s:whitespace_chars='\u0020\u00a0\u1680\u180e\u2000-\u200b\u202f\u205f\u3000\ufeff'
let s:eol_whitespace_pattern = '[\u0009' . s:whitespace_chars . ']\+$'

if g:better_whitespace_skip_empty_lines == 1
    let s:eol_whitespace_pattern = '[^\u0009' . s:whitespace_chars . ']\@1<=' . s:eol_whitespace_pattern
endif

let s:strip_whitespace_pattern = s:eol_whitespace_pattern
let s:strip_whitelines_pattern = '\(\n\)\+\%$'
if g:show_spaces_that_precede_tabs == 1
    let s:eol_whitespace_pattern .= '\|[' . s:whitespace_chars . ']\+\ze[\u0009]'
endif

" Only init once
let s:better_whitespace_initialized = 0

" Ensure the 'ExtraWhitespace' highlight group has been defined
function! s:WhitespaceInit()
    " Check if the user has already defined highlighting for this group
    if hlexists('ExtraWhitespace') == 0 || empty(synIDattr(synIDtrans(hlID('ExtraWhitespace')), 'bg'))
        execute 'highlight ExtraWhitespace ctermbg = '.g:better_whitespace_ctermcolor. ' guibg = '.g:better_whitespace_guicolor
    endif
    let s:better_whitespace_initialized = 1
endfunction

" Diff command returning a space-separated list of ranges of new/modified lines (as first,last)
let s:diff_cmd=g:diff_binary.' -a --unchanged-group-format="" --old-group-format="" --new-group-format="%dF,%dL " --changed-group-format="%dF,%dL " '

" Section: Actual work functions

" Function to implement trim() if it does not exist
if exists('*trim')
    function! s:Trim(s)
        return trim(a:s)
    endfunction
else
    function! s:Trim(s)
        return substitute(a:s, '^\_s*\(.\{-}\)\_s*$', '\1', '')
    endfunction
endif

" Function that clears the search entries of BetterWhiteSpace by rolling back to the given index
function! s:RestoreSearchHistory(index)
    while histnr('search') > max([a:index, 0])
        call histdel('search', -1)
    endwhile
    let @/ = histget('search', -1)
endfunction

" query per-buffer setting for whitespace highlighting
function! s:ShouldHighlight()
    " Guess from the filetype if a) not locally decided, b) globally enabled, c) there is enough information
    if get(b:, 'better_whitespace_guess', 1) && g:better_whitespace_enabled == 1
        let b:better_whitespace_enabled = (empty(&buftype) || &buftype == 'acwrite') && index(g:better_whitespace_filetypes_blacklist, &ft) == -1
    endif
    return get(b:, 'better_whitespace_enabled', g:better_whitespace_enabled)
endfunction

" query per-buffer setting for whitespace stripping
function! s:ShouldStripWhitespaceOnSave()
    " Guess from local whitespace enabled-ness and global whitespace setting
    if get(b:, 'strip_whitespace_guess', 1) && exists('b:better_whitespace_enabled')
        let b:strip_whitespace_on_save = b:better_whitespace_enabled && g:strip_whitespace_on_save && &modifiable &&
                    \ (g:strip_max_file_size == 0 || g:strip_max_file_size >= line('$'))
    endif
    return get(b:, 'strip_whitespace_on_save', g:strip_whitespace_on_save)
endfunction

" Setup matching with either syntax or match
if g:current_line_whitespace_disabled_soft == 1
    " Match Whitespace on all lines
    function! s:HighlightEOLWhitespace()
        call <SID>ClearHighlighting()
        if <SID>ShouldHighlight()
            exe 'syn match ExtraWhitespace excludenl "' . s:eol_whitespace_pattern . '"'
        endif
    endfunction

    " Match Whitespace on all lines except the current one
    function! s:HighlightEOLWhitespaceExceptCurrentLine()
        call <SID>ClearHighlighting()
        if <SID>ShouldHighlight()
            exe 'syn match ExtraWhitespace excludenl "\%<' . line('.') .  'l' . s:eol_whitespace_pattern .
                                                 \ '\|\%>' . line('.') .  'l' . s:eol_whitespace_pattern . '"'
        endif
    endfunction

    " Remove Whitespace matching
    function! s:ClearHighlighting()
        syn clear ExtraWhitespace
    endfunction
else
    " Match Whitespace on all lines
    function! s:HighlightEOLWhitespace()
        call <SID>ClearHighlighting()
        if <SID>ShouldHighlight()
            let s:match_id = matchadd('ExtraWhitespace', s:eol_whitespace_pattern, 10, get(s:, 'match_id', -1))
        endif
    endfunction

    " Match Whitespace on all lines except the current one
    function! s:HighlightEOLWhitespaceExceptCurrentLine()
        call <SID>ClearHighlighting()
        if <SID>ShouldHighlight()
            let s:match_id = matchadd('ExtraWhitespace',
                        \   '\%<' . line('.') .  'l' . s:eol_whitespace_pattern .
                        \ '\|\%>' . line('.') .  'l' . s:eol_whitespace_pattern, 10, get(s:, 'match_id', -1))
        endif
    endfunction

    " Remove Whitespace matching
    function! s:ClearHighlighting()
        silent! call matchdelete(get(s:, 'match_id', -1))
    endfunction
endif

" Checks for extraneous whitespace in the file
" WARNING: moves the cursor.
function! s:DetectWhitespace(line1, line2)
    call cursor(a:line1, 1)
    let found = search(s:strip_whitespace_pattern, 'cn', a:line2)
    if g:strip_whitelines_at_eof == 1 && a:line2 >= line('$')
        let found += search(s:strip_whitelines_pattern, 'cn')
    endif
    return found
endfunction

" Removes all extraneous whitespace in the file
function! s:StripWhitespace(line1, line2)
    " Save the current search and cursor position
    let _s = histnr('search')
    let l = line('.')
    let c = col('.')

    silent execute ':' . a:line1 . ',' . a:line2 . 's/' . s:strip_whitespace_pattern . '//e'

    " Strip empty lines at EOF
    if g:strip_whitelines_at_eof == 1 && a:line2 >= line('$')
        silent execute '%s/' . s:strip_whitelines_pattern . '//e'
    endif

    " Restore the saved search and cursor position
    call <SID>RestoreSearchHistory(_s)
    call cursor(l, c)
endfunction

" Removes all extraneous whitespace in the file
function! s:StripWhitespaceCommand(line1, line2, force)
    if &readonly && a:force == 0
        echoerr "E45: 'readonly' option is set (add ! to override)"
    else
        call <SID>StripWhitespace(a:line1, a:line2)
    endif
endfunction

" Removes all extraneous whitespace in the file
function! s:StripWhitespaceOnChangedLinesCommand(line1, line2, force)
    if &readonly && a:force == 0
        echoerr "E45: 'readonly' option is set (add ! to override)"
    else
        let ranges=<SID>ChangedLines()
        for r in ranges
            if r[0] > a:line2
                break
            elseif r[1] < a:line1
                continue
            endif
            call <SID>StripWhitespace(max([a:line1, r[0]]), min([a:line2, r[1]]))
        endfor
    endif
endfunction

" Strip using motion lines
function! s:StripWhitespaceMotion(...)
    call <SID>StripWhitespace(line("'["), line("']"))
endfunction

" Get the ranges of changed lines
function! s:ChangedLines()
    if !filereadable(expand('%'))
        return [[1,line('$')]]
    elseif &modified
        redir => l:better_whitespace_changes_list
            silent! echo system(s:diff_cmd.' '.shellescape(expand('%')).' -', join(getline(1, line('$')), "\n") . "\n")
        redir END
        return map(split(s:Trim(l:better_whitespace_changes_list), ' '), 'split(v:val, ",")')
    endif
    return []
endfunction

" Strip after checking for confirmation
function! s:StripWhitespaceOnSave(force)
    let ranges = g:strip_only_modified_lines ? <SID>ChangedLines() : [[1,line('$')]]

    if g:strip_whitespace_confirm == 1 && a:force == 0
        let l = line(".")
        let c = col(".")
        let found = 0
        for r in ranges
            if <SID>DetectWhitespace(r[0], r[1])
                " found not just any whitespace, but whitespace that we are willing to strip
                let found = confirm('Whitespace found, delete it?', "&No\n&Yes", 1, 'Question') == 2
                break
            endif
        endfor
        call cursor(l, c)
        if found == 0
            return
        endif
    endif

    for r in ranges
        call <SID>StripWhitespace(r[0], r[1])
    endfor
endfunction


" Search for trailing whitespace
function! s:GotoTrailingWhitespace(search_backwards, from, to)
    " Save the current search
    let _s=@/
    let l = line('.')
    let c = col('.')

    " Move to start of range (if we are outside of it)
    if l < a:from || l > a:to
        if a:search_backwards != 0
            call cursor(a:to, 0)
            call cursor(0, col('$'))
        else
            call cursor(a:from, 1)
        endif
    endif

    " Set options (search direction, last searched line)
    let opts = 'wz'
    let until = a:to
    if a:search_backwards != 0
        let opts .= 'b'
        let until = a:from
    endif
    " Full file, allow wrapping
    if a:from == 1 && a:to == line('$')
        let until = 0
    endif

    " Go to pattern
    let found = search(s:eol_whitespace_pattern, opts, until)

    " Restore position if there is no match (in case we moved it)
    if found == 0
        call cursor(l, c)
    endif

    " Restore the saved search
    let @/=_s
endfunction


" Sets up (or removes) all auto commands in the buffer, after checking the
" per-buffer settings. Also performs an initial highlighting (or clears it).
function! <SID>SetupAutoCommands()
    augroup better_whitespace
        " Reset all auto commands in group
        autocmd!

        if <SID>ShouldHighlight()
            if s:better_whitespace_initialized == 0
                call <SID>WhitespaceInit()
            endif

            " Highlight extraneous whitespace at the end of lines, but not the current line in insert mode.
            call <SID>HighlightEOLWhitespace()
            autocmd CursorMovedI,InsertEnter * call <SID>HighlightEOLWhitespaceExceptCurrentLine()
            autocmd InsertLeave,BufReadPost * call <SID>HighlightEOLWhitespace()

            if g:current_line_whitespace_disabled_soft == 0
                " Using syntax: clear whitespace highlighting when leaving buffer
                autocmd BufWinLeave * if expand("<afile>") == expand("%") | call <SID>ClearHighlighting() | endif

                " Do not highlight whitespace on current line in insert mode
                autocmd CursorMovedI * call <SID>HighlightEOLWhitespaceExceptCurrentLine()

                " Do not highlight whitespace on current line in normal mode?
                if g:current_line_whitespace_disabled_hard == 1
                    autocmd CursorMoved * call <SID>HighlightEOLWhitespaceExceptCurrentLine()
                endif
            endif

        elseif s:better_whitespace_initialized == 1
            " Clear highlighting if it disabled, as it might have just been toggled
            call <SID>ClearHighlighting()
        endif

        " Strip whitespace on save if enabled.
        if <SID>ShouldStripWhitespaceOnSave()
            autocmd BufWritePre * call <SID>StripWhitespaceOnSave(v:cmdbang)
        endif

    augroup END
endfunction

" Check & setup auto commands upon enter & load, and again on filetype change.
autocmd FileType,WinEnter,BufWinEnter * call <SID>SetupAutoCommands()
autocmd ColorScheme * call <SID>WhitespaceInit()


" Section: Setting of per-buffer higlighting/stripping

function! s:EnableWhitespace()
    let b:better_whitespace_enabled = 1
    let b:better_whitespace_guess = 0
    call <SID>SetupAutoCommands()
endfunction

function! s:DisableWhitespace()
    let b:better_whitespace_enabled = 0
    let b:better_whitespace_guess = 0
    call <SID>SetupAutoCommands()
endfunction

function! s:ToggleWhitespace()
    let b:better_whitespace_enabled = 1 - <SID>ShouldHighlight()
    let b:better_whitespace_guess = 0
    call <SID>SetupAutoCommands()
endfunction

function! s:EnableStripWhitespaceOnSave()
    let b:strip_whitespace_on_save = 1
    let b:strip_whitespace_guess = 0
    call <SID>SetupAutoCommands()
endfunction

function! s:DisableStripWhitespaceOnSave()
    let b:strip_whitespace_on_save = 0
    let b:strip_whitespace_guess = 0
    call <SID>SetupAutoCommands()
endfunction

function! s:ToggleStripWhitespaceOnSave()
    let b:strip_whitespace_on_save = 1 - <SID>ShouldStripWhitespaceOnSave()
    let b:strip_whitespace_guess = 0
    call <SID>SetupAutoCommands()
endfunction


" Section: Public commands and mappings
" Run :StripWhitespace to remove end of line whitespace *on changed lines*
command! -bang -range=% StripWhitespaceOnChangedLines call <SID>StripWhitespaceOnChangedLinesCommand(<line1>, <line2>, <bang>0)
" Run :StripWhitespace to remove end of line whitespace
command! -bang -range=% StripWhitespace call <SID>StripWhitespaceCommand(<line1>, <line2>, <bang>0)
" Run :EnableStripWhitespaceOnSave to enable whitespace stripping on save
command! EnableStripWhitespaceOnSave call <SID>EnableStripWhitespaceOnSave()
" Run :DisableStripWhitespaceOnSave to disable whitespace stripping on save
command! DisableStripWhitespaceOnSave call <SID>DisableStripWhitespaceOnSave()
" Run :ToggleStripWhitespaceOnSave to enable/disable whitespace stripping on save
command! ToggleStripWhitespaceOnSave call <SID>ToggleStripWhitespaceOnSave()
" Run :EnableWhitespace to enable whitespace highlighting
command! EnableWhitespace call <SID>EnableWhitespace()
" Run :DisableWhitespace to disable whitespace highlighting
command! DisableWhitespace call <SID>DisableWhitespace()
" Run :ToggleWhitespace to toggle whitespace highlighting on/off
command! ToggleWhitespace call <SID>ToggleWhitespace()
" Search for trailing white space forwards
command! -range=% NextTrailingWhitespace call <SID>GotoTrailingWhitespace(0, <line1>, <line2>)
" Search for trailing white space backwards
command! -range=% PrevTrailingWhitespace call <SID>GotoTrailingWhitespace(1, <line1>, <line2>)

if !empty(g:better_whitespace_operator)
    " Ensure we only map if no identical, user-defined mapping already exists
    if (empty(mapcheck(g:better_whitespace_operator, 'x')))
        " Visual mode
        exe 'xmap <silent> '.g:better_whitespace_operator.' :StripWhitespace<CR>'
    endif

    " Ensure we only map if no identical, user-defined mapping already exists
    if (empty(mapcheck(g:better_whitespace_operator, 'n')))
        " Normal mode (+ space, with line count)
        exe 'nmap <silent> '.g:better_whitespace_operator.'<space> :<C-U>exe ".,+".v:count" StripWhitespace"<CR>'
        " Other motions
        exe 'nmap <silent> '.g:better_whitespace_operator.'        :<C-U>set opfunc=<SID>StripWhitespaceMotion<CR>g@'
    endif
endif

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
