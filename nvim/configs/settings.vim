" Set theme
colorscheme gruvbox
set background=dark

" Transparent background like terminal
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" ============================================================================================================
let mapleader =' '

set encoding=UTF-8
 
" Sync to OS Clipboard
set clipboard=unnamedplus

" Line number
set relativenumber
set number 

set backspace=2

set tabstop=2
set noshowmode
set splitbelow
set splitright
set cursorline
set showtabline=2
set shiftwidth=2
set expandtab 
set autoindent

" ============================================================================================================
" Mapping keys

inoremap jk <esc>
nnoremap J 5j
nnoremap K 5k
nnoremap j gj
nnoremap k gk
nnoremap <leader>j J

" remaping delete + cut
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nmap <leader>tn :tabnew<CR>
nmap <leader>tt :tabnext<CR>
nmap <leader>tp :tabprev<CR>
nmap <leader>to :tabo<CR>
nmap <leader>/ :noh<CR>
inoremap <C-s> <esc>:w<CR>a
nnoremap <C-s> :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader><tab> =ip

" Split Window
nnoremap <silent><leader>w :vsplit<CR>
nnoremap <silent><leader>W :vplit<CR> 
nnoremap <silent><leader>h ^
nnoremap <silent><leader>l $

" Vim floaterm
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>
tnoremap   <silent>   <C-/>   <C-\><C-n>
nnoremap   <silent>   <leader>tr   :FloatermNew! cd %:p:h<CR>

" Tab visual mode
vnoremap <tab> >gv
vnoremap <S-tab> <gv

vnoremap <m-j> :m '>+1<CR>gv=gv
vnoremap <m-k> :m '<-2<CR>gv=gv

" fzf
nnoremap <silent><leader>f :Files<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>r :Rg<CR>
nnoremap <silent><leader>hi :History<CR>
nnoremap <silent><C-d> /<C-R><C-W><CR>

nnoremap <leader>ss :so %<CR>
nnoremap f H:call EasyMotion#WB(0, 0)<CR>

