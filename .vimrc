"color murphy
"color desert
color luinnar
"color blue
"color ron
set tags=./.tags;/,~/.tags,~/.arm_tags
set dir=~/tmp
set updatecount=0
set nocompatible"non-compatible mode with old vi
"syntax on
filetype plugin indent on
set wrap"wrap lines
set lbr"wrap the whole words
set hidden"don't unload buffer while switching between terminals
set mouse=a"mouse avaliable in terminal
set showcmd"show running commands in status bar
"set matchpairs+=<:>
"set showmatch
"set autoread
set t_Co=256"more colors in terminal
set confirm"dialogs instead of error messages
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
set statusline=%F%m%r%h%w\ [FORM,ENC=%{&ff},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set nu

"set listchars=tab:>-,trail:-
"set list
"autocmd! bufreadpost * call LastPosition()
"function! LastPosition()
"if line("'\"") && line("'\"")<=line('$')
"normal! `"
"endif
"endfunction

"set backspace=indent,eol,start
set sessionoptions=curdir,buffers,tabpages
set noswapfile
set browsedir=current
set visualbell
set pastetoggle=

"Find adjustments
set ignorecase
set smartcase
set hls
set incsearch


"Folding options
"set foldenable
"set foldmethod=syntax
"set foldcolumn=3
"set foldlevel=1
"set foldopen=all

"tab options
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set cindent
"set expandtab
set smartindent
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8

"file options
if has('win32')
  set encoding=cp1251
else
  set encoding=utf-8
  set termencoding=utf-8
endif
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,cp866

filetype on
filetype plugin on
filetype indent on

if has('win32')
    let $VIMRUNTIME = $HOME.'\Programs\Vim\vim72'
    source $VIMRUNTIME/mswin.vim
else
    let $VIMRUNTIME = $HOME.'/.vim'
endif

if has('gui')
    set guioptions-=T " отключить меню в GUI
    "au GUIEnter * :set lines=99999 columns=99999
endif

let mapleader=","
" Misc. mappings:
map <F8> :TlistToggle<cr>
vmap <F8> <esc>:TlistToggle<cr>
imap <F8> <esc>:TlistToggle<cr>
" line numbers
map <C-N> <Esc>:set<Space>nu!<CR>a
nmap <C-N> :set<Space>nu!<CR>
" highligth search switch
map <C-H> :set<Space>hls!<CR>
imap <C-H> <esc>:set<space>hls!<cr>
vmap <C-H> <esc>:set<space>hls!<cr>
" tag jumping
" next tag
map <M-Right> :tnext<cr>
imap <M-Right> <esc>:tnext<cr>
vmap <M-Right> <esc>:tnext<cr>
map <M-l> :tnext<cr>
imap <M-l> <esc>:tnext<cr>
vmap <M-l> <esc>:tnext<cr>
" previous tag
map <M-Left> :tprev<cr>
imap <M-Left> <esc>:tprev<cr>
vmap <M-Left> <esc>:tprev<cr>
map <M-h> :tprev<cr>
imap <M-h> <esc>:tprev<cr>
vmap <M-h> <esc>:tprev<cr>
" first tag
map <M-Up> :tfirst<cr>
imap <M-Up> <esc>:tfirst<cr>
vmap <M-Up> <esc>:tfirst<cr>
map <M-k> :tfirst<cr>
imap <M-k> :tfirst<cr>
vmap <M-k> :tfirst<cr>

" findusage tag
map <Leader>U :call FindTagUsage( expand("<cword>"), "", 0 )<CR>
map <Leader>P :call FindTagUsage( expand("<cword>"), "", 1 )<CR>
map <Leader>D :call FindTagUsage( expand("<cword>"), "\.h$", 0 )<CR>
map <Leader>T :call FindTextUsage( expand("<cword>") )<CR>

map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

map <silent> gc xph
