" move to where top or under character is selected character
" Version: 0.1.0
" Author: yassu0320 <mathyassu at gmail.com>
" License: Apache 2.0

if exists('g:loaded_white_dasher')
	finish
endif
let g:loaded_white_dasher = 1

let s:save_cpo = &cpo
set cpo&vim

" code

let &cpo = s:save_cpo
unlet s:save_cpo

