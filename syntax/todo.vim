if exists("b:current_syntax")
  finish
endif

syn match todoBrace             "[\[\]]"             contained

syn match todoDoneLine          "\[x\] .*"           contains=todoDoneCheck,todoDonePrefix
syn match todoDoneCheck         "\[x\]"hs=s+1,he=e-1 contained contains=todoBrace
syn match todoDonePrefix        "\[x\] [a-z0-9/\-_]*: "hs=s+4 contained contains=todoDoneCheck

syn match todoPendingLine       "\[ \] .*"           contains=todoPendingCheck,todoPendingPrefix,todoUrgent
syn match todoPendingCheck         "\[ \]"hs=s+1,he=e-1 contained contains=todoBrace
syn match todoPendingPrefix        "\[ \] [a-z0-9/\-_]*: "hs=s+4 contained contains=todoPendingCheck

syn match todoUrgent "URGENT"
hi todoUrgent guifg=#bb0000

hi todoBrace            guifg=#FFFFFF

hi todoDoneLine         guifg=#555555
hi todoDoneCheck        guifg=#009933
hi todoDonePrefix       guifg=#777777

hi todoPendingLine      guifg=#FFFFFF
hi todoPendingCheck     guifg=#00E600
hi todoPendingPrefix    guifg=#DDDDDD

let b:current_syntax = "todo"
