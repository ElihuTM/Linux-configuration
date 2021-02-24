syntax on
set autoindent
set clipboard=unnamed
set encoding=utf-8
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set noswapfile
set number
set numberwidth=1
set ruler
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=4
set splitright
colorscheme pablo


call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'codota/tabnine-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Chiel92/vim-autoformat'

call plug#end()

" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "hard"
" let g:deoplete#enable_at_startup = 1
" let g:jsx_ext_required = 0

" nerd-tree
let NERDTreeQuitOnOpen=1

" ligthline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

let mapleader=" "
nmap <Leader>f <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>o :Files<CR> 

nmap <s-t> :vsplit<CR>
nmap <s-v> :vsplit ~/.vimrc<CR>
inoremap jk <esc>

"control j-k para mover lineas y selecciones completas
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" k desactiva las flecha
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
