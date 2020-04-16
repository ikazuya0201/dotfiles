if has("autocmd")
    filetype plugin on
    filetype indent on

    autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et
    autocmd FileType pug setlocal sw=2 sts=2 ts=2 et
    autocmd FileType amber setlocal sw=2 sts=2 ts=2 et
    autocmd FileType html setlocal sw=2 sts=2 ts=2 et
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
endif
