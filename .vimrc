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
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp_search = 1


" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

let mapleader = ","

nmap <leader>q :tabnew<CR>
nmap <leader>e :tabn<CR>
nmap <leader>w :tabp<CR>
nmap <leader>r :tabc<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>d :w !diff % -<CR>

 autocmd BufWritePre * :%s/\s\+$//e
"|             |                  | |
"|             |                  | This part actually removes the whitespace
"|             |                  The command will run for all file types
"|             This command will run immediately after you save a file
"Creates a new autocommand

"if has('mouse')
  "set mouse=a
"endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" show hidden whitespace
set list listchars=tab:⇾\ ,trail:⇁

set colorcolumn=80
" column gutter
"set cc=81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100

hi ColorColumn ctermbg=darkblue guibg=lightgrey
"highlight Comment ctermfg=darkgreen

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

" --- command completion ---
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*.DS_STORE,*.db


" --- remove sounds effects ---
set noerrorbells
set visualbell


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set pastetoggle=<F2>

if &t_Co >= 256 || has("gui_running")
   colorscheme darkZ
endif
