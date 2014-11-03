" move to where top character is selected character
" Version: 0.1.0
" Author: yassu0320 <mathyassu at gmail.com>
" License: Apache 2.0

let s:save_cpo = &cpo
set cpo&vim


if !exists('g:white_dasher#seek_top')
    let g:white_dasher#seek_top = 1
endif



function! white_dasher#dash()
    let l:selected_char = nr2char(getchar())
    let l:line_number = line('.')
    let l:now_col = getpos('.')[2]

    if g:white_dasher#seek_top
        let l:seek_line = getline(line_number - 1)
    else " g:white_dasher#seek_top == 0
        let l:seek_line = getline(line_number + 1)
    endif

    let l:matched_col = match(l:seek_line, '[' . l:selected_char . ']', l:now_col)

    if l:matched_col == -1  " not found
        return
    else
        let l:line_s = getline('.')
        let l:new_line_s = l:line_s . repeat(' ', l:matched_col - len(l:line_s) + 1)
        call setline(l:line_number, l:new_line_s)
        call cursor(l:line_number, len(l:new_line_s) + 1)
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
