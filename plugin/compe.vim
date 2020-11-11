if exists('g:loaded_compe') || !has('nvim')
  finish
endif
let g:loaded_compe = v:true

let g:compe_enabled = get(g:, 'compe_enabled', v:false)
let g:compe_debug = get(g:, 'compe_debug', v:false)
let g:compe_throttle_time = get(g:, 'compe_throttle_time', 0)
let g:compe_min_length = get(g:, 'compe_min_length', 1)
let g:compe_auto_preselect = get(g:, 'compe_auto_preselect', v:false)
let g:compe_source_timeout = get(g:, 'compe_source_timeout', 200)
let g:compe_incomplete_delay = get(g:, 'compe_incomplete_delay', 100)
let g:compe_prefer_exact_item = get(g:, 'compe_prefer_exact_item', v:true)

augroup compe
  autocmd!
  autocmd CompleteDone * call s:on_complete_done()
  autocmd InsertLeave * call s:on_insert_leave()
  autocmd TextChangedI,TextChangedP * call s:on_text_changed()
augroup END

"
" on_complete_done
"
function! s:on_complete_done() abort
  if g:compe_enabled
    if !empty(v:completed_item) && !empty(v:completed_item.word)
      call luaeval('require"compe":add_history(_A[1])', [v:completed_item.abbr])
      call luaeval('require"compe":clear()')
    endif
  endif
endfunction

"
" on_insert_leave
"
function! s:on_insert_leave() abort
  if g:compe_enabled
    call luaeval('require"compe":clear()')
  endif
endfunction

"
" s:on_text_changed
"
function! s:on_text_changed() abort
  if g:compe_enabled
    call luaeval('require"compe":on_text_changed()')
  endif
endfunction

call compe#pattern#set_defaults()

