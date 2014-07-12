
---

When you use vim, if you select some text and replace others, it is annoying the paste buffer was overwrite by the removed text. you could not paste again and again.
This script is helpful to avoid this situation( put it in ~/.vimrc )

```
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
```
