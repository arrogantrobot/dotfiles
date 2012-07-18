" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ruler           " Show the line and column numbers of the cursor
"set ignorecase      " Do case insensitive matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden          " Use hidden buffers
set nohlsearch      " don't highlight last search matches
set cmdheight=2     " 2 lines for messages fewer 'Press Return' messages
set showbreak=+     " prefix wrapped lines with a + sign
set wildmenu        " use a menu for wildcard completion

set background=dark
set bg=dark
if &t_Co > 2 || has("gui_running")
    "colo darkblue

    " turn on syntax highlighting
    if has("syntax")
        syntax on

        " some settings for specific syntax files
        let c_gnu = 1
        let c_syntax_for_h = 1

        let perl_include_pod = 1
        let perl_want_scope_in_variables = 1
        let perl_extended_vars = 1
        "let perl_fold = 0
        "let perl_fold_blocks = 1
        let perl_include_pod = 1
        let perl_want_scope_in_variables = 1
        let perl_extended_vars = 1
        let perl_string_as_statement = 1
        "set fdc=3
    endif
endif
set t_Co=256

" set up a comment and uncomment command
:command Comment 'a,'b s/^/#/
:command Uncomment 'a,'b s/^#//

" setup a shift and unshift
:command Shift 'a,'b s/^/     /
:command Unshift 'a,'b s/^     //

" from my old file...
set showmode
set visualbell
"set tabstop=4
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
"set number
set noautoindent

"set list
set listchars=eol:_,tab:>-

autocmd BufRead *.t set syntax=perl
"set term=builtin_ansi
"set term=xterm-color
"set autoindent
set nohls
"set bg=dark
set bg=light
"autocmd BufNewFile,BufRead *.p? compiler perl
"if &t_Co > 1
"    set background=light 
"    syntax enable
"endif

" vim 7.x tab shortcuts
" http://www.vim.org/tips/tip.php?tip_id=1347
map <C-t> :tabnew<CR>   " CTRL + t -- opens a new tab
" map <C-h> :tabp<CR>  " ALT + h -- moves one tab to the left
" map<C-l> :tabn<CR>  " ALT + l -- moves one tab to the right
 map <C-left> :tabp<CR>  " CTRL + left arrow -- moves one tab to the left
 map<C-right> :tabn<CR>  " CTRL + right arrow -- moves one tab to the right

" turn on some folding attributes
" let perl_fold = 0
" let foldlevel = 1
" let perl_fold_blocks = 1
"
setlocal makeprg=perl\ -c\ %
:set statusline=%{GitBranchInfoString()}



colorscheme manxome



filetype on  " Automatically detect file types.
set nocompatible  " no vi compatibility.

" Add recently accessed projects menu (project plugin)
set viminfo^=\!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

 set laststatus=2
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

let g:Powerline_symbols = 'fancy'
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
"set guifont=ProggyCleanSZBP\ for\ Powerline\ 13

if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

" mapping to make movements operate on 1 screen line in wrap mode
"function! ScreenMovement(movement)
"  if &wrap && b:gmove == 'yes'
"    return "g" . a:movement
"  else
"    return a:movement
"  endif
"endfunction
"onoremap <silent> <expr> j ScreenMovement("j")
"onoremap <silent> <expr> k ScreenMovement("k")
"onoremap <silent> <expr> 0 ScreenMovement("0")
"onoremap <silent> <expr> ^ ScreenMovement("^")
"onoremap <silent> <expr> $ ScreenMovement("$")
"nnoremap <silent> <expr> j ScreenMovement("j")
"nnoremap <silent> <expr> k ScreenMovement("k")
"nnoremap <silent> <expr> 0 ScreenMovement("0")
"nnoremap <silent> <expr> ^ ScreenMovement("^")
"nnoremap <silent> <expr> $ ScreenMovement("$")
"vnoremap <silent> <expr> j ScreenMovement("j")
"vnoremap <silent> <expr> k ScreenMovement("k")
"vnoremap <silent> <expr> 0 ScreenMovement("0")
"vnoremap <silent> <expr> ^ ScreenMovement("^")
"vnoremap <silent> <expr> $ ScreenMovement("$")
"vnoremap <silent> <expr> j ScreenMovement("j")


nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk



" toggle showbreak
function! TYShowBreak()
  if &showbreak == ''
    set showbreak=>
  else
    set showbreak=
  endif
endfunction
let b:gmove = "yes"
function! TYToggleBreakMove()
  if exists("b:gmove") && b:gmove == "yes"
    let b:gmove = "no"
  else
    let b:gmove = "yes"
  endif
endfunction
nmap  <expr> ,b  TYShowBreak()
nmap  <expr> ,bb  TYToggleBreakMove()
set pastetoggle=<F2>

