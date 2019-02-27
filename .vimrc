syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'gregsexton/MatchTag'
Plugin 'alexeyignatiev/vim-dimacs'
Plugin 'wlangstroth/vim-racket'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()
filetype plugin indent on

set mouse=a

set ts=4
set shiftwidth=4
set nu rnu

" Enable folding
set foldmethod=indent
set foldlevel=99

let g:airline_powerline_fonts = 1

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:gruvbox_italic=1
let g:gruvbox_contrast_light='medium'

colorscheme gruvbox
set termguicolors

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
