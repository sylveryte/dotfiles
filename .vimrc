"to try
"coc-cssmodules
"---------------------------------abbreivation-------------------------------------------------------
iabbrev cll console.log(``)
ab Attr Attributes
"---------------------------------user defined-------------------------------------------------------

set encoding=UTF-8
set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on
" set termguicolors
let g:palenight_terminal_italics=1

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
set t_Co=256
set undofile
set hidden "maintain buffer change history


" directories
set directory=~/.vim/swp//
set undodir=~/.vim/undodir//
runtime colorchangerc

" Mappings
nnoremap <C-q> <Esc>:q<CR>
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
nmap <leader>D :read !date +"\%A - \%d \%B \%y"<CR>
nmap <leader>d :read !date +"\%r"<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"resize splits
nnoremap <silent> <A-Up> :exe "resize -1 "<CR>
nnoremap <silent> <A-Down> :exe "resize +1 "<CR>
nnoremap <silent> <A-Left> :exe "vertical resize -1"<CR>
nnoremap <silent> <A-Right> :exe "vertical resize +1"<CR>

" runnnig codes
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType sh map <buffer> <F9> :w<CR>:exec '!sh' shellescape(@%, 1)<CR>
autocmd FileType markdown map <buffer> <leader>r :w<CR>:exec '!glow' shellescape(@%, 1)<CR>


"--------------------------------------PLUGINS VIm Plug----------------------------------
call plug#begin('~/.vim/plugged')

" Plug 'flazz/vim-colorschemes'

Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
set background=dark
" material theme
Plug 'chuling/vim-equinusocio-material'

Plug 'rafi/awesome-vim-colorschemes'

Plug 'dylanaraps/wal.vim'

Plug 'leafgarland/typescript-vim'

Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_powerline_fonts = 1
" let g:airline_theme='base16_pop'
" nnoremap <leader>a <ESC>:AirlineTheme random<CR>

Plug 'camspiers/lens.vim'
Plug 'camspiers/animate.vim'

" Plug 'ryanoasis/vim-devicons'

Plug 'yonchu/accelerated-smooth-scroll'


" functional plugins ---------------------------------------------------------------

" Plug 'jiangmiao/auto-pairs'

" post install (yarn install | npm install)
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'pechorin/any-jump.vim'

" gitlens
Plug 'APZelos/blamer.nvim'

" " Plug 'doums/coBra'

Plug 'ap/vim-css-color'
Plug 'KabbAmine/vCoolor.vim'
let g:vcoolor_map = '<F6>'
" " Plug 'maksimr/vim-jsbeautify'

" Plug 'Chiel92/vim-autoformat'
" noremap <F5> :Autoformat<CR>


Plug 'tpope/vim-surround'

Plug 'majutsushi/tagbar'
nmap <F7> :TagbarToggle<CR>
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }
Plug 'ternjs/tern_for_vim'
" tagbar specific 

" " Track the engine.
" Plug 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
" " Plug 'honza/vim-snippets'
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-q>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

Plug 'christoomey/vim-system-copy'

Plug 'tpope/vim-commentary'
map cm gc

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
nnoremap <F3> <Esc>:NERDTreeToggle<CR>

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <leader>o :Ack 

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRUFiles<CR>

" Plug 'aperezdc/vim-template'
" let g:templates_search_height = 5
" let g:templates_directory = "~/.vim/templates"
" let g:username = "sylveryte"

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType vue,html,css EmmetInstall

Plug 'valloric/MatchTagAlways'
nnoremap <leader>% :MtaJumpToOtherTag<cr>

" Plug 'angular/angular'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-git', 'coc-json', 'coc-tslint-plugin', 'coc-angular', 'coc-highlight', 'coc-html', 'coc-css', 'coc-cssmodules','coc-python']
" Coc python tips
" install jedi  pip install jedi
" set python.interpreter :CocCommand -> python.interpreter
" prettier config
" autocmd BufWritePre,TextChanged,InsertLeave *.js Format
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>p :Format<CR>
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <F6> :call CocAction('pickColor')<CR>
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

call plug#end()

"for delay purpose
" colorscheme PaperColor
" colorscheme sierra
colorscheme palenight
" colorscheme hybrid
" colorscheme molokai
" colorscheme gruvbox
" colorscheme wal
