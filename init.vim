" _____  _    _  ____  _   _  _____   _______ _____            _   _ 
"|  __ \| |  | |/ __ \| \ | |/ ____| |__   __|  __ \     /\   | \ | |
"| |__) | |__| | |  | |  \| | |  __     | |  | |__) |   /  \  |  \| |
"|  ___/|  __  | |  | | . ` | | |_ |    | |  |  _  /   / /\ \ | . ` |
"| |    | |  | | |__| | |\  | |__| |    | |  | | \ \  / ____ \| |\  |
"|_|    |_|  |_|\____/|_| \_|\_____|    |_|  |_|  \_\/_/    \_\_| \_|
"
"
" Neovim personal setting of PhongTran <3...

call plug#begin('~/.config/nvim/plugged')
" Theme
Plug 'morhetz/gruvbox'

" File manager
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons' " Need install nerd font

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Search file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vim-easymotion
Plug 'easymotion/vim-easymotion'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'tpope/vim-fugitive'

"Other
Plug 'alvan/vim-closetag'
Plug 'voldikss/vim-floaterm'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'

call plug#end()

" Exec setting files
let nvim_setting_dir = '~/.config/nvim/configs/'
execute 'source '.nvim_setting_dir.'settings.vim'
execute 'source '.nvim_setting_dir.'pluginSettings.vim'
