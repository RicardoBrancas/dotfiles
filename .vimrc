set nocompatible
filetype off

set termguicolors
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

set mouse=a

set ts=4
set shiftwidth=4

set laststatus=2

let g:airline_powerline_fonts = 1

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

colorscheme gruvbox

set background=light
let g:gruvbox_termcolors = 1
let g:gruvbox_italic=1
let g:gruvbox_contrast_light='soft'
