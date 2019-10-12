let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 0
let g:deoplete#max_list = 20

" determine completion by enter
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : 
    \ pumvisible() ? 
    \ "<C-y>" : "<CR>"

" select completion by tab
imap <expr><tab> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
