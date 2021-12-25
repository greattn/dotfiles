"erdtree 
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

" Exit vim when only nerdtree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:sol = {
			\"gui": {
				\"base03": "#002b36",
				\"base02": "#073642",
				\"base01": "#586e75",
				\"base00": "#657b83",
				\"base0": "#839496",
				\"base1": "#93a1a1",
				\"base2": "#eee8d5",
				\"base3": "#fdf6e3",
				\"yellow": "#b58900",
				\"orange": "#cb4b16",
				\"red": "#dc322f",
				\"magenta": "#d33682",
				\"violet": "#6c71c4",
				\"blue": "#268bd2",
				\"cyan": "#2aa198",
				\"green": "#719e07"
			\},
			\"cterm": {
				\"base03": 8,
				\"base02": 0,
				\"base01": 10,
				\"base00": 11,
				\"base0": 12,
				\"base1": 14,
				\"base2": 7,
				\"base3": 15,
				\"yellow": 3,
				\"orange": 9,
				\"red": 1,
				\"magenta": 5,
				\"violet": 13,
				\"blue": 4,
				\"cyan": 6,
				\"green": 2
			\}
		\}

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
		let g:DevIconsEnableFoldersOpenClose = 1
		if exists("g:loaded_webdevicons")
			call webdevicons#refresh()
		endif
		augroup devicons
			autocmd!
			autocmd FileType nerdtree setlocal nolist
			autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
			autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
			autocmd FileType nerdtree setlocal conceallevel=3
			autocmd FileType nerdtree setlocal concealcursor=nvic
		augroup END
		function! DeviconsColors(config)
			let colors = keys(a:config)
			augroup devicons_colors
				autocmd!
				for color in colors
					if color == 'normal'
						exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
							\ 'endif'
					elseif color == 'emphasize'
						exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
							\ 'endif'
					else
						exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
					endif
					exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
				endfor
			augroup END
		endfunction
		let g:devicons_colors = {
			\'normal': ['', '', '', '', ''],
			\'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
			\'yellow': ['', '', ''],
			\'orange': ['', '', '', 'λ', '', ''],
			\'red': ['', '', '', '', '', '', '', '', ''],
			\'magenta': [''],
			\'violet': ['', '', '', ''],
			\'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
			\'cyan': ['', '', '', ''],
			\'green': ['', '', '', '']
		\}
		call DeviconsColors(g:devicons_colors)

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
" ===============================================================================
" Vim Airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Display color hexokinase
set termguicolors
let g:Hexokinase_highlighters = ['backgroundfull'] 
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'

" Search file fzf
let $FZF_DEFAULT_COMMAND = "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"


" Vim floaterm 
hi Floaterm guibg=#282828
hi FloatermBorder guibg=#3C3836 guifg=#fbf1c7
hi FloatermNC guibg=gray
let g:floaterm_position= 'topright'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.5
let g:floaterm_height=0.6
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" Autoclose Tags
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.hbs'
" <Link></Link>  & <link></link> interger 0 | 1
let g:closetag_emptyTags_caseSensitive = 1
"================================================================================
"
" Coc
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Emmet


