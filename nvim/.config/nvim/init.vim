set path+=**
set wildignore+=*_build/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin("~/.local/share/nvim/site/autoload")

" GROOOOOOOOOVVVVVVYYYY
Plug 'gruvbox-community/gruvbox'

" telescope requirements
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'

call plug#end()

lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.jsx,*.tsx set filetype=typescriptreact
augroup END

let mapleader = ' ' 

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <leader>y "+y
vnoremap <leader>y "+y