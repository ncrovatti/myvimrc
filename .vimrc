set bg=dark
set tabstop=4
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
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set sidescrolloff=10
set nowrap
set iskeyword=@,48-57,_,-,$,:,192,255
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

" Bubble Single Line
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

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
autocmd BufWritePost *.php  !php -d display_errors=on -l <afile>
autocmd BufWritePost *.sh   !bash -n <afile>
autocmd BufWritePost *.pl   !perl -c <afile>
autocmd BufWritePost *.perl !perl -c <afile>
autocmd BufWritePost *.xml  !xmllint --noout <afile>
" autocmd BufWritePost *.js  !~/.vim/scripts/jslint/jslint <afile>

" http://stackoverflow.com/questions/473478/vim-jslint
set makeprg=cat\ %\ \\\|\ /usr/bin/js\ /home/nico/.vim/scripts/jslint/mylintrun.js\ %
set errorformat=%f:%l:%c:%m

map <F8> <ESC>:tabnew 
map <F1> <ESC>

map <S-up> <C-w>h
map <S-down> <C-w>j
map <S-left> <C-w>h
map <S-right> <C-w>l

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


function! CleverTab()
  if pumvisible()
    return "\<C-N>"
  endif
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-O>"
  else
    return "\<C-N>"
  endif
endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>

" }}} Autocompletion using the TAB key

" GUI Settings {
if has("gui_running")
  set guioptions-=m " turn off menu bar
  set guioptions-=T " turn off toolbar
  set guifont=Inconsolata\ Medium\ 12 " My favorite font
  set guioptions=ce 
  "              ||
  "              |+-- use simple dialogs rather than pop-ups
  "              +  use GUI tabs, not console style tabs
  set lines=60 " perfect size for me
  set mousehide " hide the mouse cursor when typing
endif
" }
cd /home/nico/workspace/pulse3
set mouse=a

let g:proj_window_width = 40
"let g:proj_window_increment = 50

let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_WinWidth = 5
let Tlist_Enable_Fold_Column = 0 

map <S-R> :CommandT<CR>
nmap <silent> <F3> <Plug>ToggleProject
nnoremap <silent> <F4> :TlistToggle<CR>

let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplSplitBelow = 0
let g:miniBufExplVSplit = 35
let g:miniBufExplMaxWidth = 0


map <F5> :execute "vimgrep /" . expand("<cword>") . "/gj **/*.php **/*.js **/*.css **/*.tpl" <Bar> cw<CR>

let g:CommandTMaxFiles=30000
