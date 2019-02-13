"Configuration for C files

" auto indentation
setlocal autoindent
setlocal cindent
" use space instead of tab
setlocal expandtab
" Configuring how many space we want
setlocal shiftwidth=2
setlocal softtabstop=2
"Set indentation of parameters
setlocal cino+=(0

iabbrev print PrintLine( "CLACROIX:

"========== CSCOPE ============
" CSCOPE Autoload module
function! LoadCscope()
   let db = findfile("cscope.out", ".;")
   if (!empty(db))
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
   endif
endfunction

au VimEnter /* call LoadCscope()

augroup cleanFileAtExit
   autocmd!
   autocmd BufWritePre *.c,*.h,*.cpp,*.hpp :%s/\s\+$//e
   autocmd BufWritePre *.c,*.h,*.cpp,*.hpp :ClangFormat
augroup END
