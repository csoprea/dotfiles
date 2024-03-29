set nocompatible
set encoding=utf-8
set vb t_vb=
set t_ut=
set backupcopy=yes
set diffopt=filler,context:0

" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction

"vim-plug
"=================================================================================
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-node'
Plug 'rking/ag.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/PatternsOnText'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'vectorstorm/vim-chlordane'
Plug 'whatyouhide/vim-gotham'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ldelossa/vimdark'
Plug 'hauleth/blame.vim'
Plug 'beigebrucewayne/skull-vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"erlang
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-omnicomplete'


call plug#end()

filetype plugin indent on 
filetype plugin on 

"Display
"=================================================================================
colorscheme nord
set background=dark
set termguicolors

set t_Co=256
set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ 8
syntax on
set ruler
set number
"set relativenumber
hi CursorLine term=none cterm=none
set cursorline
set incsearch
set hlsearch
set ignorecase
set laststatus=2
set showcmd
set showmatch
set wildmenu
set nowrap
set list 
set listchars=tab:▸\ ,eol:¬


" With this, the gui (gvim) now doesn't have the toolbar, the left and right scrollbars and the menu.
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"set guioptions-=m
set guioptions-=M

"remaps
"=================================================================================
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-\> :BufExplorer<CR>
silent! map <F3> :NERDTreeFind<CR>
nnoremap <silent> <C-p> :FZF<CR>
nmap <C-f>j :%!python -m json.tool<CR>
vnoremap <silent>yc :'<,'>w !xclip -selection clipboard<CR><CR>
vnoremap <silent><Leader>y "yy <Bar> :call system('xclip', @y)<CR>


"autocmd
"=================================================================================
"autocmd vimenter * NERDTree 

au BufNewFile,BufRead *.py, set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.js, *.json,
        \ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
	\ set foldmethod=syntax

au BufNewFile,BufRead *.erl
        \ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set textwidth=79 |
	\ set expandtab |
	"\ set autoindent |
	\ set fileformat=unix |
	\ set foldmethod=syntax |
	\ set colorcolumn=100

au BufRead *.log set wrap

" NerdTree
" ==================================================================================
let NERDTreeQuitOnOpen=1

"python-mode, jedi
"=================================================================================
" let g:pymode_rope_completion=0
" let g:pymode_quickfix_minheight = 3
" let g:pymode_quickfix_maxheight = 6
" let g:pymode_lint_maxheight = 4
" let g:pymode_lint_minheight = 4

" let g:jedi#force_py_version = 3
let g:airline_theme = 'oceanicnext'
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:jedi#show_call_signatures = "1"
let g:airline#extensions#tagbar#flags = 'f'

"tern
"=================================================================================
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

"ale
"=================================================================================
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \}

"vim-indent-guides
"=================================================================================
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0

"Ag
"=================================================================================
"

"limeLight
"=================================================================================
let g:limelight_priority = -1
let g:limelight_paragraph_span = 1

"erlang
"=================================================================================
set cot-=preview

runtime snippets.vim
