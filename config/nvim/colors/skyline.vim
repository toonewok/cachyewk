set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "skyline"

" Define highlight groups
hi Normal       guifg=#bec1bf guibg=none ctermfg=252 ctermbg=none
hi Comment      guifg=#535659 gui=italic
hi Keyword      guifg=#0fb6ca gui=bold
hi Question guifg=#1e6f85 guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#4fd890 guibg=NONE gui=NONE cterm=NONE
hi String       guifg=#39c0a7
hi Function     guifg=#c54396
hi Identifier   guifg=#a55abf
hi Type         guifg=#c54396
hi CursorLine   guibg=#4fd890
hi Visual       guibg=#434c5e
hi LineNr       guifg=#0fb6ca
hi StatusLine   guibg=#005066 guifg=#001921
