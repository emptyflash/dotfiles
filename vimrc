"A minimal vimrc for new vim users to start with.
"
" Referenced here: http://www.benorenstein.com/blog/your-first-vimrc-should-be-nearly-empty/

" Original Author:	 Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Last change:	         2012 Jan 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set shell=bash

let mapleader = "\<Tab>"
let maplocalleader = "\\"

" Stuff to setup Vundle
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'nanotech/jellybeans.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/matchit.zip'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'wesQ3/vim-windowswap'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-markdown'
Plugin 'elmcast/elm-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-salve'
Plugin 'rust-lang/rust.vim'
Plugin 'idris-hackers/idris-vim'
Plugin 'fatih/vim-go'
Plugin 'ensime/ensime-vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'vim-airline/vim-airline'
Plugin 'slashmili/alchemist.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'alfredodeza/pytest.vim'

" All of your Plugins must be added before the following line
call vundle#end()

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on
set background=dark
set termguicolors
colorscheme quantum

" Displays line numbers
set number

" Make tab insert 4 spaces instead
set tabstop=4 shiftwidth=4 expandtab

map <C-p> :CtrlP<CR>
map <C-t> :NERDTreeToggle<CR>

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" Map control + direction keys to move windows
map <C-J> <C-W>-
map <C-K> <C-W>+
map <C-H> <C-W><
map <C-L> <C-W>>

"
" " Map control shift + direction keys to resize windows
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>h <C-W>h
map <Leader>l <C-W>l

map <Leader>v :e $MYVIMRC<CR> 

map <Leader><Leader>n :tabnew<CR>
map <Leader><Leader>m :tabm 
map <Leader><Leader>l :tabn<CR>
map <Leader><Leader>h :tabp<CR>
map <Leader><Leader>j :tabn 
map <Leader><Leader>c :tabclose<CR>
map <Leader><Leader>1 :tabfirst<CR>
map <Leader><Leader>0 :tablast<CR>


" Control + C closes the current window
map <C-C> <C-W>c

" Map double comma to escape for convenience
imap <C-e> <Esc>

autocmd FileType elixir map <Leader>t :!mix test<CR>

autocmd FileType python map <Leader>t :Pytest file<CR>
autocmd FileType python map <Leader><Leader>t :Pytest function<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Recommended syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1 " We need this to display both JSHint and JSCS errors

" JSHint and JSCS checker per project settings
" autocmd FileType javascript let b:syntastic_checkers = glob('find */.jscsrc') != '' ? ['jscs', 'jshint'] : ['jshint']
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_javascript_jscs_args = "-c /vagrant/angular/.jscsrc"

" PEP 8
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_python_pep8_args='--ignore=E501'

" Scala
let g:syntastic_ignore_files = ['\m\.sbt$']
let g:syntastic_scala_checkers = ['fsc']
autocmd BufWritePost *.scala silent :EnTypeCheck
au FileType scala nnoremap <Leader>ec :EnTypeCheck<CR>
au FileType scala nnoremap <Leader>t :!sbt test<CR>
au FileType scala nnoremap <Leader>ed :EnDeclaration<CR>
au FileType scala nnoremap <Leader>evd :EnDeclarationSplit v<CR>
au FileType scala nnoremap <Leader>ehd :EnDeclarationSplit<CR>
au FileType scala nnoremap <Leader>er :!sbt ensimeConfig<CR>
au FileType scala nnoremap <Leader>ei :EnInstall<CR>
au FileType scala nnoremap <Leader>et :EnType<CR>
au FileType scala nnoremap <Leader>es :EnSearch 
au FileType scala nnoremap <Leader>esi :EnSuggestImport<CR>
au FileType scala nnoremap <Leader>eoi :EnOrganizeImports<CR>


" CtrlP settings
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=*/.git/**
set wildignore+=*/.vagrant/**
map <F5> :CtrlPClearAllCaches<CR>

" Set swap files to be stored in ~/tmp
set swapfile
set dir=~/tmp 

" Set to 256 color for ubunutu
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

let g:elm_format_autosave = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Enable Deoplete for auto completion
let g:deoplete#enable_at_startup = 1

" Disable mouse
set mouse=

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='quantum'

" set cursorcolumn
set cursorline

let g:alchemist_tag_disable = 1


" Enable window changing in terminal mode
:tnoremap <Leader>h <C-\><C-n><C-w>h
:tnoremap <Leader>j <C-\><C-n><C-w>j
:tnoremap <Leader>k <C-\><C-n><C-w>k
:tnoremap <Leader>l <C-\><C-n><C-w>l

" Enable esc and ctrl-e to enter normal mode in terminal
:tnoremap <Esc> <C-\><C-n>
:tnoremap <C-e> <C-\><C-n>

" Use + register as system clipboard
set clipboard+=unnamedplus

augroup NoUndoUlysses
    autocmd!
    autocmd BufWritePre *boxer-*.yaml setlocal noundofile
augroup END
