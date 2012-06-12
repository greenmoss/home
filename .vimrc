syntax on
colorscheme koehler
set background=dark
set shiftwidth=3
set tabstop=3
set incsearch
set ai
set nowrap
set hlsearch
set nu
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
set ruler
" ignore case, unless we searched for capitalized characters
set smartcase
set ignorecase

augroup json_autocmd 
	autocmd! 
	autocmd FileType json set autoindent 
	autocmd FileType json set formatoptions=tcq2l 
	autocmd FileType json set textwidth=78 shiftwidth=2 
	autocmd FileType json set softtabstop=2 tabstop=8 
	autocmd FileType json set expandtab 
	" gives
	" E350: Cannot create fold with current 'foldmethod'
	"autocmd FileType json set foldmethod=syntax 
augroup END 
