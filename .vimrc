call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug'

    " /* Function */
    Plug 'Valloric/YouCompleteMe'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'scrooloose/nerdtree'

    " /* Appearance */
    Plug 'kaicataldo/material.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()


" /* Appearance */
set number
set colorcolumn=80,120
syntax enable
set cursorline

" /* code style */
set noerrorbells
set nowrap
set smartindent
set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set cindent
set encoding=UTF-8

" /* functions */
set mouse=a
set scrolloff=5
set belloff=all
set backspace=indent,eol,start
" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
	 \ endif


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

" /* For vim-airline */
nnoremap <Leader>A :AirlineToggle<CR>:AirlineRefresh<CR>
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_highlighting_cache = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#hunks#non_zero_only = 1

set background=dark
colorscheme material
let g:airline_theme = 'material'
let g:material_terminal_italics = 1

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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
