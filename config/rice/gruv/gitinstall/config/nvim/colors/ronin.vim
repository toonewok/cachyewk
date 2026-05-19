set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "ronin"

" Define highlight groups
hi Normal       guifg=#b2b7b4 guibg=none ctermfg=252 ctermbg=none
hi Comment      guifg=#393a3b gui=italic
hi Keyword      guifg=#4fd890 gui=italic
hi Question guifg=#87ff00 guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#5c1919 guibg=NONE gui=NONE cterm=NONE
hi String       guifg=#9c2222
hi Function     guifg=#87ff00
hi Identifier   guifg=#9c2222
hi Type         guifg=#5c1919
hi CursorLine   guibg=#4fd890
hi Visual       guibg=#434c5e
hi LineNr       guifg=#3d3b3b
hi StatusLine   guibg=#1c1c1c guifg=#5c1919
