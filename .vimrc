execute pathogen#infect()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'


call vundle#end()
filetype plugin indent on
set clipboard=unnamed
set number
set mouse=a
set tabstop=4
set expandtab
set statusline=
set statusline+=%2*\ %y\   " File Type

set shiftwidth=4 
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
imap jj <Esc>

syntax enable
set background=light
colorscheme solarized


let g:NERDTreeDirArrows=0
command NT NERDTree


