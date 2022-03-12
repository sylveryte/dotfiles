" Basic settings
set relativenumber
set number
syntax on
autocmd vimenter * syntax on
set hls
set tabstop=4
set shiftwidth=2
set softtabstop=4
set expandtab
set smarttab
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
set list
set listchars=eol:·,tab:⍿·,trail:×
" set listchars=eol:¬,tab:▸\

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

" Mappings
" terminal escape
tnoremap <C-q> <C-\><C-n>
nnoremap <C-q> <Esc>:q<CR>
map <F2> :call Stat()<CR>
nmap <leader>wD :read !date +"\%A - \%d \%B \%y"<CR>
nmap <leader>wd :read !date +"\%r"<CR>
nnoremap <silent>,T :FloatermNew<CR>
tnoremap <silent>,T <C-\><C-n>:FloatermNew<CR>
nnoremap <silent>,tt :FloatermNew --cwd=<buffer><CR>
tnoremap <silent>,tt <C-\><C-n>:FloatermNew<CR>
nnoremap <silent>,tp :FloatermPrev<CR>
tnoremap <silent>,tp <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent>,tn :FloatermNext<CR>
tnoremap <silent>,tn <C-\><C-n>:FloatermNext<CR>
nnoremap <silent>,t :FloatermToggle<CR>
tnoremap <silent>,t <C-\><C-n>:FloatermToggle<CR>
nmap <space> za;
" tip zxzc to close all children folds
nmap ,z :Fold<CR>zR;
nnoremap ,f :norm vi{\p<CR>
nnoremap ,af :norm vat\p<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ,x <Esc>:split<CR>
nnoremap ,v <Esc>:vsplit<CR>

"tab navigations
nnoremap ,n <Esc>:tabnext<CR>
nnoremap ,N <Esc>:tabnew<CR>

"resize splits
nnoremap <A-k> :exe "resize -1 "<CR>
nnoremap <A-j> :exe "resize +1 "<CR>
nnoremap <A-h> :exe "vertical resize -1"<CR>
nnoremap <A-l> :exe "vertical resize +1"<CR>


call plug#begin()

" colors
set background=dark
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
let g:tokyonight_style = "night"
let g:tokyonight_enable_italic = 1
let g:tokyonight_italic_functions = 1
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'chuling/vim-equinusocio-material'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'haishanh/night-owl.vim'
let g:one_allow_italics = 1 " I love italic for comments

"" syntax colors

" formatting
" range_formatting in visual mode
xmap <Leader>p <Plug>(prettier-format)
" formatting in normal mode
nmap <Leader>p <Plug>(prettier-format)

" absolute necessary plugs
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-fugitive'
nnoremap <leader>g :Git<CR>
nnoremap <leader>gg :Git<CR>
nnoremap gb :Git blame<CR>
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
map cm gc
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" interactions
Plug 'camspiers/lens.vim'
" Plug 'camspiers/animate.vim' "causes telescope jump out issue
Plug 'chrisbra/NrrwRgn' " <leader> ww
Plug 'wesQ3/vim-windowswap'

"file systems
Plug 'vifm/vifm.vim'
" let loaded_vifm = 1
" let g:vifm_embed_cwd = 1
" let g:vifm = "/usr/bin/vifmrun"
nmap <leader>v :Vifm<CR>
" nmap <leader>v :let $VIM_DIR=expand('%:p:h')<CR>:!vifm $VIM_DIR<CR> 
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
nnoremap <leader>r :Dirvish<CR>
" for tree expanding instead of preview
augroup dirvish_config
  autocmd!
  autocmd FileType dirvish
    \ nnoremap <silent><buffer> p ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
  autocmd FileType dirvish nmap <buffer> cd :cd %<CR>
augroup END

Plug 'ggandor/lightspeed.nvim'

" Using Lua functions
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>j <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>m <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>l <cmd>lua require('telescope.builtin').builtin()<cr>
nnoremap <leader>ca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>gi <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gbc <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>z <cmd>lua require'telescope'.extensions.zoxide.list{}<cr>


" programming
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType vue,html,css,typescript,javascript,ejs,javascriptreact,typescriptreact,svelte EmmetInstall

 " snippets
 " vsnip keys
 " Jump forward or backward
 " " Expand or jump
 imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
 smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
 imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
 smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
 imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
 smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
 " Plug 'mlaursen/vim-react-snippets'
 " Improves syntax for various languages
 " Snippets are separated from the engine. Add this if you want them:
 " Plug 'honza/vim-snippets'

 " -Lanugage SERVERS
 augroup lspsaga_filetypes
   autocmd!
   autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
 augroup END
 nnoremap <silent><leader>a :Lspsaga lsp_finder<CR>
 nnoremap <silent>ca :Lspsaga code_action<CR>
 vnoremap <silent>ca :<C-U>Lspsaga range_code_action<CR>
 " -- show hover doc
 nnoremap <silent>K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
 " -- scroll up down hover doc or scroll in definition preview
 nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
 nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
 nnoremap <silent><leader>sh <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
 nnoremap <silent><leader>sr <cmd>lua require('lspsaga.rename').rename()<CR>
 nnoremap <silent><leader>gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
 " -- show
 nnoremap <silent><leader>cd :Lspsaga show_line_diagnostics<CR>
 " -- only show diagnostic if cursor is over the area
 nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
 " -- jump diagnostic
 nnoremap <silent><leader>d :Lspsaga diagnostic_jump_next<CR>
 nnoremap <silent><leader>e :Lspsaga diagnostic_jump_prev<CR>

Plug 'folke/trouble.nvim'
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

call plug#end()

lua require('basic')
lua require('plugins')
lua require('languages')
set completeopt=menu,menuone,noselect
lua require('nvim-cmp')
colorscheme tokyonight
