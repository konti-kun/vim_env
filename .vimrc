set nocompatible
colorscheme molokai
syntax on
set clipboard=unnamed,autoselect
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
let mapleader = "\<Space>"
set ignorecase
set smartcase
set incsearch
set hlsearch
set shiftround
set virtualedit=all
set hidden
set backspace=indent,eol,start
set background=dark
set nowritebackup
set nobackup
set noswapfile
autocmd FileType vue syntax sync fromstart

set number
set wrap
set textwidth=0
set colorcolumn=80
autocmd BufNewFile,BufRead *.inc set filetype rst
set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]
set laststatus=2
nnoremap Y y$
set display=lastline
set pumheight=10
set showmatch
set matchtime=1
nmap bb :ls<CR>:buf
nnoremap + <C-a>
nnoremap - <C-x>
filetype plugin on
filetype indent on
autocmd filetype xml setlocal sw=2 sts=2 ts=2 et
autocmd filetype html setlocal sw=2 sts=2 ts=2 et
autocmd filetype javascript setlocal sw=2 sts=2 ts=2 et
autocmd filetype ruby setlocal sw=2 sts=2 ts=2 et
autocmd filetype yaml setlocal sw=2 sts=2 ts=2 et
autocmd filetype scss setlocal sw=2 sts=2 ts=2 et
autocmd filetype scss setlocal sw=2 sts=2 ts=2 et
let &errorformat = '%[ #]%#%f:%l:%m'
autocmd BufWritePre * :%s/\s\+$//ge

inoremap jj <Esc>
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" RSpec.vim mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set diffopt=vertical

if &compatible
  set nocompatibel
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein/')
	call dein#begin('~/.vim/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('thinca/vim-quickrun')
	call dein#add('tpope/vim-fugitive')
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	call dein#add('vim-ruby/vim-ruby')
	call dein#add('tpope/vim-rails')
	call dein#add('thoughtbot/vim-rspec')
	call dein#add('tpope/vim-rbenv')
	call dein#add('tpope/vim-bundler')
	call dein#add('tpope/vim-endwise')
	call dein#add('szw/vim-tags')
	call dein#add('scrooloose/nerdtree')
	call dein#add('thinca/vim-ref')
	call dein#add('yuku-t/vim-ref-ri')
	call dein#add('bronson/vim-trailing-whitespace')
	call dein#add('neoclide/coc.nvim',{'rev':'release'})
	call dein#add('leafOfTree/vim-vue-plugin')
	call dein#add('w0rp/ale')
	call dein#add('leafgarland/typescript-vim')
	call dein#end()
	call dein#save_state()
endif
let g:coc_global_extensions = ['coc-solargraph']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif
if dein#tap("vim-gufitive")
	set diffopt+=vertical
endif

if dein#tap('Shougo/deoplete.nvim')
	let g:deoplete#enable_at_startup = 1
endif
let g:ale_fixers = {'ruby': ['rubocop'],'typescript': ['tsserver'] }

let g:rspec_command = "!bin/rspec {spec}"

if dein#tap('scrooloose/nerdtree')
endif

if dein#tap('thinca/vim-ref')
	let g:ref_open = 'vsplit'
	let g:ref_refe_cmd = "rurema"
	let g:ref_refe_version = 2
	nnoremap ,rr :<C-U>Ref refe<Space>
endif

