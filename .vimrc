set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
let mapleader = "\<Space>"
set ignorecase
set smartcase 
set incsearch 
set hlsearch

set shiftround
set virtualedit=all
set hidden
set backspace=indent,eol,start
colorscheme molokai 
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set nowritebackup
set nobackup
set noswapfile

set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れるx

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>


" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" fugitive.vimを横分割に
set diffopt+=vertical

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundleLazy "thinca/vim-quickrun", {
      \ "autoload": {
      \   "mappings": [['nxo', '<Plug>(quickrun)']]
      \ }}
nmap <Leader>r <Plug>(quickrun)
vnoremap <C-r> :QuickRun
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
  let g:quickrun_config = {
      \ "*": {"split": "vertical"},
      \ }
endfunction
NeoBundle "tpope/vim-fugitive"
NeoBundleLazy "gregsexton/gitv", {
      \ "depends": ["tpope/vim-fugitive"],
      \ "autoload": {
      \   "commands": ["Gitv"],
      \ }}
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
NeoBundle "nvie/vim-flake8"
nnoremap  <leader>l :call Flake8()
NeoBundle "nathanaelkane/vim-indent-guides"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
" Vimで正しくvirtualenvを処理できるようにする
NeoBundleLazy "miyakogi/vim-virtualenv", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
autocmd FileType python setlocal completeopt-=preview 
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>R<CR>'
endfunction
call neobundle#end()

filetype plugin indent on
NeoBundleCheck

