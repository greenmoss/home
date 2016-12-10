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
