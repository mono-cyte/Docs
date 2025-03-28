# Edit

| `u`         | Undo                                                          |
| `U`         | Undo all changes on the line                                  |
| `Ctrl + r`  | Redo                                                          |

## Delete

|`[n]"[reg]x`/`dl`| Delete `[n]` characters under and after the cursor into `[reg]` (not |linewise|)|
| `x`  | Delete the character under the cursor  |
| `X`  | Delete the character before the cursor |

## Yank

|                      |                                           |
| -------------------- | ----------------------------------------- |
| `"[reg]y[motion]`    | yank into `[reg]` with trailing spaces    |
| `"[reg]zy[motion]`   | yank into `[reg]` without trailing spaces |
| `[n]"[reg]Y[motion]` | yank `[n]` line into `[reg]`              |

## Put

| `p`         | Paste after the cursor                                        |
| `P`         | Paste before the cursor                                       |
| `[n]"[reg]gP`    | put the text [from reg] before the cursor `[n]` times, leave the cursor after it                          |
| `[n]"[reg]gp`    | put the text [from reg] after the cursor `[n]` times, leave the cursor after it                           |
| `zp`        | paste in block-mode without trailing spaces |
| `zP`        | paste in block-mode without trailing spaces |


## Case

| `~`         | Toggle case of the character under the cursor                 |
| `g~[motion]`     | swap case for `[motion]` text                                                                             |
| `gu[motion]`     | make Nmove text lowercase                                                                                 |
| `gU[motion]`     | make Nmove text uppercase                                                                                 |


## Tag

|                                         |                                                        |
| --------------------------------------- | ------------------------------------------------------ |
| `Ctrl+]`/`Ctrl+LeftMouse`/`:tag [name]` | Jump to the definition of the keyword under the cursor |
| `g Ctrl+]`                              | `:tjump` to the tag under the cursor                   |
| `g]`                                    | `:tselect` on the tag under the cursor                 |


## Indent

|             |                                                    |
| ----------- | -------------------------------------------------- |
| `>[motion]` | Shift `[motion]` lines one 'shiftwidth' rightwards |
| `<[motion]` | Shift `[motion]` lines one 'shiftwidth' leftwards  |

## Wrap

|           |                                                                                                                                                                                |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `g$`      | when 'wrap' off go to rightmost character of the current line that is on the screen; when 'wrap' on go to the rightmost character of the current screen line                   |
| `g[End]`  | same as `g$`                                                                                                                                                                   |
| `g0`      | when 'wrap' off go to leftmost character of the current line that is on the screen; when 'wrap' on go to the leftmost character of the current screen line                     |
| `g[Home]` | same as `g0`                                                                                                                                                                   |
| `g^`      | when 'wrap' off go to leftmost non-white character of the current line that is on the screen; when 'wrap' on go to the leftmost non-white character of the current screen line |
| `[n]gj`   | like "j", but when 'wrap' on go `[n]` screen lines down                                                                                                                        |
| `g[Down]` | same as `gj`                                                                                                                                                                   |
| `[n]gk`   | like "k", but when 'wrap' on go `[n]` screen lines up                                                                                                                          |
| `g[Up]`   | same as `gk`                                                                                                                                                                   |
| `J`       | Join line below to the current one and remove spaces and tabs                                                                                                                  |
| `[n]gJ`   | join lines without inserting space (compares to `J`)                                                                                                                           |

## Format

| `gq[motion]`     | format `[motion]` text                                                                                         |
| `gw[motion]`     | format `[motion]` text and keep cursor                                                                         |
| `=[motion]` | Filter `[motion]` lines through the external program given with the 'equalprg' option                  |

## Other

|            |                                      |
| ---------- | ------------------------------------ |
| `.`        | Repeat last command                  |
| `g&`       | Repeat the last substitute operation |
| `g Ctrl+a` | Increment number under cursor        |
| `g Ctrl+x` | Decrement number under cursor        |

## Pattern

### Current line

`[command]` × 2

|           |                                |
| --------- | ------------------------------ |
| `dd`      | Delete (cut) the current line  |
| `yy`      | Copy the current line          |
| `cc`      | delete current line and insert |
| `gqq`     | format current line            |
| `==`      | format current line            |
| `gg`      | cursor to first line           |
| `zz`      | cursor to center line          |
| `<<`/`>>` | indent/unindent                |

### Batch

`[count] [command]`

|                           |                         |
| ------------------------- | ----------------------- |
| `[count] j`               | Move down [count] lines |
| `[count] d`/ `[count] dd` | delete [count] lines    |

`[command] [count]`

|                            |                      |
| -------------------------- | -------------------- |
| `d [count]`/ `d [count] d` | delete [count] lines |

### Motion

|             |                             |
| ----------- | --------------------------- |
| `d[motion]` | delete (cut) by motion      |
| `y[motion]` | copy by motion              |
| `c[motion]` | delete by motion and insert |

### Line

`[row] [motion]`

|            |                   |
| ---------- | ----------------- |
| `:[row] d` | delete line [row] |

### Range

`[range]` in Vim simplifies to `[row1],[row2]`

`[range] [command]`

|              |                       |
| ------------ | --------------------- |
| `:[range] d` | delete lines by range |
| `:[range] y` | yank lines by range   |
| `:[range] A` | append by range       |
| `:[range] I` | change lines by range |

`[range] [mode] [command]`

|                           |                                    |
| ------------------------- | ---------------------------------- |
| `:[range] normal A [str]` | append str to the end of each line |