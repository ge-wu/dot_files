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
noremap <C-w>       :x<CR>
noremap <C-n>       :tabnew<CR>
nnoremap <C-k>      :tabnext<CR>
nnoremap <C-Right>  :tabnext<CR>
nnoremap <C-j>      :tabprevious<CR>
nnoremap <C-Left>   :tabprevious<CR>

call plug#begin()
    Plug 'junegunn/vim-plug'

    " /* IDE Oriented */ 
    Plug 'Valloric/YouCompleteMe'
    Plug 'artur-shaik/vim-javacomplete2'

    Plug 'w0rp/ale'
    Plug 'SirVer/ultisnips' 

    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " /* Appearance */
    Plug 'ryanoasis/vim-devicons'
    Plug 'kaicataldo/material.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " /* coding tools | version control */
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/goyo.vim'
    Plug 'MattesGroeger/vim-bookmarks'

    " /* documentation writer */
    " Plug 'lervag/vimtex'
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    Plug 'scrooloose/vim-slumlord'
    Plug 'aklt/plantuml-syntax'

call plug#end()

" /* Appearance */
set colorcolumn=80
syntax enable
set background=dark
colorscheme material
set termguicolors
set number relativenumber
set cursorline
set laststatus=2

set expandtab
set tabstop=2
set autoindent
set smartindent
set noshiftround
set shiftwidth=4
set softtabstop=4
set formatoptions=tcqrn1

" /* functions */
set magic
set nowrap
set mouse=a
set hlsearch
set incsearch
set smartcase
set smartcase
set ignorecase
set ignorecase
set lazyredraw
set scrolloff=25
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" /* For YCM */
set completeopt-=preview
let g:ycm_auto_trigger = 1
set completeopt+=longest,menu
let g:ycm_max_num_candidates = 14
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_max_num_identifier_candidates = 7
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_semantic_triggers = {
 \   'python': [ 're!(import\s+|from\s+(\w+\s+(import\s+(\w+,\s+)*)?)?)'  ],
 \   'c'     : [ 're!\w{2}' ]
 \ }

" /* For UltiSnips */
" let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsEditSplit='vertical'
" let g:UltiSnipsSnippetsDir='./UltiSnips'
" let g:UltiSnipsSnippetDirectories='~./UltiSnips'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" /* for NERDTree */
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 1 
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '__pycache__[[dir]]']

augroup nerd_behaviours
  au!
  autocmd StdinReadPre * let s:std_in = 1
  autocmd tableave * if exists('g:loaded_nerd_tree') | execute 'NERDTreeClose' | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
augroup END


" /* for LaTex */
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'pdflatex'
autocmd Filetype tex setl updatetime=1000
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:tex_flavor = "latex"

" /* file headers */
augroup add_file_headers
  au!
  au BufNewFile *.sh
        \ call setline(1, '#!/usr/bin/env bash')                   |
        \ call append(line('.'), '')                               |
        \ normal! Go
  au BufNewFile *.py
        \ call setline(1, '#!/usr/bin/env python')                 |
        \ call append(line('.'), '# -*- coding: utf-8 -*-')        |
        \ call append(line('.')+1, '')                             |
        \ normal! Go
  au BufNewFile *.{cpp,cc}
        \ call setline(1, '#include <iostream>')                   |
        \ call append(line('.'), '')                               |
        \ normal! Go
  au BufNewFile *.c
        \ call setline(1, '#include <stdio.h>')                    |
        \ call append(line('.'), '')                               |
        \ normal! Go
  au BufNewFile *.h,*.hpp
        \ call setline(1, '#ifndef _'.toupper(expand('%:r')).'_H') |
        \ call setline(2, '#define _'.toupper(expand('%:r')).'_H') |
        \ call setline(3, '#endif')                                |
        \ normal! Go
augroup END
