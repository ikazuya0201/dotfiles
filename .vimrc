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

    " pug
    NeoBundle 'digitaltoad/vim-pug'

    " go用のパッケージが色々入ったやつ
    NeoBundle 'fatih/vim-go'

    NeoBundle 'nsf/gocode'

    NeoBundle 'cespare/vim-toml'

    if has('lua')
        " コードの補完
        NeoBundle 'Shougo/neocomplete.vim'
        " スニペットの補完機能
        NeoBundle 'Shougo/neosnippet'

    endif


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
" ファイル名を常に表示
set laststatus=2
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


"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
if neobundle#is_installed('neocomplete.vim')
    " Vim起動時にneocompleteを有効にする
    let g:neocomplete#enable_at_startup = 1
    " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
    let g:neocomplete#enable_smart_case = 1
    " 3文字以上の単語に対して補完を有効にする
    let g:neocomplete#min_keyword_length = 3
    " 区切り文字まで補完する
    let g:neocomplete#enable_auto_delimiter = 1
    " 1文字目の入力から補完のポップアップを表示
    let g:neocomplete#auto_completion_start_length = 1
    " バックスペースで補完のポップアップを閉じる
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    " snippet用のディレクトリを指定
    let g:neosnippet#snippets_directory = '$HOME/.vim/snippets/'

    " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif

"-----------------------------------
" backspaceなどの設定
"-----------------------------------

"viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible
""カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
"" indent  : 行頭の空白
" eol     : 改行
" " start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
"  -----------------------------------
"  拡張インデントの設定
"  -----------------------------------
if has("autocmd")
    filetype plugin on
    filetype indent on

    autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et
    autocmd FileType pug setlocal sw=2 sts=2 ts=2 et
    autocmd FileType amber setlocal sw=2 sts=2 ts=2 et
    autocmd FileType html setlocal sw=2 sts=2 ts=2 et
endif
