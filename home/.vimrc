noremap <Leader>R  :source $MYVIMRC<CR> :echom 'Vimrc reloaded'<CR>
noremap <silent> <Leader>T  :terminal<CR>
noremap <silent> <Leader> <space> :noh <CR>

" Regrex reformat
noremap ;; :%s:::g<Left><Left><Left>

" Screen splitting
nnoremap ,h <C-w>v
nnoremap ,v <C-w>s
nnoremap ,, <C-w><C-w>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Tab switch
noremap     <silent> <C-n>  :tabnew         <CR>
nnoremap    <silent> <C-l>  :tabnext        <CR>
nnoremap    <silent> <C-h>  :tabprevious    <CR>

" Quick fold
nnoremap <space> za
vnoremap <space> zf

" Execution shortcuts
noremap <Leader>l :LivedownToggle   <CR>

call plug#begin('~/.vim/plugged')
    " /* IDE Oriented */
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vwxyutarooo/nerdtree-devicons-syntax'

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'SirVer/ultisnips'
    Plug 'shime/vim-livedown'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " /* Appearance */
    Plug 'sainnhe/gruvbox-material'
    Plug 'lifepillar/vim-solarized8'
    Plug 'skielbasa/vim-material-monokai'

    Plug 'vim-airline/vim-airline'
    Plug 'mhinz/vim-startify'

    " /* Language Tools */
    Plug 'lervag/vimtex'
call plug#end()

" /* Functionality */
set encoding=UTF-8
set number
set expandtab ts=4 sw=4 ai "set tab
set nowrap
set mouse=a
set wildmode=longest,full
set wildmenu
set hlsearch
set incsearch
set autoread
set noshowmode
set noerrorbells
set history=1000
set clipboard=unnamed

" /* Helper script */ 
source ~/.vim/script/add_headers.vim
source ~/.vim/script/remember_last_position.vim

" /* Appearance */
set nocursorline
set colorcolumn=80
set numberwidth=1
set cursorline

if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material

syntax on
filetype detect
filetype on
highlight clear SignColumn


" /* For Latex */
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer="okular"
" au BufRead,BufNewFile *.tex
" set wm=2 " Auto wrap line
noremap <Leader>b :VimtexCompile    <CR>

" /* Grammar Check */
syntax spell toplevel
syn sync maxlines=2000
syn sync minlines=500
setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

" /* For Airline
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_y = ''
let g:airline_section_z = 'Ln:%3l/%L:Col:%2v'
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" /* For Airline Tab
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#keymap_ignored_filetypes = 
            \['vimfiler', 'nerdtree']
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''

" /* For NERDTree */
noremap <Leader>n :NERDTreeToggle   <CR>
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMapOpenInTab="<ENTER>"
let NERDTreeMapOpenInTabSilent="<CTRL><ENTER>"
let NERDTreeMapOpenSplit="h"
let NERDTreeMapOpenVSplit="v"

" /* For UltiSnips */
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" /*For COC */
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" /* For fzf */
nnoremap <silent> <leader>f :Files <CR>
