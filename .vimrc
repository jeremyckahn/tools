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

source ~/tools/vim/bundle/vim-pathogen/autoload/pathogen.vim
runtime ~/tools/vim/bundle/vim-pathogen/autoload/
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect('~/tools/vim/plugins')
let g:ctrlp_working_path_mode = 0

let mapleader = ","

nmap <leader>q :tabnew<CR>
nmap <leader>e :tabn<CR>
nmap <leader>w :tabp<CR>
nmap <leader>r :tabc<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>d :w !diff % -<CR>

" Folding stuff """"""""""""""""""""""""""""""
"set foldmethod=indent " use the syntax file to create folds

" Set a nicer foldtext function via http://vim.wikia.com/wiki/Customize_text_for_closed_folds
"set foldtext=MyFoldText()
"function! MyFoldText()
"  let line = getline(v:foldstart)
"  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
"    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
"    let linenum = v:foldstart + 1
"    while linenum < v:foldend
"      let line = getline( linenum )
"      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
"      if comment_content != ''
"        break
"      endif
"      let linenum = linenum + 1
"    endwhile
"    let sub = initial . ' ' . comment_content
"  else
"    let sub = line
"    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
"    if startbrace == '{'
"      let line = getline(v:foldend)
"      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
"      if endbrace == '}'
"        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
"      endif
"    endif
"  endif
"  let n = v:foldend - v:foldstart + 1
"  let info = " " . n . " lines"
"  let sub = sub . "                                                                                                                  "
"  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
"  let fold_w = getwinvar( 0, '&foldcolumn' )
"  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
"  return sub . info
"endfunction
""""""""""""""""""""""""""""""""""""""""""""""

 autocmd BufWritePre * :%s/\s\+$//e
"|             |                  | |
"|             |                  | This part actually removes the whitespace
"|             |                  The command will run for all file types
"|             This command will run immediately after you save a file
"Creates a new autocommand

if has('mouse')
  set mouse=a
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" show hidden whitespace
set list listchars=tab:⇾\ ,trail:⇁

set colorcolumn=80
" column gutter
"set cc=81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100

hi ColorColumn ctermbg=darkblue guibg=lightgrey
highlight Comment ctermfg=darkgreen

set hidden

" Gui stuff
if has("gui_running")
  set lines=150 columns=230 " Maximize gvim window.

  set guioptions-=T " Get rid of the toolbar
  set guioptions-=e " Get rid of the GUI tabs
  set guioptions-=r " Get rid of the right scrollbar
  set guioptions-=R " Get rid of the right scrollbar
  set guioptions-=l " Get rid of the left scrollbar
  set guioptions-=L " Get rid of the left scrollbar
  set guioptions-=b " Get rid of the bottom scrollbar
endif

:set backspace=indent,eol,start

