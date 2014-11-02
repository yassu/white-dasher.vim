" move to where top character is selected character
" Version: 0.1.0
" Author: yassu0320 <mathyassu at gmail.com>
" License: Apache 2.0

let s:save_cpo = &cpo
set cpo&vim



" todo: let g:seek_top = 1
" todo: let g:enter_automally_insertmode
function! white_dasher#dash()
    let l:selected_char = nr2char(getchar())
    let l:line_number = line('.')
    let l:seek_line = getline(line_number - 1)
    let l:matched_col = match(l:seek_line, '[' . l:selected_char . ']')

    if l:matched_col == -1  " not found
        return
    elseif l:matched_col < len(getline('.'))
        echo 'Case A'
        call cursor(l:line_number, l:matched_col + 1)
    else
        echo 'Case B'
        let l:line_s = getline('.')
        let l:new_line_s = l:line_s . repeat(' ', l:matched_col - len(l:line_s) + 1)
        echo l:line_number
        echo l:new_line_s
        call setline(l:line_number, l:new_line_s)
        call cursor(l:line_number, len(l:new_line_s) + 1)
    endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

