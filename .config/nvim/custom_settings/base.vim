" not to create swap files
set noswapfile
" incremental search
set incsearch
" highlighting search text
set nohlsearch
" display filename
set title
" setting default tabstop to 4
set tabstop=4
" setting default shiftwidth to 4
set shiftwidth=4
" use space instead of tab
set expandtab
" smartindent
set smartindent
" display row number
set number
" always display status line
set laststatus=2
" emphasize cursor line
set cursorline
" yank to clipboard
set clipboard=unnamed,unnamedplus
" reload file if other client modify the file
set autoread
" interactive replace
set inccommand=split
" display tab and space
set list
" remember last edit position
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
