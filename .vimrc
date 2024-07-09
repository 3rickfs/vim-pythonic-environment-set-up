set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

" PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"For full stack dev
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"Auto-indentation
Plugin 'vim-scripts/indentpython.vim'

"Flagging Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"UTF-Support
set encoding=utf-8

"Auto-complete
Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"Syntax Checking/Highlighting
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

"Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
call togglebg#map("<F5>") "to change from dark to light screen mode by pressing F5

"File Browsing: file tree view
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs' "to use tabs
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"Super searching
Plugin 'kien/ctrlp.vim'

"Line Numbering
set nu

"Git integration
Plugin 'tpope/vim-fugitive'

"Powerline: to see project state and other staff
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"System clipboard
set clipboard=unnamed

"VIM in the shell
"set editing-mode vi

"save the session, save modified files, and exit 
command! Xs :mks! | :xa 

" maximize current split or return to previous
Plugin 'szw/vim-maximizer'
noremap <C-w>m :MaximizerToggle<CR>

"running the code with a snap
nnoremap py :!python %

"integrated terminal macros
nnoremap <C-t> :terminal<CR>

"remap escape
inoremap jk <Esc>

" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

"hi Normal guibg=NONE ctermbg=NONE

"changing split windows size
nmap <M-Right> :vertical resize +1<CR>
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>
