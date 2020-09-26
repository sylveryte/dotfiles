"---------------------------------abbreivation-------------------------------------------------------
iabbrev cll console.log(``)
"---------------------------------user defined-------------------------------------------------------
set encoding=UTF-8
set nocompatible              " be iMproved, required
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

function ColorMeImpress()
  highlight CocErrorHighlight ctermbg=Red  guibg=#902222
  highlight CocWarningHighlight  ctermbg=Brown guibg=#7E5024
  highlight CocInfoHighlight  ctermbg=Yellow guibg=#BE8708
  highlight CocHintHighlight  ctermbg=Blue guibg=#0B7685
  echom "Colored"
endfunction

" Mappings
nnoremap <C-q> <Esc>:q<CR>
map <F2> :call Stat()<CR>
nmap <leader>wD :read !date +"\%A - \%d \%B \%y"<CR>
nmap <leader>wd :read !date +"\%r"<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ,s <Esc>:split<CR>
nnoremap ,v <Esc>:vsplit<CR>

"resize splits
nnoremap <silent> <A-Up> :exe "resize -1 "<CR>
nnoremap <silent> <A-Down> :exe "resize +1 "<CR>
nnoremap <silent> <A-Left> :exe "vertical resize -1"<CR>
nnoremap <silent> <A-Right> :exe "vertical resize +1"<CR>

" runnnig codes
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType sh map <buffer> <F9> :w<CR>:exec '!sh' shellescape(@%, 1)<CR>
autocmd FileType markdown map <buffer> <leader>r :w<CR>:exec '!glow' shellescape(@%, 1)<CR>
autocmd FileType markdown map <buffer> <leader>y :w<CR>:exec '!remarkable %'<CR>

" switching buffers
augroup VIMRC
  " this one is which you're most likely to use?
  autocmd BufLeave *.scss,*.css normal! mC
  autocmd BufLeave *.js,*.ts normal! mJ
  autocmd BufLeave *.html, normal! mH
  autocmd BufLeave *.vue, normal! mV
augroup end

"--------------------------------------PLUGINS VIm Plug----------------------------------
call plug#begin('~/.vim/plugged')

" Plug 'flazz/vim-colorschemes'

Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
set background=dark
" material theme
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'dylanaraps/wal.vim'
Plug 'chuling/vim-equinusocio-material'
Plug 'morhetz/gruvbox'
Plug 'embark-theme/vim', { 'as': 'embark' }
let g:embark_terminal_italics = 1
Plug 'dracula/vim', { 'as': 'dracula' }
let g:gruvbox_italic=1
Plug 'joshdick/onedark.vim'
Plug 'atelierbram/vim-colors_atelier-schemes'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_pop'
nnoremap <leader>a <ESC>:AirlineTheme random<CR>

" Improves syntax for various languages
Plug 'sheerun/vim-polyglot'

Plug 'camspiers/lens.vim'
Plug 'camspiers/animate.vim'

Plug 'ryanoasis/vim-devicons'

" functional plugins ---------------------------------------------------------------

" post install (yarn install | npm install)
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" language specifics
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'pechorin/any-jump.vim'

Plug 'ap/vim-css-color'
Plug 'KabbAmine/vCoolor.vim'
let g:vcoolor_map = '<F6>'

Plug 'Chiel92/vim-autoformat'
noremap <F5> :Autoformat<CR>

" tagbar alternative
Plug 'liuchengxu/vista.vim'
nmap <F8> :Vista coc<CR>
let g:vista_executive_for = {
      \ 'ts': 'coc',
      \ }

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'christoomey/vim-system-copy'

Plug 'tpope/vim-fugitive'
nnoremap <leader>g :Git<CR>
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
map cm gc
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" nerdtree alternative
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
nnoremap <leader>e :Dirvish %<CR>
nnoremap <leader>r :Dirvish<CR>
" for tree expanding instead of preview
augroup dirvish_config
  autocmd!
  " autocmd FileType dirvish
  "   \ nnoremap <silent><buffer> p ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
  autocmd FileType dirvish nmap <buffer> cd :cd %<CR>
augroup END

Plug 'junegunn/fzf'
Plug 'benwainwright/fzf-switch-project'
let g:fzfSwitchProjectWorkspaces = [ '~/projects/','~/work/*']
nmap <leader>w :FzfSwitchProject<CR>
Plug 'junegunn/fzf.vim'
nmap <leader>f :Files<CR>
nmap <leader>F :Files!<CR>
nmap <leader>m :History<CR>
nmap <leader>M :History!<CR>
nmap <leader>c :Colors<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>B :Buffers!<CR>
nmap <leader>s :Rg<CR>
nmap <leader>S :Rg!<CR>
" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
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

Plug 'aperezdc/vim-template'
let g:templates_search_height = 5
let g:templates_directory = "~/.vim/templates"
let g:username = "sylveryte"

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType vue,html,css,ts,js EmmetInstall

Plug 'valloric/MatchTagAlways'
nnoremap <leader>% :MtaJumpToOtherTag<cr>

" Plug 'angular/angular'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
" 'coc-eslint',
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-git', 'coc-json',  'coc-tslint', 'coc-tslint-plugin', 'coc-pairs', 'coc-angular', 'coc-highlight', 'coc-html', 'coc-css', 'coc-vetur', 'coc-cssmodules','coc-python', 'coc-snippets']
" Coc python tips
" install jedi  pip install jedi
" set python.interpreter :CocCommand -> python.interpreter
" prettier config
" autocmd BufWritePre,TextChanged,InsertLeave *.js Format
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>p :Prettier<CR>
vmap <leader>p  <Plug>(coc-format-selected)

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

call plug#end()

" kitty terminal specific
" Below command helps on enter, it to get rid of ;2R^[[>1;2802;0c garbage.
" It's happening on kitty with Vista.vim plugin combo.
let &t_ut=''
" autocmd VimEnter * redraw!

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
autocmd vimenter * colorscheme gruvbox
autocmd vimenter * call ColorMeImpress()
autocmd vimenter * AirlineRefresh
