autocmd BufNewFile,BufRead *.json setf json
" associate *.pdb (eg syslog-ng patterndb files) with xml filetype
au BufRead,BufNewFile *.pdb setfiletype xml
