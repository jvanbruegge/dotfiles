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

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'altercation/vim-colors-solarized'

Plug 'jamessan/vim-gnupg'

"Fuzzy selection
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Language support
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'vmchale/dhall-vim'

"Formatting
Plug 'sdiehl/vim-ormolu'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

"Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

"Colored parenthesis
Plug 'luochen1990/rainbow'

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:rainbow_active = 1

set hidden

behave xterm

set ttyfast
set secure

"Scroll before reaching end of page
set scrolloff=5
set encoding=utf-8

"Remove splash screen
set shortmess+=I
set shortmess+=c

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

"Don't need backup
set nobackup
set nowb
set noswapfile

"Spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"Copy spaces from previous lines
set autoindent

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
nmap <leader>o :FZF<CR>
nmap <leader>t :tabnew<CR>:FZF<CR>

nnoremap <leader>n :tabnew 
nnoremap J :tabp<CR>
nnoremap K :tabn<CR>

"Language client functions
nnoremap <leader>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <leader>g :call LanguageClient_textDocument_definition({'gotoCmd': 'tabnew'})<CR>
nnoremap <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <leader>f :call LanguageClient_textDocument_references()<CR>
nnoremap <c-i> :call LanguageClient_textDocument_formatting()<CR>
vnoremap <c-i> :call LanguageClient_textDocument_rangeFormatting()<CR>

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'dhall': ['dhall-lsp-server']
    \ }
let g:LanguageClient_settingsPath = '~/.config/nvim/lsp.json'
let g:LanguageClient_hoverPreview = 'Always'
let g:LanguageClient_floatingHoverHighlight = 'Normal:PMenu'

"Plugin config
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

let g:rainbow_conf = {
    \ 'ctermfgs': ['darkblue', 'darkgreen', 'red', 'magenta', 'brown', 'lightgreen']
\ }

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

set nrformats=alpha

syntax enable
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

"Deoplete configuration
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><CR> pumvisible() ? "\<c-y>\<CR>" : "\<CR>"
