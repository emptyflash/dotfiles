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

filetype off

let mapleader = "\<Tab>"
let maplocalleader = "\\"

call plug#begin()

Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nanotech/jellybeans.vim'
Plug 'kien/ctrlp.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/matchit.zip'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wesQ3/vim-windowswap'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-markdown'
Plug 'elmcast/elm-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-salve'
Plug 'rust-lang/rust.vim'
Plug 'idris-hackers/idris-vim'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'vim-airline/vim-airline'
Plug 'slashmili/alchemist.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'tikhomirov/vim-glsl'
Plug 'tidalcycles/vim-tidal'
Plug 'alfredodeza/pytest.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'davidgranstrom/scnvim'

" avante.nvim setup
" Deps
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Optional deps
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'ravitemer/mcphub.nvim', { 'do': 'npm install -g mcp-hub@latest' }

Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

Plug 'NLKNguyen/papercolor-theme'


" All of your Plugs must be added before the following line
call plug#end()

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on
set background=dark
set termguicolors
colorscheme PaperColor

" Displays line numbers
set number

" Make tab insert 4 spaces instead
set tabstop=4 shiftwidth=4 expandtab

map <C-p> :CtrlP<CR>
noremap <C-t> :NERDTreeToggle<CR>

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'

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

" TODO: This is deprecated, should use source instead
" call deoplete#custom#set('buffer', 'min_pattern_length', 2)

" Enable window changing in terminal mode
:tnoremap <Leader>h <C-\><C-n><C-w>h
:tnoremap <Leader>j <C-\><C-n><C-w>j
:tnoremap <Leader>k <C-\><C-n><C-w>k
:tnoremap <Leader>l <C-\><C-n><C-w>l

" Enable esc and ctrl-e to enter normal mode in terminal
:tnoremap <Esc> <C-\><C-n>
:tnoremap <C-e> <C-\><C-n>

map <LocalLeader>t :vert new<CR>:term<CR>i

let g:syntastic_go_checkers = ['go', 'errcheck']

let g:tidal_no_mappings = 1
let g:tidal_target = "terminal"
"map  <c-s> <Plug>TidalParagraphSend
"map <c-h> :TidalHush<cr>

map <Leader><Leader>t :hi Normal guibg=NONE ctermbg=NONE<CR>

augroup NoUndoUlysses
    autocmd!
    autocmd BufWritePre *boxer-*.yaml setlocal noundofile
augroup END

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

let g:OmniSharp_server_use_mono = 1

autocmd BufNewFile,BufRead *.yin set syntax=haskell

let g:scnvim_no_mappings = 1
map <F4> <Plug>(scnvim-send-block)
map <F12> <Plug>(scnvim-hard-stop)
map <F3> <Plug>(scnvim-show-signature)	
map <F2> :SCNvimStart<CR>

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_typescriptreact_checkers = ['tsuquyomi']
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
map [[ <Plug>(TsuquyomiGoBack)
map ]] <Plug>(TsuquyomiDefinition)

lua << EOF
require('avante').setup({
    provider = "deepseek",
    providers = {
        deepseek = {
            __inherited_from = "openai",
            api_key_name = "DEEPSEEK_API_KEY",
            endpoint = "https://api.deepseek.com",
            model = "deepseek-v4-pro",
        },
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-sonnet-4-20250514",
        },
        moonshot = {
            endpoint = "https://api.moonshot.ai/v1",
            model = "kimi-k2-0905-preview",
        },
    },
    -- We should use the tools provided by mcphub
    disabled_tools = {
        "list_files",    -- Built-in file operations
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
    },
    mappings = {
        sidebar = {
            switch_windows = 'fuck you',
        },
    },
    rules = {
        global_dir = vim.fn.expand('~/.config/nvim/avante_prompts'),
        project_dir = '.avante/rules',
    },
    system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
        return {
            require("mcphub.extensions.avante").mcp_tool(),
        }
    end,
})

require("mcphub").setup({
    config = vim.fn.expand("~/.config/mcphub/servers.json"),
    extensions = {
        avante = {
            make_slash_commands = true, -- make /slash commands from MCP server prompts
        }
    }
})
EOF

set cb=unnamedplus
