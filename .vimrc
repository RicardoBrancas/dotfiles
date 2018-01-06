set nocompatible
filetype off

set termguicolors

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:gruvbox_italic=1

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
"Plugin 'morhetz/gruvbox'
Plugin 'whatyouhide/vim-gotham'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

set mouse=a

set tabstop=4
set shiftwidth=4

set laststatus=2
let g:airline_powerline_fonts = 1

let g:syntastic_check_on_open = 1

"colorscheme gruvbox
colorscheme gotham
highlight Normal guibg=#141A1B
