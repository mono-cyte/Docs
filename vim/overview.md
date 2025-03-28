# Overview

## `g`

|               |                                                                                                                                                                     |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ga`             | print ascii value of character under the cursor                                                                                                                                |
| `gd`             | go to definition of word under the cursor in current function                                                                                                                  |
| `gD`             | go to definition of word under the cursor in current file                                                                                                                      |
| `ge`             | go backwards to the end of the previous word                                                                                                                                   |
| `gE`             | go backwards to the end of the previous WORD                                                                                                                                   |
| `gf`             | start editing the file whose name is under the cursor                                                                                                                          |
| `gF`             | start editing the file whose name is under the cursor and jump to the line number following the filename.                                                                      |
| `[n]gg`          | cursor to line `[n]`, default first line                                                                                                                                       |
| `gh`             | start Select mode                                                                                                                                                              |
| `gH`             | start Select line mode                                                                                                                                                         |
| `gi`             | like "i", but first move to the `'^` mark                                                                                                                                      |
| `gI`             | like `I`, but always start in column 1                                                                                                                                         |
| `[n]gj`          | like "j", but when 'wrap' on go `[n]` screen lines down                                                                                                                        |
| `[n]gJ`          | join lines without inserting space (compares to `J`)                                                                                                                           |
| `[n]gk`          | like "k", but when 'wrap' on go `[n]` screen lines up                                                                                                                          |
| `gm`             | go to character at middle of the screenline                                                                                                                                    |
| `gM`             | go to character at middle of the text line                                                                                                                                     |
| `gn`             | find the next match with the last used search pattern and Visually select it                                                                                                   |
| `gN`             | find the previous match with the last used search pattern and Visually select it                                                                                               |
| `[n]go`          | cursor to **byte** `[n]` in the buffer                                                                                                                                         |
| `[n]"[reg]gP`    | put the text [from reg] before the cursor `[n]` times, leave the cursor after it                                                                                               |
| `gQ`             | cswitch to "Ex" mode with Vim editing                                                                                                                                          |
| `[n]gr[char]`    | virtual replace `[n]` chars with `[char]`                                                                                                                                      |
| `gR`             | enter Virtual Replace mode                                                                                                                                                     |
| `gt`             | go to the next tab page                                                                                                                                                        |
| `gT`             | go to the previous tab page                                                                                                                                                    |
| `gv`             | reselect the previous Visual area                                                                                                                                              |
| `gV`             | don't reselect the previous Visual area when executing a mapping or menu in Select mode                                                                                        |
| `[n]"[reg]gp`    | put the text [from reg] after the cursor `[n]` times, leave the cursor after it                                                                                                |
| `gq[motion]`     | format Nmove text                                                                                                                                                              |
| `[n]gs`          | go to sleep for `[n]` seconds (default 1)                                                                                                                                      |
| `gu[motion]`     | make Nmove text lowercase                                                                                                                                                      |
| `gU[motion]`     | make Nmove text uppercase                                                                                                                                                      |
| `gw[motion]`     | format Nmove text and keep cursor                                                                                                                                              |
| `gx`             | execute application for file name under the cursor (only with netrw plugin)                                                                                                    |
| `g0`             | when 'wrap' off go to leftmost character of the current line that is on the screen; when 'wrap' on go to the leftmost character of the current screen line                     |
| `g8`             | print hex value of bytes used in UTF-8 character under the cursor                                                                                                              |
| `g]`             | `:tselect` on the tag under the cursor                                                                                                                                         |
| `g^`             | when 'wrap' off go to leftmost non-white character of the current line that is on the screen; when 'wrap' on go to the leftmost non-white character of the current screen line |
| `[n]g_`          | cursor to the last CHAR of `[n]` - 1 lines lower                                                                                                                               |
| `g#`             | like "#", but without using `\<` and `\>`                                                                                                                                      |
| `g$`             | when 'wrap' off go to rightmost character of the current line that is on the screen; when 'wrap' on go to the rightmost character of the current screen line                   |
| `g&`             | repeat last `:s` on all lines                                                                                                                                                  |
| `g'[marker]`     | like `'` but without changing the jumplist                                                                                                                                     |
| ``g `[marker]``  | like `` ` `` but without changing the jumplist                                                                                                                                 |
| `g*`             | like `*`, but without using `\<` and `\>`                                                                                                                                      |
| `[n]g+`          | go to newer text state `[n]` times                                                                                                                                             |
| `[n]g,`          | go to `[n]` newer position in change list                                                                                                                                      |
| `[n]g-`          | go to older text state `[n]` times                                                                                                                                             |
| `[n]g;`          | go to `[n]` older position in change list                                                                                                                                      |
| `g<`             | display previous command output                                                                                                                                                |
| `g?`             | Rot13 encoding operator                                                                                                                                                        |
| `g??`            | Rot13 encode current line                                                                                                                                                      |
| `g?g?`           | Rot13 encode current line                                                                                                                                                      |
| `g Ctrl+a`       | Increment number under cursor                                                                                                                                                  |
| `g Ctrl+x`       | Decrement number under cursor                                                                                                                                                  |
| `g Ctrl+g`       | show information about current cursor position                                                                                                                                 |
| `g Ctrl+H`       | start Select block mode                                                                                                                                                        |
| `g Ctrl+]`       | `:tjump` to the tag under the cursor                                                                                                                                           |
| `g@[motion]`     | call 'operatorfunc'                                                                                                                                                            |
| `g~[motion]`     | swap case for `[motion]` text                                                                                                                                                  |
| `g[Down]`        | same as `gj`                                                                                                                                                                   |
| `g[End]`         | same as `g$`                                                                                                                                                                   |
| `g[Home]`        | same as `g0`                                                                                                                                                                   |
| `g[LeftMouse]`   | same as `<C-LeftMouse>`                                                                                                                                                        |
| `g[MiddleMouse]` | same as `<C-MiddleMouse>`                                                                                                                                                      |
| `g[RightMouse]`  | same as `<C-RightMouse>`                                                                                                                                                       |
| `g[Tab]`         | go to last accessed tab page                                                                                                                                                   |
| `g[Up]`          | same as `gk`                                                                                                                                                                   |

## `z`

|                 |                                                                                                   |
| --------------- | ------------------------------------------------------------------------------------------------- |
| `z<CR>`         | redraw, cursor line to top of window, cursor on first non-blank                                   |
| `z{height}<CR>` | redraw, make window {height} lines high                                                           |
| `z+`            | cursor on line N (default line below window), otherwise like `z<CR>`                              |
| `z-`            | redraw, cursor line at bottom of window, cursor on first non-blank                                |
| `z.`            | redraw, cursor line to center of window, cursor on first non-blank                                |
| `z=`            | give spelling suggestions                                                                         |
| `zA`            | open a closed fold or close an open fold recursively                                              |
| `zC`            | close folds recursively                                                                           |
| `zD`            | delete folds recursively                                                                          |
| `zE`            | eliminate all folds                                                                               |
| `zF`            | create a fold for N lines                                                                         |
| `zG`            | temporarily mark word as correctly spelled                                                        |
| `zH`            | when 'wrap' off scroll half a screenwidth to the right                                            |
| `zL`            | when 'wrap' off scroll half a screenwidth to the left                                             |
| `zM`            | set 'foldlevel' to zero                                                                           |
| `zN`            | set 'foldenable'                                                                                  |
| `zO`            | open folds recursively                                                                            |
| `zR`            | set 'foldlevel' to the deepest fold                                                               |
| `zW`            | temporarily mark word as incorrectly spelled                                                      |
| `zX`            | re-apply 'foldlevel'                                                                              |
| `z^`            | cursor on line N (default line above window), otherwise like "z-"                                 |
| `za`            | open a closed fold, close an open fold                                                            |
| `zb`            | redraw, cursor line at bottom of window                                                           |
| `zc`            | close a fold                                                                                      |
| `zd`            | delete a fold                                                                                     |
| `ze`            | when 'wrap' off scroll horizontally to position the cursor at the end (right side) of the screen  |
| `zf{motion}`    | create a fold for Nmove text                                                                      |
| `zg`            | permanently mark word as correctly spelled                                                        |
| `zh`            | when 'wrap' off scroll screen N characters to the right                                           |
| `zi`            | toggle 'foldenable'                                                                               |
| `zj`            | move to the start of the next fold                                                                |
| `zk`            | move to the end of the previous fold                                                              |
| `zl`            | when 'wrap' off scroll screen N characters to the left                                            |
| `zm`            | subtract one from 'foldlevel'                                                                     |
| `zn`            | reset 'foldenable'                                                                                |
| `zo`            | open fold                                                                                         |
| `zp`            | paste in block-mode without trailing spaces                                                       |
| `zP`            | paste in block-mode without trailing spaces                                                       |
| `zr`            | add one to 'foldlevel'                                                                            |
| `zs`            | when 'wrap' off scroll horizontally to position the cursor at the start (left side) of the screen |
| `zt`            | redraw, cursor line at top of window                                                              |
| `zuw`           | undo                                                                                              | zw |  |
| `zug`           | undo                                                                                              | zg |  |
| `zuW`           | undo                                                                                              | zW |  |
| `zuG`           | undo                                                                                              | zG |  |
| `zv`            | open enough folds to view the cursor line                                                         |
| `zw`            | permanently mark word as incorrectly spelled                                                      |
| `zx`            | re-apply 'foldlevel' and do `zv`                                                                  |
| `zy`            | yank without trailing spaces                                                                      |
| `zz`            | redraw, cursor line at center of window                                                           |
| `z[Left]`       | same as `zh`                                                                                      |
| `z[Right]`      | same as `zl`                                                                                      |