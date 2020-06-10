# compe

My hobby auto completion plugin.

# concept

- Lua implementation
- Multiple start offset
- Lua source & Vim source

# usage

```viml
let g:compe_enabled = v:true
let g:compe_min_length = 1

if s:default
  inoremap <expr><CR>  compe#confirm('<CR>')
  inoremap <expr><C-e> compe#close('<C-e>')
endif

if s:lexima
  inoremap <expr><CR>  compe#confirm(lexima#expand('<LT>CR>', 'i'))
  inoremap <expr><C-e> compe#close('<C-e>')
endif
```

# todo
- Split sources
