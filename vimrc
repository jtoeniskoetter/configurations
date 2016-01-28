set nocompatible

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins from github
" Package manager
Plugin 'VundleVim/Vundle.vim'

" Class outline viewer
Plugin 'majutsushi/tagbar'

" Syntax checker
Plugin 'scrooloose/syntastic'

" File explorer
Plugin 'scrooloose/nerdtree'

" Comment shortcuts
Plugin 'scrooloose/nerdcommenter'

" Text Object type for function arguments
Plugin 'vim-scripts/argtextobj.vim'

" Use tab for autocomplete
Plugin 'ervandew/supertab'

" Use <leader>ww to swap 2 windows
Plugin 'wesQ3/vim-windowswap'

" Status line
Plugin 'bling/vim-airline'

" Shows indentation level
Plugin 'Yggdroot/indentLine'

" Closes brackets, quotes, etc
Plugin 'Raimondi/delimitMate'

" File finder
Plugin 'ctrlpvim/ctrlp.vim'

" Git integration
Plugin 'airblade/vim-gitgutter'

" Hide lines matching a pattern
Plugin 'embear/vim-foldsearch'

call vundle#end()
" End Vundle

filetype plugin indent on
syntax on

"===================="
" Plugin Options     "
"===================="

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_powerline_fonts=1 " Enable when fonts installed
set laststatus=2 " enables airline without splitting

" Airline extension support
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tagbar#enable=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Delimitmate options
let delimitMate_expand_cr = 1

" Solarized settings
"if $SSH_CONNECTION
"  let g:solarized_termtrans=1
"  let g:solarized_termcolors=256
"endif

set t_Co=256
set background=dark
colorscheme solarized

" Toggle NerdTree with Ctrl+n
nmap <F1> :NERDTreeToggle<CR>

" Toggle Tagbar
nmap <F2> :TagbarToggle<CR>

"===================="
" Autocommands       "
"===================="

" On loss of focus, enters normal mode
autocmd BufEnter * stopinsert
autocmd BufLeave * stopinsert

" On loss of focus, saves all buffers
:au FocusLost * silent! wa
" Save buffer on buffer switch
set autowriteall

" Automatically changes the working path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

"===================="
" Some Basic Options "
"===================="

" Easier way to exit insert mode
inoremap jk <ESC>

let mapleader=','

" Line numbers
set number

set cursorline


" Useful import scripts
command SortImports !/google/src/head/depot/google3/tools/java/sort_java_imports.py %
command UnusedImports !/google/src/head/depot/google3/tools/java/remove_unused_imports.py --fix %

" Change default split positioning
set splitbelow
set splitright

set hlsearch

set mouse=a
set expandtab
set tabstop=2

" Save when focus is lost
au FocusLost * :wa

" Get rid of the help key
" Disabled above by remapping F1 to NerdTree
"nnoremap <F1> <ESC>
"inoremap <F1> <ESC>
"vnoremap <F1> <ESC>

" Disable arrow keys. Use ijkl
nnoremap <up>    :tabn<return>
nnoremap <down>  :tabp<return>
nnoremap <left>  :bp<return>
nnoremap <right> :bn<return>

nnoremap ; :
nnoremap ` :bn<return>
"" Pressing C-j splits line at cursor
nnoremap <C-J> i<CR><ESC>
"" Inserts space after current from normal mode, and moves cursor right
nnoremap <space> i<space><ESC>l
"" Inserts a newline after current position in normal mode
nnoremap <return> A<return><ESC>

fun! TrimWhitespace()
  let l:save_cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', l:save_cursor)
endfun

command! Trim call TrimWhitespace()

" Code folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
"set foldlevel=2


" Enable relative line number toggle
function! NumberToggle()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

noremap <C-n> :call NumberToggle()<cr>
