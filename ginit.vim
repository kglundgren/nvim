" ========================= vim-plug settings =========================
call plug#begin(stdpath('data') . '/plugged')

" Colorschemes
Plug 'https://github.com/morhetz/gruvbox.git' 
Plug 'arcticicestudio/nord-vim' 
"Plug 'chriskempson/base16-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion, language server etc.
Plug 'preservim/nerdtree' " Directory browser.
Plug 'kevinoid/vim-jsonc' " JSON comments.
Plug 'bfrg/vim-cpp-modern' " CPP highlighting.
Plug 'https://github.com/pangloss/vim-javascript.git' " JS highlighting.
Plug 'maxmellon/vim-jsx-pretty' " JSX and TypeScript highlighting.

call plug#end()
" =====================================================================

"filetype plugin indent on
"syntax on


" ================ KEYBINDS ================
" Comment lines with \c. Uncomment with \u.
nnoremap <leader>c <S-i>// <Esc>
nnoremap <leader>u <S-i><Del><Del><Del><Esc>

" Toggle paste mode with F2.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Go to next tab with Ctrl+Tab, go backwards with Ctrl+Shift+Tab.
map <C-Tab> gt
map <C-S-Tab> gT

" Escape to normal mode with jk.
inoremap jk <esc>
tnoremap jk <C-\><C-n>

" Copy/paste to system clipboard with \y and \p.
vnoremap <leader>y "*y
nnoremap <leader>y "*yy
nnoremap <leader>p "*p

" Copy with CTRL+Insert.
nnoremap <C-Insert> "*yy
vnoremap <C-Insert> "*y

" Save with \w and quit without saving with \q.
" Quit all without saving with \aq (all quit).
" Write and quit with \wq.
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>

" Toggle nohlsearch.
nnoremap <silent> <leader>l :set nohlsearch!<CR>

" NERDTree.
nmap <C-n> :NERDTreeToggle<CR>

"enable regular shift-insert 
inoremap <silent>  <S-Insert>  <C-R>+

"Window navigation.
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
" ================ Keybinds ================

" Tabline config.
set showtabline=2

" Statusline config.
" set statusline=%f

" Python formatprg.
" au FileType python setlocal formatprg=black\ -

" Coc extensions.
let g:coc_global_extensions = ['coc-marketplace', 'coc-tsserver', 'coc-prettier', 'coc-html', 'coc-css', 'coc-json']

" Remove ugly GUI tabline.
GuiTabline 0

" Font settings. Suppress 'bad fixed pitch metrics' for Fira Mono font.
" Guifont! Fira\ Mono:h11
Guifont! Consolas:h11

" Define :Prettier command.
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Set ginit.vim environment variable.
let $GINITVIM='~/AppData/Local/nvim/ginit.vim'

" Python config.
let g:python_host_prog = 'C:\Python27\python.exe'
let g:python3_host_prog = 'C:\Program Files\Python39\python.exe'

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

"let g:gruvbox_contrast_dark = 'medium' "options are: soft, medium, hard
"colorscheme gruvbox
"colorscheme base16-default-dark
"colorscheme deus
"colorscheme nord


" Line numbers and relative numbers.
set number relativenumber 

" Mouse support for all (=a) modes.
set mouse=a

" Hide ugly system popup menu.
GuiPopupmenu 0



""""""""""""""""
" ~COC CONFIG~ "
""""""""""""""""

"Disable CoC on startup.
let g:coc_start_at_startup=0

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ============ After CoC settings!

