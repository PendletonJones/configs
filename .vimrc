
"PLUGINS AND EXTENSIONS
"execute pathogen#infect()"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins related to exploring files
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jeetsukumaran/vim-buffergator'

"Plugins related to syntax highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'altercation/vim-colors-solarized'

" Plugins related to enhancing vim 
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
Plugin 'ggreer/the_silver_searcher' " There was an issue here also
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

let g:NERDTreeDirArrows=0
command NT NERDTree

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set t_Co=256
let g:solarized_termcolors=256
let g:gist_use_password_in_gitconfig = 1 " this is for using github login
let g:ctrlp_show_hidden = 1
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let NERDTreeShowHidden=1




"APPEARANCE AND STYLE
syntax enable
set background=dark
colorscheme solarized

set cursorline "highlight current line
set colorcolumn=80 "comma separated list of colored columns
set relativenumber


"STATUS LINE
set laststatus=2
set statusline+=%2*\ %y\   " File Type
set ruler " display current cursor position in the lower right hand corner
set number "show line numbers


set wildignore+=__pycache__/*
set wildignore+=*.cpython*



"REGULAR OPTIONS 
set nocompatible "not backwards compatible with vi
set backspace=indent,eol,start "in insert mode, backspace deletes whitespace, eol, char before
filetype plugin indent on
set clipboard=unnamed "there are a bunch of register options for this, *
set mouse=a "enable mouse in all modes





"SEARCH OPTIONS
set incsearch " starts searching after you start typing
set hlsearch " turns on search highlighting 
set ic      " set case insensitive searching; set noic will change back
set showmatch " show the matching parens





"TAB SIZE AND BEHAVIOR
set tabstop=4       " make tabs appear as 4 characters if set to 8 
set softtabstop=4   " fixed the behavior of the backspace
set expandtab       " expand tabs to spaces
set shiftwidth=4    " width of < and >  
set autoindent      " vim will try to auto indent lines for you 
" there is a nice vimcast about this but this works for now


"INVISIBLE CHARACTERS
"set list
set listchars=tab:▸\ ,eol:¬  " the tab character doesn't work 




"KEY REMAPPINGS
imap jj <Esc>
imap cx <C-o>:w<CR>

noremap cx :w<CR>
noremap tt :noh<CR>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
" ZZ in normal mode saves and quits 



