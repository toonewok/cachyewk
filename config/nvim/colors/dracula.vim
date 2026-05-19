set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "dracula"

" Define highlight groups
hi Normal       guifg=#f8f8f2 guibg=none ctermfg=252 ctermbg=none
hi Comment      guifg=#62676c gui=italic
hi Keyword      guifg=#d6acff gui=bold
hi String       guifg=#69ff94
hi Function     guifg=#ff79c6
hi Identifier   guifg=#a4ffff
hi Type         guifg=#ffffa5
hi CursorLine   guibg=#ff5555
hi Visual       guibg=#434c5e
hi LineNr       guifg=#bd93f9
hi StatusLine   guibg=#282a36 guifg=#bd93f9
