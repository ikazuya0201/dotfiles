" dein initialization
if &compatible
    set nocompatible
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/nvim/dein')
    call dein#begin('~/.config/nvim/dein')
    call dein#load_toml('~/.config/nvim/dein/config/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein/config/dein_lazy.toml', {'lazy': 1})
    call dein#load_toml('~/.config/nvim/dein/config/dein_file.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif

" load custom settings
runtime! ./custom_settings/*.vim
runtime! ./custom_settings/*.nvim
runtime! ./custom_settings/plugins/*.vim
runtime! ./custom_settings/plugins/*.nvim

filetype plugin indent on
syntax enable
