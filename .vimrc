execute pathogen#infect()

syntax on
filetype plugin indent on
colorscheme koehler
set background=dark

set shiftwidth=2
set tabstop=8
set softtabstop=0
set expandtab
set smarttab
set autoindent

set incsearch
set nowrap
set hlsearch
set number
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
set ruler
" ignore case, unless we searched for capitalized characters
set smartcase
set ignorecase
" check first/last 5 lines of file for vim modelines
set modeline modelines=5

" DetectIndent
:autocmd Filetype * :DetectIndent 

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Using a mouse in vim? I can't even
set mouse=
set ttymouse=
