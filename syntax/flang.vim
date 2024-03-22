if exists("b:current_syntax")
  finish
endif

syn keyword flangKeywords func break cond lambda prog quote return setq while
syn keyword flangPredefinedFuncs plus times divide minus head tail cons equal nonequal less lesseq greater greatereq isint isreal isbool isnull isatom islist and or xor not eval println isempty
syn keyword flangBools true false null

syn match flangComment ";.*$"
syn match flangIdentifier "\w\+"
syn match flangConstant "\d\+"
syn match flangString "\".*\""

" Highlighting
hi def link flangComment Comment
hi def link flangKeywords Keyword
hi def link flangIdentifier Identifier
hi def link flangPredefinedFuncs Function
hi def link flangConstant Constant
hi def link flangBools Boolean
hi def link flangString String

let b:current_syntax='flang'
