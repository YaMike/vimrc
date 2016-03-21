"color murphy
"color desert
color elda
"color ron
set nu
set tags=./.ctags;/,~/.ctags
set dir=~/tmp
set updatecount=0
"tab size
set tabstop=4
set nocompatible "non-compatible mode with old vi
"syntax on
filetype plugin indent on
set nowrap "wrap lines
set lbr "wrap the whole words
set hidden "don't unload buffer while switching between terminals
set mouse=a "mouse avaliable in terminal
set showcmd "show running commands in status bar
"set matchpairs+=<:>
"set showmatch
"set autoread
set t_Co=256 "more colors in terminal
set confirm "dialogs instead of error messages
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
set statusline=%F%m%r%h%w\ [FORM,ENC=%{&ff},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

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
"set ignorecase
set smartcase
set hls
set incsearch

"Folding options
set foldenable
"set foldmethod=indent
set foldmethod=syntax
"set foldcolumn=3
set foldlevel=0
"set foldopen=all
set foldnestmax=1

"tab options
set shiftwidth=4
"set softtabstop=4
set autoindent
set cindent
"set expandtab
set smartindent
set smarttab
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

if has("gui_running")
	if has("gui_gtk2")
		set guifont=Courier\ New\ 14
	elseif has("gui_photon")
		set guifont=Courier\ New:s14
	elseif has("gui_kde")
		set guifont=Courier\ New/14/-1/5/50/0/0/0/1/0
	elseif has("x14")
		set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
	else
		set guifont=Courier_New:h14:cDEFAULT
	endif
endif

let mapleader=","
" Misc. mappings:
map <F8> :TlistToggle<cr>
vmap <F8> <esc>:TlistToggle<cr>
imap <F8> <esc>:TlistToggle<cr>
" line numbers
map <C-N> <Esc>:set<Space>nu!<CR>
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
"map <silent> zg zc<CR>zO<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"map <F5> :copen<CR>
"map <F6> :cprevious<CR>
"map <F7> :cnext<CR>
map <C-k> :cprevious<CR>
map <C-j> :cnext<CR>
map <C-h> :tprev<CR>
map <C-l> :tnext<CR>

" exception for python files (no space highlight)
autocmd! BufNewFile,BufRead *.py :highlight ExtraWhitespace ctermbg=darkgreen guibg=#571717
autocmd! BufNewFile,BufRead *.py :auto Syntax * syn match ExtraWhitespace /\s\+$\|^ \+\| \+\ze\t/
:highlight ExtraWhitespaceEOL ctermbg=red guibg=#A02020
:auto Syntax * syn match ExtraWhitespaceEOL /[ \t]\+$/

"function! AutoOpen()
"  if foldclosed(".") == line(".")
"    call feedkeys("zo")
"  endif
"endfunction

"au CursorMoved * call AutoOpen()
"au CursorMoved,CursorMovedI * call AutoOpen()
"nnoremap <silent> j :<c-u>call MoveUpDown('j', +1, 1)<cr>
"nnoremap <silent> k :<c-u>call MoveUpDown('k', -1, 1)<cr>
"nnoremap <silent> gj :<c-u>call MoveUpDown('gj', +1, 1)<cr>
"nnoremap <silent> gk :<c-u>call MoveUpDown('gk', -1, 1)<cr>
"nnoremap <silent> <c-d> :<c-u>call MoveUpDown("\<lt>c-d>", +1, '&l:scroll')<cr>
"nnoremap <silent> <c-u> :<c-u>call MoveUpDown("\<lt>c-u>", -1, '&l:scroll')<cr>
"nnoremap <silent> <c-f> :<c-u>call MoveUpDown("\<lt>c-f>", +1, 'winheight("%")')<cr>
"nnoremap <silent> <c-b> :<c-u>call MoveUpDown("\<lt>c-b>", -1, 'winheight("%")')<cr>
"function! MoveUpDown(cmd, dir, ndef)
"    let n = v:count == 0 ? eval(a:ndef) : v:count
"    let l = line('.') + a:dir * n
"    silent! execute l . 'foldopen!'
"    execute 'norm! ' . n . a:cmd
"endfunction

"autocmd CursorMoved,CursorMovedI * call OnCursorMove()
"function! OnCursorMove()
    "let l = line('.')
    "silent! foldopen
    "if exists('b:last_line') && l < b:last_line
        "norm! ]z
    "endif
    "let b:last_line = l
"endfunction
set clipboard+=unnamed
set paste
set go+=a
"This unsets the "last search pattern" register by hitting return 
nnoremap <CR> :noh<CR><CR>
