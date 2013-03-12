execute pathogen#infect()
set t_Co=256
set bg=dark
set tabstop=2
set ls=2            " allways show status line
set cmdheight=5
set formatoptions=qroct
set shiftwidth=2
set title
set nocompatible
set number
set nohlsearch 
set nobackup
set nowb
set noswapfile
set incsearch
set ignorecase
set smartcase
set ruler           " show the cursor position all the time
set cursorcolumn 
set cursorline 
set pastetoggle=<F2>
set autoindent
set copyindent
set numberwidth=4
set hidden
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set visualbell           " don't beep
set noerrorbells         " don't beep
"set scrolloff=10
set statusline=%F%m%r%h%w\ [%p%%]\ [%04l,%04v]\ (branch:\ %{GitBranchInfoTokens()[0]})
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set sidescrolloff=10
set nowrap
set iskeyword=@,48-57,_,$,192,255
syntax on 
syntax reset
" let schemes = split(globpath("~/.vim/colors/", "*.*"),"\n")
" exe 'so ' . schemes[localtime() % len(schemes)]
" unlet schemes

colorscheme darkspectrum
set ttyfast
filetype plugin on

let php_baselib = 1
let php_htmlInStrings = 0
let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

set clipboard=unnamed
" Wrap visual selectiosn with chars
:vnoremap ( "zdi^V(<C-R>z)<ESC>
:vnoremap { "zdi^V{<C-R>z}<ESC>
:vnoremap [ "zdi^V[<C-R>z]<ESC>
:vnoremap ' "zdi'<C-R>z'<ESC>
:vnoremap " "zdi^V"<C-R>z^V"<ESC>

" Nick wrote: Uncomment these lines to do syntax checking when you save
augroup Programming
" clear auto commands for this group
autocmd!
autocmd! BufWritePost *.php  !php -d display_errors=on -l <afile>
autocmd! BufWritePost *.sh   !bash -n <afile>
autocmd! BufWritePost *.pl   !perl -c <afile>
autocmd! BufWritePost *.perl !perl -c <afile>
autocmd! BufWritePost *.xml  !xmllint --noout <afile>
autocmd! BufWritePost *.scss !sass --trace -c <afile>
autocmd! BufRead *.scss set filetype=scss
autocmd! BufRead *.jade set filetype=jade
au! BufRead,BufNewFile *.js setlocal iskeyword+=: 
au! BufRead,BufNewFile *.js setlocal iskeyword+=- 
au! BufRead,BufNewFile *.css setlocal iskeyword+=- 
au! BufRead,BufNewFile *.scss setlocal iskeyword+=- 
"autocmd BufWritePost *.js  !node ~/.vim/scripts/jslint/fulljslint.js <afile>

" http://stackoverflow.com/questions/473478/vim-jslint
"set makeprg=cat\ %\ \\\|\ /usr/bin/js\ /home/nico/.vim/scripts/jslint/mylintrun.js\ %
"set errorformat=%f:%l:%c:%m

map <F1> <ESC>

map <S-up> <C-w>h
map <S-down> <C-w>j
map <S-left> <C-w>k
map <S-right> <C-w>l

map p P
vnoremap x "_x
vnoremap X "_X
vnoremap t a
map <D-r> <C-r>
inoremap <S-space> <space>

let mapleader=','
if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif

if &term == "xterm-color"
  fixdel
endif

set complete-=k complete+=k
" {{{ Autocompletion using the TAB key

" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
    let col = col('.') - 1
   if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" }}} Autocompletion using the TAB key

" GUI Settings {
if has("gui_running")
  set guioptions-=m " turn off menu bar
  set guioptions-=T " turn off toolbar
  set guifont=Inconsolata:h14 " My favorite font
  set guioptions=ce 
  "              ||
  "              |+-- use simple dialogs rather than pop-ups
  "              +  use GUI tabs, not console style tabs
  set mousehide " hide the mouse cursor when typing
	set fuoptions=maxhorz,maxvert
endif
" }
set mouse=a

let g:proj_window_width = 40

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Exist_OnlyWindow   = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window   = 1 " split to the right side of the screen
let Tlist_WinWidth           = 30
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format     = 1




map <S-R> :CtrlPCurWD<CR>

let g:miniBufExplTabWrap        = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplSplitBelow     = 0
let g:miniBufExplVSplit         = 30
let g:miniBufExplMaxWidth       = 0
" let g:miniBufExplForceSyntaxEnable = 1

let g:syntastic_warning_symbol = '✗'
let g:syntastic_error_symbol = '✗'

" CTRLP options
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window_reversed = 0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.log*

map <C-F> :execute "vimgrep /" . getline('.') . "/gj **/*.php **/*.js **/*.css **/*.tpl" <Bar> cw<CR>
map <S-F> :execute "vimgrep /" . expand('<cword>'). "/gj **/*.php **/*.js **/*.css **/*.tpl" <Bar> cw<CR>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <silent> <C-D> :execute "!diff.sh " . getline('.') <CR>

let g:CommandTMaxFiles=30000

autocmd! InsertEnter * highlight StatusLine cterm=bold ctermfg=222
autocmd! InsertEnter * highlight CursorColumn ctermbg=23
autocmd! InsertLeave * highlight StatusLine cterm=none ctermfg=231
autocmd! InsertLeave * highlight CursorColumn ctermbg=237


