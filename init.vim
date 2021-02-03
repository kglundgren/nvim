" Python config.
let g:python_host_prog = 'C:\Python27\python.exe'
let g:python3_host_prog = 'C:\Program Files\Python39\python.exe'

" ===== vim-plug settings =====
call plug#begin(stdpath('data') . '/plugged')
Plug 'https://github.com/morhetz/gruvbox.git'
call plug#end()

" Correct terminal colors. 
set termguicolors
colo gruvbox
