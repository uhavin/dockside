call plug#begin(stdpath('data') . '/plugged')
"""" Looks
"""""" Color schemes aaw yeah
Plug 'sonph/onehalf', {'rtp': 'vim/'} " Alternative take on one
Plug 'ayu-theme/ayu-vim'  " Great dark theme (imho)
Plug 'cormacrelf/vim-colors-github'  " another nice light theme
Plug 'chriskempson/base16-vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

"""""" Other prettifiers
Plug 'itchyny/lightline.vim'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'frazrepo/vim-rainbow'
Plug 'Yggdroot/indentLine'  " Indent guides

" Usability

" telescope dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope for finding stuff
Plug 'nvim-telescope/telescope.nvim'

Plug 'wincent/ferret'  "Use :Ack for search
Plug 'junegunn/vim-peekaboo' " Preview registers
Plug 'simeji/winresizer'  " use <Leader>w to resize/move/focus windows
Plug 'simnalamburt/vim-mundo'  " the undo tree

Plug 'preservim/nerdtree' ", { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'

Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'Raimondi/delimitMate'
" Plug 'cohama/lexima.vim'
Plug 'andymass/vim-matchup'
Plug 'vim-scripts/python_match.vim'

" Programming
"" autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'

" testing, debugging
Plug 'vim-test/vim-test'
Plug 'puremourning/vimspector'

"" Tags
Plug 'ludovicchabant/vim-gutentags', {'for': ['py', 'js']}
Plug 'preservim/tagbar'
Plug 'liuchengxu/vista.vim'

" Formatting
Plug 'sbdchd/neoformat'

" Python
Plug 'fisadev/vim-isort'
Plug 'psf/black', { 'branch': 'stable', 'for': 'python'}
Plug 'alfredodeza/coveragepy.vim', {'for': 'python'}

"" Git
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
call plug#end()
