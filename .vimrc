set nocompatible
syntax enable

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" Navigation
Plugin 'scrooloose/nerdtree.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" tmux!
Plugin 'christoomey/vim-tmux-navigator'

" Alternate between relative numbering (relativenumber) and absolute numbering (number) for the active window
Plugin 'myusuf3/numbers.vim'

" Restore folds and cursor position automatically
Plugin 'vim-scripts/restore_view.vim'

" Surround
Plugin 'tpope/vim-surround.git'

" Now we can turn our filetype functionality back on
filetype plugin indent on

set cindent

set foldcolumn=3

set guifont=Monaco:h12
let g:NERDTreeWinPos = "left"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

" NERDTree navigation
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows=0

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
nnoremap <C-c> <C-c> :noh <ENTER>

" User defined commands
com Light execute "set background=light"
com Dark execute "set background=dark"
map <C-n> :NERDTreeToggle<CR>
