if exists("b:current_syntax")
  finish
endif

syn keyword gr8Keyword small huge news fake initially objects
syn keyword gr8Keyword use public define procedure function on as do uses for return
syn keyword gr8Keyword plus minus times over modulus not and or assign to cell at above below equals input 
syn keyword gr8Keyword if then elsif else stop again post tweet sweeping from by

hi def link gr8Keyword Function

syn match gr8Comment "!!.*$"

syn region gr8CommentL start="<<" end=">>" containedin=gr8CommentL fold extend

syntax match gr8Number "\v<\d+>"
syntax match gr8Number "\v<\d+\.\d+>"
syntax match gr8Number "\v<\d*\.?\d+([Ee]-?)?\d+>"

hi def link gr8Comment Comment
hi def link gr8CommentL Comment
hi def link gr8Number Number

let b:current_syntax = "gr8"

set commentstring=!!\ %s
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list
set ts=8
