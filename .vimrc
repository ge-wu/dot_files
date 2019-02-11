noremap <Leader>pi :PlugInstall <CR>
noremap <Leader>pu :PlugUpdate  <CR>
noremap <Leader>ps :PlugStatus  <CR>
noremap <Leader>pc :PlugClean   <CR>

" /* general map */
noremap <Leader>R  :source $MYVIMRC<CR> :echom 'Vimrc reloaded :)'<CR>
noremap <Leader>T  :termi:al<CR>

" /* Screen splitting */
nnoremap ,v <C-w>v
nnoremap ,s <C-w>s
nnoremap ,, <C-w><C-w>
" nnoremap <C-l> <C-w>l
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k

" /* Tab switch */
noremap <C-n>       :tabnew<CR>
noremap <C-w>       :x<CR>
nnoremap <C-Left>   :tabprevious<CR>
nnoremap <C-Right>  :tabnext<CR>
nnoremap <C-j>      :tabprevious<CR>
nnoremap <C-k>      :tabnext<CR>

call plug#begin()
    Plug 'junegunn/vim-plug'
    Plug 'Valloric/YouCompleteMe'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'scrooloose/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'junegunn/vim-easy-align'

    " /* coding tools | version control */
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'

    " /* documentation writer */
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

" /* Appearance */
set colorcolumn=100
set ruler
syntax on
set number
highlight LineNr ctermfg=black
set laststatus=2
hi StatusLine ctermfg=black ctermbg=NONE cterm=NONE
hi StatusLineNC ctermfg=black ctermbg=black cterm=NONE
hi User1 ctermfg=NONE ctermbg=red
hi User2 ctermfg=NONE ctermbg=blue
hi Pmenu ctermfg=Gray ctermbg=black
hi PmenuSel ctermfg=DarkBlue ctermbg=0
hi TabLineFill ctermfg=blue ctermbg=DarkGreen
hi TabLine ctermfg=None ctermbg=DarkBlue
hi TabLineSel ctermfg=None ctermbg=red

set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set smartindent
set autoindent

" /* functions */
set mouse=a
set nowrap
set scrolloff=5
set backspace=indent,eol,start
set ignorecase
set smartcase
set lazyredraw
set nocompatible
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase
set magic
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Display options
set showmode
set showcmd
set cmdheight=1

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Set status line display
set statusline=%=%1* 		" Switch to right-side
set statusline+=\ \ 		" Padding
set statusline+=%f 			" Path to the file (short)
set statusline+=\ %2*\ 		" Padding & switch colour
set statusline+=%l 		    " Current line
set statusline+=\  		    " Padding
set statusline+=of		    " of text
set statusline+=\  		    " Padding
set statusline+=%L 		    " Current line
set statusline+=\  		    " Padding

" /* For YCM */
set completeopt-=preview
set completeopt+=longest,menu
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_max_num_candidates = 14
let g:ycm_max_num_identifier_candidates = 7
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_semantic_triggers = {
 \   'python': [ 're!(import\s+|from\s+(\w+\s+(import\s+(\w+,\s+)*)?)?)'  ],
 \   'c'     : [ 're!\w{2}' ]
 \ }

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" /* for NERDTree */
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '__pycache__[[dir]]']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeShowHidden = 1

augroup nerd_behaviours
  au!
  autocmd StdinReadPre * let s:std_in = 1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd tableave * if exists('g:loaded_nerd_tree') | execute 'NERDTreeClose' | endif
augroup END


" /* For LaTex */
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex'
let g:livepreview_cursorhold_recompile = 1
autocmd Filetype tex setl updatetime=1000

