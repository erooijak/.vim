set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" Get some nice colors
Plugin 'chriskempson/base16-vim'

" tmux!
Plugin 'christoomey/vim-tmux-navigator'

" Now we can turn our filetype functionality back on
filetype plugin indent on

" Make pretty
set background=dark
colorscheme base16-default

set guifont=Monaco:h12
let g:NERDTreeWinPos = "left"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

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

" NERDTree navigation
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows=0

" Remap ; to : and vice versa to not have to press SHIFT to go to command mode
nnoremap : ;
nnoremap ; :

" User defined commands
com Light execute "set background=light"
com Dark execute "set background=dark"

