" https://blog.elvessousa.com.br/en/post/vim-part-3
" https://dev.to/enrsaid/pt-br-neovim-para-typescript-1co7
" https://dev.to/rishitpandey/setting-up-neovim-like-vscode-j8h
" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
" set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

"Start direcly in edit mode
startinsert

"Nano shutcurt"
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :qa!<CR>
nnoremap <C-o> :w<CR>
nnoremap <C-x> :wq<CR>

filetype plugin indent on
syntax on

set t_Co=256

" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
	set termguicolors
else
	if $TERM !=? 'xterm-256color'
		set termguicolors
	endif
endif

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

call plug#begin('~/.vim/plugged')
" Code completetion javascript and typescript"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mattn/emmet-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Utilities
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'

" Git
Plug 'airblade/vim-gitgutter'

" Go"
Plug 'fatih/vim-go', { 'tag': '*' }

Plug 'elvessousa/sobrio'
call plug#end()

" Coc setup"
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-lists',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-prettier'
  \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
