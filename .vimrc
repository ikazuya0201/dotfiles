" ----------------------------
" dein.vim
" ----------------------------

if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
	call dein#begin('$HOME/.cache/dein')

	call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

	call dein#add('Shougo/deoplete.nvim')

    " colorscheme
    call dein#add('jacoborus/tender.vim')

	" vimgrepの結果に対して一括置換
	call dein#add('thinca/vim-qfreplace')

	" IDEみたいなサイドメニュー
	call dein#add('scrooloose/nerdtree')

	" コメントアウトが楽に
	call dein#add('tpope/vim-commentary')

    " accelerated-jk
    call dein#add('rhysd/accelerated-jk') 
    " 強いステータスバー
    call dein#add('vim-airline/vim-airline')

    " gitの差分表示
    call dein#add('airblade/vim-gitgutter')

    " tex
    call dein#add('lervag/vimtex')

    " matlab
    call dein#add('lazywei/vim-matlab')

    " ヤンク履歴
    call dein#add('vim-scripts/YankRing.vim')

    " easymotion
    call dein#add('Lokaltog/vim-easymotion')

    " git
    call dein#add('tpope/vim-fugitive')

    "vim-lsp
    call dein#add('prabirshrestha/async.vim')
    call dein#add('prabirshrestha/vim-lsp')

    if has('lua')
        " コードの補完
        call dein#add('Shougo/neocomplete.vim')
        " スニペットの補完機能
        call dein#add('Shougo/neosnippet')
    endif

	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif

    " file種類別のプラグイン-----------------------
	" yamlのシンタックスハイライト等
	call dein#add('chase/vim-ansible-yaml')

    " pug
    call dein#add('digitaltoad/vim-pug')

    " tomlのシンタックスハイライト
    call dein#add('cespare/vim-toml')

    " rust用のプラグイン
    " call dein#add('rust-lang/rust.vim')
    " call dein#add('racer-rust/vim-racer')

    " go
    call dein#add('fatih/vim-go')

    " python
    call dein#add('hdima/python-syntax')

    "----------------------------------------------

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

" ---------------------------------------
" 編集に関する設定
" ---------------------------------------
" Do not create swap files
set noswapfile
" incremental search
set incsearch
" highlighting search text
set nohlsearch
" titleを表示
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
" カーソル行を強調
set cursorline
" yank to clipboard
set clipboard=unnamed,unnamedplus
" 編集再開時に前と同じ箇所から再開
au BufWritePost * mkview
au BufReadPost * loadview
" シンタックスハイライトを有効に
syntax on

" ---------------------------------------
" remap
" ---------------------------------------
" insert modeやcommand modeでもhjklでカーソル移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
" ; => :
nnoremap ; :

" ---------------------------------------
" vim-easymotion
" ---------------------------------------
let mapleader = "\<Space>"
let g:EasyMotion_do_mapping=0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1

" --------------------------------------
"  NERDTreeの設定
" --------------------------------------
" dotfileの表示(1: 表示)
let NERDTreeShowHidden=1 " ブックマークを表示(1: 表示)
let g:NERDTreeShowBookmarks=1
" 表示非表示の切り替え(<C-x>で開く)
nmap <silent> <C-x>      :NERDTreeToggle<CR>

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
" Avoid automatic indentation
autocmd InsertLeave *
    \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
    \ if &l:diff | diffupdate | endif


"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
if dein#tap('neocomplete.vim')
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
" rustの設定
"-----------------------------------
if dein#tap('rust.vim')
    let g:rustfmt_autosave = 1
    let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
endif

set hidden
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let g:racer_experimental_completer = 1

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
"  filetypeの変更
"  -----------------------------------
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.rs set filetype=rust
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

"  -----------------------------------
"  Configurations for Language Server
"  -----------------------------------
set hidden

let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ }

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
nnoremap <silent> <Space>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Space>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <Space>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <Space>lf :call LanguageClient_textDocument_formatting()<CR>
