syntax on
set autoindent
set clipboard=unnamedplus
set cursorline
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

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'joshdick/onedark.vim'

" Nerd Tree
Plug 'scrooloose/nerdtree'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'

Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Chiel92/vim-autoformat'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'skammer/vim-css-color'
Plug 'shmargum/vim-sass-colors'
Plug 'christianfosli/wsl-copy'
Plug 'luochen1990/rainbow'

call plug#end()


colorscheme gruvbox 
let g:gruvbox_contrast_dark = "hard"
let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required = 0

" colorscheme papaya 
" let g:papaya_gui_color='blue'

" colorscheme onedark

" css color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" rainbow
let g:rainbow_active = 1

"nerd-tree
" let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
	\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" ligthline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" close tag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" autoformat
au BufWrite *.scss,*.jsx,*.js :Autoformat

" maps
let mapleader=" "

"run current file
nnoremap <Leader>x :!compiler -f %<cr>

nmap <Leader>s <Plug>(easymotion-s2)
map <Leader>nt :NERDTreeFind<CR>
map <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
map <Leader>p :Files<CR> 
map <Leader>gp :GFiles<CR>
map <Leader>ob :Buffers<CR>
nmap <s-n> :vnew<CR>
nmap <s-v> :vsplit ~/.vimrc<CR>
inoremap jk <esc>

"cpy to windows clipboard
nmap <silent> <leader>c <Plug>WslCopy
xmap <silent> <leader>c <Plug>WslCopy

"control j-k para mover lineas y selecciones completas
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" desactiva las flechas
inoremap <Up> <NOP> 
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map H ^
map L $

" split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" faster scrolling
nnoremap <silent> <C-e> 10<C-e>
nnoremap <silent> <C-y> 10<C-y>

inoremap <silent><expr> <c-space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! OpenTerminal()
	" move to right most buffer
	execute "normal \<C-l>"
	execute "normal \<C-l>"
	execute "normal \<C-l>"
	execute "normal \<C-l>"

	let bufNum = bufnr("%")
	let bufType = getbufvar(bufNum, "&buftype", "not found")

	if bufType == "terminal"
		" close existing terminal
		execute "q"
	else
		" open terminal
		execute "vsp term://zsh"
		
		" turn off numbers
		execute "set nonu"
		execute "set nornu"
	  
		" toggle insert on enter/exit
		silent au BufLeave <buffer> stopinsert!
		silent au BufWinEnter,WinEnter <buffer> startinsert!
	  
		" set maps inside terminal buffer
		execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
		execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
		execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

		startinsert!
	endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
