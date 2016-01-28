
source .vimrc.d/plugins.vim
syntax on

"===================="
" Plugin Options     "
"===================="


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
