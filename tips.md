When you use vim, if you select some text and replace others, it is annoying the paste was overwrite by the removed text.
This script is helpful to avoid this ( put it in ~/.vimrc )

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
