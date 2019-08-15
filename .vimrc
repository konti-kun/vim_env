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
nnoremap + <C-a>
nnoremap - <C-x>
autocmd filetype xml :set sw=2 sts=2 ts=2 et
autocmd filetype html :set sw=2 sts=2 ts=2 et
autocmd filetype js :set sw=2 sts=2 ts=2 et
autocmd filetype ruby :set sw=2 sts=2 ts=2 et
autocmd filetype yaml :set sw=2 sts=2 ts=2 et 
autocmd filetype scss :set sw=2 sts=2 ts=2 et 

inoremap jj <Esc>
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" RSpec.vim mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

set diffopt+=vertical

if &compatible
  set nocompatibel
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein/')
	call dein#begin('~/.vim/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('thinca/vim-quickrun')
	call dein#add('tpope/vim-fugitive')
	call dein#add('vim-syntastic/syntastic')
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
	call dein#end()
	call dein#save_state()
endif

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

if dein#tap('vim-syntastic/syntastic')
	let g:syntastic_mode_map = { 'mode': 'passive','active_filetypes': ['ruby'] }
	let g:syntastic_ruby_checkers = ['rubocop']
endif
if dein#tap('thoughtbot/vim-rspec')
	let g:rspec_command = "!bin/rspec {spec}"
endif

if dein#tap('scrooloose/nerdtree')
endif

if dein#tap('thinca/vim-ref')
	let g:ref_open = 'vsplit'
	let g:ref_refe_cmd = "rurema"
	let g:ref_refe_version = 2
	nnoremap ,rr :<C-U>Ref refe<Space>
endif

