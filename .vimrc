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
" 編集に関する設定:
" ---------------------------------------
" タブの画面上での幅
set tabstop=4
" 自動インデントでずれる幅
set shiftwidth=4
" タブの代わりに空白文字を指定する
set expandtab
" 新しい行のインデントを現在行と同じにする
set smartindent
" 行番号を表示
set number
" シンタックスハイライトを有効に
syntax on

" --------------------------------------
"  NERDTreeの設定
" --------------------------------------

" .ファイルの表示（1: 表示）
let NERDTreeShowHidden=1
" ブックマークを表示 (1:表示)
let g:NERDTreeShowBookmarks=1
" 表示・非表示切り替え(<Cmd-n>で開く)
nmap <silent> <C-n>      :NERDTreeToggle<CR>


" -------------------------------------
"  color schemeの設定
" -------------------------------------

colorscheme tender
