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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
" set cursorline
" set cursorcolumn
set showcmd
set autoread
set mouse=a
set smartcase
" set spell
set undofile
set hidden "maintain buffer change history

" directories
set directory=~/.vim/swp//
set undodir=~/.vim/undodir//

" userdefined functions
function Stat()
  :echom "Time -> " strftime('%c')
  :echom "File ->" expand('%:p')
  :echom "Wrkd ->" getcwd()
endfunction

" Mappings
nnoremap <C-q> <Esc>:q<CR>
map <F2> :call Stat()<CR>
nmap <leader>wD :read !date +"\%A - \%d \%B \%y"<CR>
nmap <leader>wd :read !date +"\%r"<CR>
nmap ,t :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
nmap ,T :terminal<CR>
" nmap <leader>v :let $VIM_DIR=expand('%:p:h')<CR>:!vifm $VIM_DIR<CR> 
nmap <space> za;
" tip zxzc to close all children folds
nmap ,z :Fold<CR>zR;

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ,x <Esc>:split<CR>
nnoremap ,v <Esc>:vsplit<CR>

"resize splits
nnoremap <silent> <A-Up> :exe "resize -1 "<CR>
nnoremap <silent> <A-Down> :exe "resize +1 "<CR>
nnoremap <silent> <A-Left> :exe "vertical resize -1"<CR>
nnoremap <silent> <A-Right> :exe "vertical resize +1"<CR>

" autocmds
autocmd FileType markdown vmap ,g :normal! 0f\|Dj<CR>


"--------------------------------------PLUGINS VIm Plug----------------------------------
call plug#begin('~/.vim/plugged')

" colors
set background=dark
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1
autocmd vimenter * colorscheme gruvbox
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_colors'
autocmd vimenter * AirlineTheme base16_colors
nnoremap <leader>a <ESC>:AirlineTheme random<CR>

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

"file systems
" nerdtree alternative
Plug 'vifm/vifm.vim'
" let loaded_vifm = 1
let g:vifm_embed_cwd = 1
let g:vifm = "/usr/bin/vifmrun"
nmap <leader>v :Vifm<CR>
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
nnoremap <leader>r :Dirvish<CR>
" for tree expanding instead of preview
augroup dirvish_config
  autocmd!
  " autocmd FileType dirvish
  "   \ nnoremap <silent><buffer> p ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
  autocmd FileType dirvish nmap <buffer> cd :cd %<CR>
augroup END

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
nmap <leader>f :Files!<CR>
nmap <leader>F :Files<CR>
nmap <leader>m :History!<CR>
nmap <leader>M :Marks!<CR>
nmap <leader>c :Colors!<CR>
nmap <leader>b :Buffers!<CR>
nmap <leader>B :Buffers<CR>
nmap <leader>s :Rg!<CR>
nmap <leader>S :Rg<CR>

" programming
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType vue,html,css,typescript,javascript,ejs,javascriptreact,typescriptreact,svelte EmmetInstall
" Improves syntax for various languages
Plug 'sheerun/vim-polyglot'
" Plug 'valloric/MatchTagAlways' requiers python
" nnoremap <leader>% :MtaJumpToOtherTag<cr>

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" -----------------------------COC-------------------------------
" tagbar alternative
Plug 'liuchengxu/vista.vim'
nmap <F8> :Vista coc<CR>
let g:vista_executive_for = {
      \ 'ts': 'coc',
      \ }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300

let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-git', 'coc-json',  'coc-pairs', 'coc-angular', 'coc-highlight', 'coc-html', 'coc-css', 'coc-vetur', 'coc-snippets', 'coc-svelte', ]
" let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-git', 'coc-json',  'coc-tslint', 'coc-tslint-plugin', 'coc-pairs', 'coc-angular', 'coc-highlight', 'coc-html', 'coc-css', 'coc-vetur', 'coc-cssmodules','coc-python', 'coc-snippets', 'coc-yaml', 'coc-react-refactor', 'coc-svelte', 'coc-emmet']
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
" Coc python tips
" install jedi  pip install jedi
" set python.interpreter :CocCommand -> python.interpreter
" prettier config
" autocmd BufWritePre,TextChanged,InsertLeave *.js Format
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>p :Prettier<CR>
vmap <leader>p  <Plug>(coc-format-selected)
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

" autocmd CursorHold * silent call CocActionAsync('highlight')
" nmap <F6> :call CocAction('pickColor')<CR>
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" complettion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
noremap <F4> :Format<CR>
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" -----------------------------COC-ENDS--------------------------

call plug#end()
