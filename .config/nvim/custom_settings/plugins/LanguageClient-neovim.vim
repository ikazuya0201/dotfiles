set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <silent> gi :call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gn :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<CR>
