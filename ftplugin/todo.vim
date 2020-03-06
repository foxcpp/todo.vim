set nonumber

function! s:NumSort(a, b)
    return a:a>a:b ? 1 : a:a==a:b ? 0 : -1
endfunction

fun TodoToggle()
    let [l:firstline, l:lastline]=sort([line('v'), line('.')], 's:NumSort')

    let li = l:firstline
    while l:li <= l:lastline
        let cont = getline(l:li)
        if l:cont =~ '\v\[ \]'
            let cont = substitute(l:cont, '\v\[ \]', '[x]', 'g')
            "let cont = l:cont . ' [Completed: ' . strftime('%Y-%m-%d %H:%M') . ']'
            call setline(l:li, l:cont)
        elseif l:cont =~ '\v\[x\]'
            let cont = substitute(l:cont, '\v\[x\]', '[ ]', 'g')
            call setline(l:li, l:cont)
        endif
        let li = l:li + 1
    endwhile
    silent! write
endfun
noremap <silent> <Space> :call TodoToggle()<CR>

noremap = A<Enter>[ ]<space>
