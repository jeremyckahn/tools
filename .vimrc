syntax enable
set number
set hlsearch
set incsearch
set nocp
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
cnoreabbr nt NERDTree

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

colorscheme darkblue
"call pathogen#infect('~/tools/vim/bundle')


let mapleader = ","

nmap <leader>vs :split<CR>
nmap <leader>sp :vsplit<CR>
nmap <leader>q :tabnew<CR>
nmap <leader>e :tabn<CR>
nmap <leader>w :tabp<CR>
nmap <leader>r :tabc<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>a :set autoindent<CR>
nmap <leader>s :set noautoindent<CR>
nmap <leader>d :set wrap<CR>
nmap <leader>f :set nowrap<CR>

"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"Higlight current line only in insert mode
"autocmd InsertLeave * set nocursorline
"autocmd InsertEnter * set cursorline

" Folding stuff """""""""""""""""""""""""""""" 
set foldmethod=indent " use the syntax file to create folds

" Set a nicer foldtext function via http://vim.wikia.com/wiki/Customize_text_for_closed_folds
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
""""""""""""""""""""""""""""""""""""""""""""""

"Highlight cursor
"highlight CursorLine ctermbg=8 cterm=NONE

if has('mouse')
  set mouse=a
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" This `let` is needed for closetag.vim.  It is.  Don't move it.
let g:closetag_html_style=1
source ~/tools/vim/bundle/closetag.vim

" hi Warning guifg=#e7f6da guibg=#3A0505
" show hidden whitespace
set list listchars=tab:⇾\ ,trail:⇁
set colorcolumn=80

set hidden
