"setup: install a color scheme, using solarized light on mac
"set up Vundle, download and clone into bundles, then run an install on all
"this stuff. 
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

set number
set mouse=a

set statusline=
set statusline+=%2*\ %y\   " File Type


set ruler
set cursorline
"set cursorcolumn
set colorcolumn=100
set laststatus=2
syntax on

let g:netrw_liststyle=3

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set t_Co=256
let g:solarized_termcolors=256

syntax enable
set background=light
colorscheme solarized



