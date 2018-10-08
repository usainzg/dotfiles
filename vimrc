let mapleader=","
let localmapleader="-"

set nocompatible

filetype off

syntax on "Sintaxis ON

filetype indent plugin on
"VimPlug {{{
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'chriskempson/base16-vim'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim'

Plug 'bling/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/syntastic'

Plug 'sirver/ultisnips'

Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries' }

Plug 'vim-scripts/Ada-Bundle', {'for': 'ada'}

Plug 'rust-lang/rust.vim', {'for': 'rust'}

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()
"}}}

"General Config {{{

"Disable arrows in normal mode {{{
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"}}}

"ShoftLimit line {{{
set textwidth=80
set colorcolumn=+1
"}}}

"Auto reload if file changes {{{
set autoread
"}}}

"Line numbers {{{
set number
set relativenumber
"}}}

"Indentation {{{
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
"}}}

"Folding {{{
set foldmethod=indent
"}}}

"Move vertically by visual line{{{
nnoremap j gj
nnoremap k gk
"}}}

"Move though Panes {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"}}}

"Make tags in current dir {{{
command! MakeTags execute "!ctags -R ."
"}}}

"Go to tag declaration {{{
noremap <leader>r <esc><C-]>
"}}}

"No delay for esc key {{{
set timeoutlen=1000 ttimeoutlen=0
"}}}

"Backups {{{
set nobackup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set nowritebackup
"}}}

"Invisible chars {{{
set listchars=tab:▸\ ,eol:¬,trail:·
set list
"}}}

"Cursor corlor {{{

"}}}

"Remove trailing whitespace on save{{{
autocmd! BufWritePre * :%s/\s\+$//e
"}}}

"Other {{{
set showcmd
set cursorline

set wildmenu

set showmatch
set incsearch
set hlsearch
"}}}

"Move lines up and down{{{
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>==
inoremap <C-Down> <esc> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Up> <esc> :m .-2<CR>==
"}}}

"Autocomplete like IDE{{
set completeopt=longest,menuone
inoremap <C-Space> <C-x><C-o>
"}}

"No swap files{{
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
"}}


"Change cursor shape in insert mode{{{
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
"}}}

"}}}

"Plugin Config {{{

"Vim-Airline {{{
let g:airline_theme='qwq'
set laststatus=2
"}}}

"CtrlP{{{
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1
"}}}

"UltiSnippets {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['$HOME/.vim/UltiSnips', 'UltiSnips']
"}}}

"Base 16{{{
let base16colorspace=256
let g:airline_theme='base16'

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
"}}}

" Syntastic{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" Rust {{{
let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers = ['rustc']
" }}}

"}}u
