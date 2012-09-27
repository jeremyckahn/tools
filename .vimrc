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
let g:ctrlp_use_caching = 1


" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

let mapleader = ","

nmap <leader>n :NERDTreeToggle<Enter>
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

"if &t_Co >= 256 || has("gui_running")
   "colorscheme desertEx
"endif

set t_Co=256

" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
hi x233_Grey7 ctermfg=233 guifg=#121212
hi ColorColumn ctermbg=233_Grey7

" show hidden whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

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

nmap <leader>q :tabnew<CR>
nmap <leader>w :tabp<CR>
nmap <leader>e :tabn<CR>
nmap <leader>r :tabc<CR>

" Fix Vim's ridiculous line wrapping model
set ww=<,>,[,],h,l

exec 'set colorcolumn=' . join(range(80, 500), ',')

" Autowrap at 80 characters.
"set fo+=t
"set wrapmargin=80
