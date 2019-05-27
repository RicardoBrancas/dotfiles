set termguicolors
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'gregsexton/MatchTag'
Plugin 'alexeyignatiev/vim-dimacs'
Plugin 'https://manu@framagit.org/manu/coq-au-vim.git'
Plugin 'jvoorhis/coq.vim'
Plugin 'rainglow/vim'

call vundle#end()
filetype plugin indent on

set mouse=a

set ts=4
set shiftwidth=4
set nu rnu
set foldcolumn=1

" Enable folding
set foldmethod=indent
set foldlevel=99

let g:airline_powerline_fonts = 1
set noshowmode

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set background=light
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='soft'

colorscheme gruvbox

if &background ==# 'light'
  hi gCoqSent    guibg=red ctermbg=red
  hi gCoqAdded   guibg=yellow ctermbg=yellow
  hi gCoqChecked guibg=green ctermbg=green
else
  hi gCoqSent    guibg=#661100 ctermbg=darkred
  hi gCoqAdded   guibg=#664400 ctermbg=brown
  hi gCoqChecked guibg=#113300 ctermbg=darkgreen
endif

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
