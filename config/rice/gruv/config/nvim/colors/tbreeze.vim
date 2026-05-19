set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "townbreeze"

" Define highlight groups
hi Normal       guifg=#b2b7b4 guibg=none ctermfg=252 ctermbg=none
hi Comment      guifg=#62676c gui=italic
hi Keyword      guifg=#5ff3ff gui=bold
hi String       guifg=#4975fe
hi Function     guifg=#a041dd
hi Identifier   guifg=#4fd890
hi Type         guifg=#c2578d
hi CursorLine   guibg=#4fd890
hi Visual       guibg=#434c5e
hi LineNr       guifg=#c2578d
hi StatusLine   guibg=#4975fe guifg=#d8dee9
