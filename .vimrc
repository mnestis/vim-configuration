"
"   Darren Richardson - .vimrc
"   Created: 2017-03-12
"

" Enable filetype based plugins and indentation
filetype plugin indent on

" Appearance settings
syntax on
colorscheme badwolf
set background=dark

" Enable line numbers
set number

" Indentation settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

" Bracket matching
set showmatch

" Enable incremental search 
set incsearch

if &term =~ '256color'
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

