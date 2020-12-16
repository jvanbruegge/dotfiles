set nocompatible
set modelines=0

"vim-plug with automatic setup
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'

Plug 'altercation/vim-colors-solarized'

"Fuzzy selection
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Language server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"Language support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vmchale/dhall-vim'

"Formatting
Plug 'sdiehl/vim-ormolu'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

"Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

"Colored parenthesis
Plug 'luochen1990/rainbow'

call plug#end()

"No stupid autoindent
filetype indent off
"But keep indentation from previous lines
set autoindent
set smartindent

set hidden

"Don't need backup
set nobackup
set nowb
set noswapfile

"Fast scrolling
set ttyfast
set secure

"Scroll before reaching end of page
set scrolloff=5
set encoding=utf-8

function ToggleNumber()
    set norelativenumber
    if &number
	set nonumber
    else
        set number
    endif
endfunction

function ToggleRelNumber()
    set nonumber
    if &relativenumber
        set norelativenumber
    else
	set relativenumber
    endif
endfunction

map <F2> :call ToggleNumber()<CR>
map <F3> :call ToggleRelNumber()<CR>

"Spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"Leader key
nnoremap <SPACE> <Nop>
let mapleader = " "

"Enable copy+paste from the clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"Open files quickly
nmap <silent> <leader>o :Files<CR>
nmap <silent> <leader>t :tabnew<CR>:Files<CR>

"Navigate tabs with J and K
nnoremap J :tabp<CR>
nnoremap K :tabn<CR>

"Plugin config
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

let g:rainbow_active = 1
let g:rainbow_conf = {
    \ 'ctermfgs': ['darkblue', 'darkgreen', 'red', 'magenta', 'brown', 'lightgreen']
\ }

"Autoformat code with prettier on save
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

"Allow to incrment letters with Ctrl+A
set nrformats=alpha

"Solarized dark color scheme
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

"""Language server configuration

"Increase height of status line to fit bigger errors
set cmdheight=2
set updatetime=300

" Don't pass messages to the completion menu
set shortmess+=c
"Enable the column for gitgutter and diagnostics by default
set signcolumn=yes

"Use tab for trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Use <leader>+d to show documentation is a preview window
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"Renaming symbols
nmap <leader>r <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
