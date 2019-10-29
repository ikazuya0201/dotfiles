set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['pyls'],
    \ 'cpp': ['/usr/local/Cellar/llvm/9.0.0/Toolchains/LLVM9.0.0.xctoolchain/usr/bin/clangd'],
    \ 'c': ['/usr/local/Cellar/llvm/9.0.0/Toolchains/LLVM9.0.0.xctoolchain/usr/bin/clangd'],
    \ }

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
nnoremap <silent> gi :call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gn :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<CR>
