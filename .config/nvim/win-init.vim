filetype on                  " required
filetype plugin on
set termguicolors
if !has('gui_running')
	  set t_Co=256
endif

set relativenumber
set number
syntax on
set hls
set tabstop=2
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set cursorline
set cursorcolumn
set showcmd
set autoread
set mouse=a
set smartcase
" set spell
set undofile
set hidden "maintain buffer change history
source $VIMRUNTIME/mswin.vim

nnoremap ,f :call GuiWindowFullScreen(1)<CR>
nnoremap ,g :call GuiWindowFullScreen(0)<CR>

inoremap <silent>  <S-Insert>  <C-R>+

" directories
set directory=~/.vim/swp//
set undodir=~/.vim/undodir//

" userdefined functions
function Stat()
  :echom "Time -> " strftime('%c')
  :echom "File ->" expand('%:p')
  :echom "Wrkd ->" getcwd()
endfunction
function TermHere() abort
	  let currdir = getcwd()
	    let bufferdir = expand('%:p:h')
	      execute 'lcd '.bufferdir
	        execute 'terminal'
		  execute 'lcd '.currdir
	  endfunction

nnoremap ,e :e D:\Users\ssahani\AppData\Local\nvim\init.vim<CR>
nnoremap ,a :cd D:\Angular\21.11_admin\Savana.nGage.Admin<CR>
nnoremap ,o :cd D:\Angular\21.10_admin\Savana.nGage.Admin<CR>

"plit t navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ,x <Esc>:split<CR>
nnoremap ,v <Esc>:vsplit<CR>

"resize splits
nnoremap <A-k> :exe "resize -1 "<CR>
nnoremap <A-j> :exe "resize +1 "<CR>
nnoremap <A-h> :exe "vertical resize -1"<CR>
nnoremap <A-l> :exe "vertical resize +1"<CR>

tnoremap <C-q> <C-\><C-n>
nnoremap <C-q> <Esc>:q<CR>
map <F2> :call Stat()<CR>
nmap <leader>wD :read !date +"\%A - \%d \%B \%y"<CR>
nmap <leader>wd :read !date +"\%r"<CR>
nmap ,t :call TermHere()<CR>
nmap ,T :terminal<CR>

call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
" call GuiWindowMaximized(1)
set background=dark
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1
" autocmd vimenter * colorscheme gruvbox
" Plug 'dylanaraps/wal.vim'
Plug 'chuling/vim-equinusocio-material'

Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'embark-theme/vim', { 'as': 'embark' }
" let g:embark_terminal_italics = 1

Plug 'joshdick/onedark.vim'

" Plug 'atelierbram/vim-colors_atelier-schemes'

Plug 'ghifarit53/tokyonight-vim'
" night strom available
let g:tokyonight_style = "night"
let g:tokyonight_enable_italic = 1
let g:tokyonight_italic_functions = 1
autocmd vimenter * colorscheme tokyonight

" Plug 'shaunsingh/moonlight.nvim'
" let g:moonlight_italic_comments = true
" let g:moonlight_italic_keywords = true
" let g:moonlight_italic_functions = true
" let g:moonlight_italic_variables = false
" autocmd vimenter * colorscheme moonlight

Plug 'arcticicestudio/nord-vim'
" autocmd vimenter * colorscheme nord

Plug 'rakr/vim-one'
let g:one_allow_italics = 1 " I love italic for comments
" autocmd vimenter * colorscheme one


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
nnoremap <leader>r :Dirvish<CR>
augroup dirvish_config
	  autocmd!
  autocmd FileType dirvish nmap <buffer> cd :cd %<CR>
  augroup END

Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

Plug 'ryanoasis/vim-devicons'

" interactions
Plug 'camspiers/lens.vim'
Plug 'camspiers/animate.vim'
Plug 'pechorin/any-jump.vim'

Plug 'chrisbra/NrrwRgn'
" <leader> ww
Plug 'wesQ3/vim-windowswap'
" absolute necessary plugs
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-fugitive'
nnoremap <leader>g :Git<CR>
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
map cm gc
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType vue,html,css,typescript,javascript,ejs,javascriptreact,typescriptreact,svelte EmmetInstall

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
nmap <leader>f :Files!<CR>
nmap <leader>F :Files<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files'
nmap <leader>m :History!<CR>
nmap <leader>M :Marks!<CR>
nmap <leader>c :Colors!<CR>
nmap <leader>b :Buffers!<CR>
nmap <leader>B :Buffers<CR>
nmap <leader>s :Rg!<CR>
nmap <leader>S :Rg<CR>
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

      let g:fzf_action = {
	            \ 'ctrl-x': function('s:build_quickfix_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-i': 'split',
            \ 'ctrl-v': 'vsplit' }
      let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
      let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" -----------------------------COC-------------------------------
"  " tagbar alternative
"  Plug 'liuchengxu/vista.vim'
"  nmap <F8> :Vista coc<CR>
"  let g:vista_executive_for = {
"        \ 'ts': 'coc',
"              \ }
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300

let g:coc_global_extensions = ['coc-tsserver',  'coc-json',  'coc-pairs', 'coc-angular', 'coc-highlight', 'coc-html', 'coc-css', 'coc-snippets', 'coc-eslint']
" let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-git', 'coc-json',  'coc-tslint', 'coc-tslint-plugin', 'coc-pairs', 'coc-angular', 'coc-highlight', 'coc-html', 'coc-css', 'coc-vetur', 'coc-cssmodules','coc-python', 'coc-snippets', 'coc-yaml', 'coc-react-refactor', 'coc-svelte', 'coc-emmet']
"Plug 'petertriho/coc-tailwind-intellisense', {'do': 'npm install'}
" Coc python tips
" install jedi  pip install jedi
" set python.interpreter :CocCommand -> python.interpreter
" prettier config
" autocmd BufWritePre,TextChanged,InsertLeave *.js Format
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" nmap <leader>p :Prettier<CR>
" vmap <leader>p  <Plug>(coc-format-selected)
nnoremap <silent> K :call CocAction('doHover')<CR>

" coc snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc diag
nmap <leader>dl :CocDiagnostics<CR>
nmap <leader>di <Plug>(coc-diagnostic-info)
nmap <leader>dn <Plug>(coc-diagnostic-next-error)
nmap <leader>dp <Plug>(coc-diagnostic-prev-error)
nmap <leader>db <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-diagnostic-prev)
nmap <leader>dd <Plug>(coc-definition)
nmap <leader>dc <Plug>(coc-declaration)
nmap <leader>dm <Plug>(coc-implementation)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" autocmd CursorHold * silent call CocActionAsync('highlight')
" nmap <F6> :call CocAction('pickColor')<CR>
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
                  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ?  "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
   let col = col('.') - 1
     return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <Tab> pumvisible() ?  "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ?  "\<C-p>" : "\<S-Tab>"
" complettion
inoremap <expr> <cr> pumvisible() ?  "\<C-y>" : "\<C-g>u\<CR>"
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
noremap <F4> :Format<CR>
nmap <leader>p :Format<CR>
vmap <leader>p  <Plug>(coc-format-selected)
nmap ,z :Fold<CR>zR;
nnoremap ,f :norm vi{\p<CR>
nnoremap ,af :norm vat\p<CR>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status` 
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" -----------------------------COC-ENDS--------------------------
call plug#end()