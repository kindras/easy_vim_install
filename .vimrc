filetype plugin on
filetype plugin indent on

" ======== VUNDLE CONFIG ============
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin Syntastic
Plugin 'scrooloose/syntastic'
"DoxygenTool
Plugin 'DoxygenToolkit.vim'

"To be activated to try clang-format
""Vim operator
Plugin 'kana/vim-operator-user'
""Clang format
Plugin 'rhysd/vim-clang-format'
"Indent for python file
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line

call vundle#end()            " required
"filetype plugin indent on    " required


au VimEnter /* source ~/.vim/plugins/cscope_maps.vim
" ========= GLOBAL ============
if &diff
   colorscheme monokai
   "Ignore whitespace during vimdiff
   set diffopt+=iwhite
   setlocal nospell
else
   setlocal nospell
endif


"Deactivate bracketed paste mode in vi
set t_BE=

"enable syntax color
syntax enable

let maplocalleader = "\\"

"Show line number on the left side
set number

"Highlight tab in current file
highlight TabLine ctermbg=Blue
match TabLine /\t/

augroup displayAfterInsert
   autocmd InsertEnter * :set norelativenumber
   " highlight in "Error" style white caracters at the end of lines
   autocmd InsertLeave * match Error /\s\+$/
   autocmd InsertLeave * match TabLine /\t/
   " autocmd InsertLeave * match custom_type "\v[A-Z][A-Za-z_]*_t"
   autocmd InsertLeave * :set relativenumber
augroup END

" highlight the delimiter which matches the one under the cursor
set showmatch

"Command to display constantly the current filename
set statusline=%f%m%r%h%w\ [Line=%04l/%04.8L]\ [%p%%]
set statusline +=%{fugitive#statusline()}
set laststatus=2
set showcmd

"Customize status line. Use a Blue background for the focused window
hi StatusLine ctermfg=white     ctermbg=DarkBlue     cterm=bold

" use space instead of tab
setlocal expandtab
" Configuring how many space we want
setlocal shiftwidth=2
setlocal softtabstop=2
"
"Prefer split below with :split
setlocal splitbelow
""Prefer split on the right with :vsplit
setlocal splitright

" ========= Syntastic =========
if &diff
   "Deactivate syntastic during a vimdiff
   let g:syntastic_mode_map = { 'mode': 'passive',}
else
   let g:syntastic_aggregate_errors = 1
   let g:syntastic_always_populate_loc_list = 1
   let g:syntastic_auto_loc_list = 1
   let g:syntastic_check_on_open = 1
   let g:syntastic_check_on_wq = 0

   let g:syntastic_c_checkers=['cppcheck', 'clang_check']
   let g:syntastic_cpp_checkers=['cppcheck', 'clang_check']
   let g:syntastic_cpp_compiler_options = '-std=c++1y -stdlib=libc++'

   " let clang_check use the compilation database
    let g:syntastic_c_clang_check_post_args = ""
    let g:syntastic_cpp_clang_check_post_args = ""

   " python configuration
   let g:syntastic_python_checkers = ['pylint']
endif

" ========= REMAPPING =========
"Mapping scroll on ctrl q
nnoremap <c-q>  <c-y>
"Beginning of the interesting config

" use jk keystroke to emluate escape keystroke during insert mode
inoremap jk <esc>
"
" CAUTION, ONLY FOR EXPERIMENTED VIM USERS (SOME OF DEVS BECAME CRAZY)
" ACTIVATE THIS IF YOU ARE REALLY USED TO USE hjkl
"
" vnoremap   <Up>     <nop>
" vnoremap   <Down>   <nop>
" vnoremap   <Left>   <nop>
" vnoremap   <Right>  <nop>
" inoremap   <Up>     <nop>
" inoremap   <Down>   <nop>
" inoremap   <Left>   <nop>
" inoremap   <Right>  <nop>
" inoremap   <esc>    <nop>
" nnoremap   <Up>     <nop>
" nnoremap   <Down>   <nop>
" nnoremap   <Left>   <nop>
" nnoremap   <Right>  <nop>

"Creating shortcut to move easily from another windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Mapping for merge tools
nnoremap ,2 "<ESC>:diffg LO<ENTER><ESC>:diffu<ENTER><ESC>"
nnoremap ,3 "<ESC>:diffg BA<ENTER><ESC>:diffu<ENTER><ESC>"
nnoremap ,4 "<ESC>:diffg RE<ENTER><ESC>:diffu<ENTER><ESC>"

"Clang configuration

let g:clang_format#style_options = {
         \ "BasedOnStyle": "Google",
         \ "AlignConsecutiveAssignments": "true",
         \ "AlignConsecutiveDeclarations": "true",
         \ "BinPackArguments": "false",
         \ "BinPackParameters": "false",
         \ "ColumnLimit": 120,
         \ "ContinuationIndentWidth": 120,
         \ "DerivePointerAlignment": "false",
         \ "PointerAlignment": "Right",
         \ "Standard": "Cpp03" }

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nnoremap <Leader>f :SyntasticToggleMode<CR>
nnoremap <Leader>sc :SyntasticCheck cpp<CR>
nnoremap <Leader>sp :SyntasticCheck py<CR>

