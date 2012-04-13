syntax enable
set number
set hlsearch
set incsearch
set nocp
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

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

nmap qq :tabnew<CR>
nmap ww :tabp<CR>
nmap ee :tabn<CR>
nmap nn :NERDTreeToggle<Enter>
nmap <leader>DD :w !diff % -<CR>

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

" allow buffer switching without saving
set hidden

"Case insensitive search.
set ic

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
   colorscheme desertEx
endif

hi ColorColumn ctermbg=Black
" column gutter
set cc=81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
" Allow cursor movements during insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-d> <end>

" hitting jj will jump out of insert mode
inoremap jj <esc>

" quick vertical split
noremap <leader>v :vsp<CR>

" Quickly get rid of highlighting
noremap <leader>h :noh<CR>

" Make j and k work normally for soft wrapped lines
noremap <buffer> j gj
noremap <buffer> k gk

" Make the arrow keys work like TextMate in insert mode
inoremap <down> <C-C>gja
inoremap <up> <C-C>gka

" https://github.com/mileszs/ack.vim
let g:ackprg="ack -H --nocolor --nogroup --column"

" Ack for the current word
noremap <leader>a :Ack <c-r>=expand("<cword>")<CR><CR>

" Fix Vim's ridiculous line wrapping model
set ww=<,>,[,]
