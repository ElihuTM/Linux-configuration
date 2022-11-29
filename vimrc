syntax on
set autoindent
set autoread
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
set softtabstop=4
set smartcase
set smartindent
set smarttab
set splitright
set tabstop=4

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Nerd Comenter
Plug 'preservim/nerdcommenter'
"[count]<leader>cc: comment
"[count]<leader>cl: comment aligned to left
"[count]<leader>c<leader: toggle comment
"[count]<leader>cm: comment using only multipart delimiter
"<leader>ca: switch to the alternative set of delimiters

" Nerd Tree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'

Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Chiel92/vim-autoformat'

" Rust
Plug 'rust-lang/rust.vim'

" css/sass colors
Plug 'skammer/vim-css-color'
Plug 'shmargum/vim-sass-colors'
" NOTE: vim-sass-colors requires ruby.

Plug 'christianfosli/wsl-copy'
Plug 'luochen1990/rainbow'
Plug 'djoshea/vim-autoread'

call plug#end()

" --------- THEMES -------------- 
"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'

colorscheme gruvbox 
let g:gruvbox_contrast_dark = "hard"
let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required = 0

" colorscheme papaya 
" let g:papaya_gui_color='blue'

" colorscheme onedark
" -------------------------------

" css color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" rainbow
let g:rainbow_active = 1

" -------- nerd-tree ----------------
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

" auto close nerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" git gutter config
set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" ligthline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

" ultisnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" close tag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" autoformat
au BufWrite *.scss,*.jsx,*.js,*.cpp :Autoformat

" maps
let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
map <Leader>nt :NERDTreeFind<CR>
map <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
map <Leader>p :Files<CR> 
map <Leader>gp :GFiles<CR>
map <Leader>ob :Buffers<CR>
nmap <Leader>n :vsplit<CR>
nmap <s-v> :vsplit ~/.vimrc<CR>

" fast <esc>
inoremap jk <esc>
inoremap JK <esc>

"cpy to windows clipboard
nmap <silent> <leader>c <Plug>WslCopy
xmap <silent> <leader>c <Plug>WslCopy

" alt-[j,k] to move the line position
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
xnoremap <A-k> :m '<-2<CR>gv=gv
xnoremap <A-j> :m '>+1<CR>gv=gv

" block arrows
inoremap <Up> <NOP> 
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" go to start/end of line
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
nnoremap J <C-d>
nnoremap K <C-u>

" coc suggestions
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file. 
" NOTE: you can use :CocConfig to access to your config file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ CheckBackspace() ? "\<Tab>" :
	\ coc#refresh()

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" coc snippets
inoremap <silent><expr> <c-l>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-k>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-j>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-k> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"open terminal
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
