call plug#begin('~/.vim/plugged')

Plug 'johnstef99/arm-syntax-vim'
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
Plug 'vim-scripts/BufOnly.vim'

call plug#end()

let mapleader = ' '
let maplocalleader = '\'
set ignorecase
set mouse=a
set nowrap
set relativenumber
set number
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set hidden
set updatetime=300
set signcolumn=yes
set noswapfile
set expandtab
silent! colorscheme  gruvbox
syntax enable
set termguicolors
set background=dark
hi Normal guibg=NONE ctermbg=NONE

nmap <leader>e :NERDTreeToggle<CR>
