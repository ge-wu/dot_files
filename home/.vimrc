" /* Key maps */ 
noremap <Leader>pi :PlugInstall <CR>
noremap <Leader>pu :PlugUpdate  <CR>
noremap <Leader>ps :PlugStatus  <CR>
noremap <Leader>pc :PlugClean   <CR>

" /* general map */
noremap <Leader>R  :source $MYVIMRC<CR> :echom 'Vimrc reloaded :)'<CR>
noremap <Leader>T  :terminal<CR>

" /* Screen splitting */
nnoremap ,h <C-w>v
nnoremap ,v <C-w>s
nnoremap ,, <C-w><C-w>

" /* Tab switch */
noremap <C-n>       :tabnew<CR>
nnoremap <C-l>      :tabnext<CR>
nnoremap <C-h>      :tabprevious<CR>

nnoremap <C-left>      :tabnext<CR>
nnoremap <C-right>      :tabprevious<CR>

" \* Copy & Paste */ 
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" /* Regrex */
noremap ;; :%s:::g<Left><Left><Left>

" /* Plugins */ 
call plug#begin()
    Plug 'junegunn/vim-plug'

    " /* IDE Oriented */ 
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'Valloric/YouCompleteMe'
    Plug 'SirVer/ultisnips' 
    Plug 'w0rp/ale'

    " /* Appearance */
    " Plug 'iCyMind/NeoSolarized'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Plug 'ap/vim-css-color'
    Plug 'kaicataldo/material.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'joshdick/onedark.vim'

    " /* coding tools | version control */
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
    Plug 'MattesGroeger/vim-bookmarks'

    " /* documentation writer */
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'junegunn/goyo.vim'
    Plug 'rhysd/vim-grammarous'
    Plug 'JamshedVesuna/vim-markdown-preview'

    " /* Python */
    Plug 'vim-scripts/indentpython.vim'

call plug#end()

" /* Appearance */
set colorcolumn=80
set number relativenumber
set cursorline
set termguicolors
set nowrap
set tw=79
set fo+=t

set mouse=a
set scrolloff=25
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
set clipboard=unnamed
set splitbelow

set hlsearch
set incsearch

nnoremap <space> za
vnoremap <space> zf

" /* For airline */
let g:airline_section_warning=''
let g:airline_skip_empty_sections = 1
let g:airline_section_z = '%3p%% %l:%c'

" /* For ale */
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)
nmap <silent> <Leader>al <Plug>(ale_lint)
nmap <silent> <Leader>af <Plug>(ale_fix)
nmap <silent> <Leader>at <Plug>(ale_toggle)
cabbrev AF ALEFix

let g:ale_fixers = {
      \  '*': ['trim_whitespace'],
      \  'c': ['clang-format'],
      \  'javascript': ['prettier', 'importjs'],
      \  'sh': ['shfmt'],
      \  'python': ['autopep8', 'isort'],
      \  'json': ['fixjson', 'prettier'],
      \ }

let g:ale_warn_about_trailing_whitespace = 0
let g:ale_maximum_file_size = 1024 * 1024
let g:ale_set_balloons_legacy_echo = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" for python
let g:ale_python_mypy_ignore_invalid_syntax = 1
let g:ale_python_mypy_options = '--incremental'
let g:ale_python_pylint_options = '--max-line-length=80'
let g:ale_python_autopep8_options = '--max-line-length=80'
let g:ale_python_flake8_options = '--max-line-length=80'
" /* For UltiSnips */
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" /* For YCM */
set completeopt-=preview
set completeopt+=longest,menu
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = 'python3'
let g:ycm_goto_buffer_command = 'horizontal-split'

let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers = {
 \   'python': [ 're!(import\s+|from\s+(\w+\s+(import\s+(\w+,\s+)*)?)?)'  ]
 \ }

" /* For NERDTree */
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 1 
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '__pycache__[[dir]]']

" /* for LaTex */
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'pdflatex'
autocmd Filetype tex setl updatetime=1000
let g:tex_flavor = "latex"

" /* File headers */
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
    au BufNewFile *.tex call Create_message()                      |
    au BufWritePre * ks|call Last_mode()|'s|delmark s              |
augroup END

" /* Identify header */
function! Create_message()
    let separate_line = repeat('=', 70)
    let author = 'Author: Jiaye William Wang'
    let create_time = 'Creation Time: ' .strftime("%Y-%m-%d %T")
    let last_modified_time = 'Last Modified: ' .strftime("%Y-%m-%d %T")
    call setline(1, [separate_line, '', author, create_time, last_modified_time])
    exe "%normal gcc"
    exe "%s/ / /g"
endfunc

" /* For update identify header */ 
function! Last_mode()
    if line('$') > 20
        let temp = 20
    else 
        let temp = line('$')
    endif
    silent exe "1," . temp . "g/Last Modified: /s/Last Modified: .*/Last Modified: " 
            \ .strftime("%Y-%m-%d %T")
endfunc

" /* Remember fold
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" /* Remember last position */
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
au BufRead,BufNewFile *.md setlocal textwidth=80

set background=dark
syntax on
colorscheme onedark
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax enable
syntax spell toplevel
syn sync maxlines=2000
syn sync minlines=500
setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

let vim_markdown_preview_github=1

