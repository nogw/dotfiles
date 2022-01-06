call plug#begin('~/.config/nvim/plugged')
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/taglist.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'

" rust
Plug 'rust-lang/rust.vim'

" ocaml / reason
Plug 'rgrinberg/vim-ocaml', {'for': ['ocaml', 'opam', 'dune'] }
Plug 'jordwalke/vim-reasonml', {'for': ['reason', 'ocaml'] }
Plug 'reasonml-editor/vim-reason-plus'

" typescript 
Plug 'tasn/vim-tsx'

" test
Plug '/mnt/c/Users/nogueira/Desktop/vim'
call plug#end()

let g:airline#extensions#whitespace#enabled = 0
let g:airline_highlighting_cache = 1

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = ' '

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

let g:reasonml_project_airline = 1
let g:reasonml_syntastic_airline = 1
let g:reasonml_clean_project_airline = 1
let g:syntastic_reason = 1
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_reason_checkers = ['merlin']
let g:airline#extensions#esy#enabled = 1
let g:airline#extensions#reason#enabled = 1

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/bin/python3'

let g:opamshare = substitute(system('opam var share'),'\n$','','''')

execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute 'set rtp^=' . g:opamshare . '/ocp-indent/vim'

let g:syntastic_ocaml_checkers = ['merlin']

autocmd FileType reason silent! call merlin#Register()
autocmd FileType reason nnoremap <silent> gf :ReasonPrettyPrint<CR>
autocmd FileType ocaml,reason nnoremap <silent> <localleader>d :MerlinDocument<CR>

let g:indentLine_char = '│'
let g:neoformat_ocaml_ocamlformat = {
  \ 'exe': 'ocamlformat',
  \ 'args': ['--name', '"%:p"', '-'],
  \ 'no_append': 1,
  \ 'stdin': 1,
  \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']

syntax on
set termguicolors
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set guifont=Iosevka\ 20
set guioptions-=m
set guioptions-=T
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set autochdir
set cinoptions=l1
set nowrap

" ALE config
nmap <silent> <C-e> <Plug>(ale_next_wrap)
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" nerdtree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
