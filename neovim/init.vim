set exrc
syntax on

set guicursor=
set noerrorbells
set scrolloff=8
set number
set nowrap
set smartcase
set noswapfile
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohls
set noic
set linespace=14
set guifont=Fira_Code:h17
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set signcolumn=yes
set colorcolumn=80
set clipboard+=unnamedplus

highlight ColorColumn ctermbg=0 guibg=ligthgrey

"Menu
set wildmode=longest,list,full
set wildmenu
"Ignore files
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/phpactor'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make'}
Plug 'fannheyward/telescope-coc.nvim'

Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'ThePrimeagen/harpoon'

" Devicons
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

set termguicolors
"let ayucolor="dark"
"colorscheme ayu 
colorscheme gruvbox
"set background=dark
let g:gruvbox_contrast_dark='hard'

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>ps :Sex<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
"nnoremap <C-p> :GFiles<CR>
"nnoremap <A-r> :BTags<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>pcx :w !xclip -selection clipboard<CR>
nnoremap <leader>gf :CocSearch 
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nmap <leader>gd <Plug>(coc-definition) "Jump to definition
nmap <leader>gr <Plug>(coc-references) "

"Git Remap
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" ESC
inoremap <C-c> <esc>

" Harpoon
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <A-r> <cmd>Telescope coc document_symbols<cr>
lua require("juliocarreno")
