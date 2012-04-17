" associate *.pdb (eg syslog-ng patterndb files) with xml filetype
au BufRead,BufNewFile *.pdb setfiletype xml
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
