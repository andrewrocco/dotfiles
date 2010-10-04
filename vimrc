set nocompatible

function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

" Auto-apply .vimrc settings after saving
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" View **********************
syntax on
set nonumber
set guicursor=a:blinkon0
set visualbell t_vb=
set spell

set laststatus=2
set ruler
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)
let g:rails_statusline=0

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1,default

autocmd FileType html set filetype=xhtml
autocmd BufRead *.css.php set filetype=css
autocmd BufRead *.less set filetype=css
autocmd BufRead *.js.php set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
autocmd BufRead *.mkd set filetype=mkd
autocmd BufRead *.markdown set filetype=mkd
autocmd BufRead *.god set filetype=ruby

let php_sql_query=1
let php_htmlInStrings=1

set completeopt=longest,menu
set wildmode=list:longest,list:full
set wildmenu
set complete=.,t
"set wildignore=*~


" Indentation ********************
set autoindent
set smartindent
set smarttab
set tabstop=4 
set shiftwidth=2
set softtabstop=2
set expandtab


" Buffers ************************
set hidden
set nobackup
set nowritebackup
set noswapfile


" Search ************************* 
set ignorecase
set hlsearch
"set incsearch


" Editing ************************
set backspace=indent,eol,start
map <S-Enter> O<ESC>
map <Enter> o<ESC>
set fo-=r

let loaded_matchparen = 1

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

set undofile
set undodir=~/.undo

set listchars=tab:▸\ ,eol:¬


" Movement ***********************
set nostartofline
set mouse=a

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-q> <C-w>q


" Custom Hotkeys *****************
let mapleader = ","

" splitting
nmap <leader>swh  :topleft  vnew<CR>
nmap <leader>swl :botright vnew<CR>
nmap <leader>swk    :topleft  new<CR>
nmap <leader>swj  :botright new<CR>
nmap <leader>sh   :leftabove  vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk     :leftabove  new<CR>
nmap <leader>sj   :rightbelow new<CR>

map <leader>t :NERDTreeToggle<CR>
map <leader>F :FufFile<CR>
map <leader>/ :FufFile **/<CR>
map <leader>f :FufFileWithCurrentBufferDir<CR>
map <leader>d :FufDir<CR>
map <leader>b :FufBuffer<CR>
map <leader>cd :cd %:p:h<CR>
map <leader>p "0p
 
nnoremap Y y$

MapToggle <F1> hlsearch
MapToggle <F2> wrap
MapToggle <F3> number

:vnoremap < <gv
:vnoremap > >gv


" Plugin Settings ****************
let g:fuf_file_exclude = '\v\.DS_Store|\.bak|\.swp'


" GUI Settings *******************
if has("gui_running")
  set guioptions=egmrt
  set guifont=Monaco:h14
  colorscheme oceandeep
  set lines=40 columns=120

  set go-=T
  set go-=r
endif
