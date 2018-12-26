" ----------------------------
" NeoBundle
" ----------------------------
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

  NeoBundleFetch 'Shougo/neobundle.vim'

	" vimgrepの結果に対して一括置換
	NeoBundle 'thinca/vim-qfreplace'

	" IDEみたいなサイドメニュー
	NeoBundle 'scrooloose/nerdtree'

	" yamlのシンタックスハイライト等
	NeoBundle 'chase/vim-ansible-yaml'

	" コメントアウトが楽に
	NeoBundle 'tpope/vim-commentary'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" ---------------------------------------
" 編集に関する設定
" ---------------------------------------
"  titleを表示
set title
" タブの画面上での幅
set tabstop=4
" 自動インデントでずれる幅
set shiftwidth=4
" タブの代わりに空白文字を指定する
set expandtab
" 新しい行をいい感じにインデントする
set smartindent
" 行番号を表示
set number
" シンタックスハイライトを有効に
syntax on

" --------------------------------------
"  NERDTreeの設定
" --------------------------------------

" dotfileの表示(1: 表示)
let NERDTreeShowHidden=1
" ブックマークを表示(1: 表示)
let g:NERDTreeShowBookmarks=1
" 表示非表示の切り替え(<C-n>で開く)
nmap <silent> <C-n>      :NERDTreeToggle<CR>


" -------------------------------------
"  color schemeの設定
" -------------------------------------

colorscheme tender
set t_Co=256

"  -----------------------------------
"  utf-8
"  -----------------------------------
set encoding=utf-8
set fileencoding=utf-8

"  -----------------------------------
"  clipboard
"  -----------------------------------
set clipboard+=unnamed
