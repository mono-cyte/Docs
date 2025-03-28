# Motion

## Basic

|          |                            |
| -------- | -------------------------- |
| `h`      | ← Move cursor left         |
| `j`      | ↓ Move cursor down         |
| `k`      | ↑ Move cursor up           |
| `l`      | → Move cursor right        |
| `:[row]` | Move cursor to line number |

| `[n]g_`          | cursor to the last CHAR of `[n]` - 1 lines lower                                                                                                                               |
| `[n]g+`          | go to newer text state `[n]` times                                                                                                                                             |
| `[n]g,`          | go to `[n]` newer position in change list                                                                                                                                      |
| `[n]g-`          | go to older text state `[n]` times                                                                                                                                             |
| `[n]g;`          | go to `[n]` older position in change list                                                                                                                                      |

## Word

|      |                                                              |
| ---- | ------------------------------------------------------------ |
| `w`  | Move cursor to the beginning of the next word                |
| `W`  | Move cursor to the beginning of the next WORD                |
| `b`  | Move cursor to the beginning of the current or previous word |
| `B`  | Move cursor to the beginning of the current or previous WORD |
| `e`  | Move cursor to the end of the current or next word           |
| `E`  | Move cursor to the end of the current or next WORD           |
| `ge` | go backwards to the end of the previous word                 |
| `gE` | go backwards to the end of the previous WORD                 |

> [!NOTE]
> WORD: String separated by spaces

## Line

|      |                                                          |
| ---- | -------------------------------------------------------- |
| `0`  | Move cursor to the beginning of the line                 |
| `$`  | Move cursor to the end of the line                       |
| `^`  | Move cursor to the first non-blank character of the line |
| `g0` | Move cursor to the first character of the line           |
| `g$` | Move cursor to the last character of the line            |
| `g^` | Move cursor to the first non-blank character of the line |
| `g_` | Move cursor to the last non-blank character of the line  |
| `gm` | go to character at middle of the screenline              |
| `gM` | go to character at middle of the text line               |


## Screen

### Move Cursor

|     |                                                                                                                |
| --- | -------------------------------------------------------------------------------------------------------------- |
| `H` | to line [count] from top (Home) of window (default: first line on the window) on the first non-blank character |
| `M` | to middle line of window on the first non-blank character                                                      |
| `L` | to line [count] from bottom of window on the first non-blank character                                         |

### Move Screen

|                    |                                                                         |
| ------------------ | ----------------------------------------------------------------------- |
| `z<Enter>`         | redraw, cursor line to top of window, cursor on first non-blank         |
| `z[height]<Enter>` | redraw, make window `[height]` lines high                               |
| `z-`               | redraw, cursor line at bottom of window, cursor on first non-blank      |
| `z.`               | redraw, cursor line to center of window, cursor on first non-blank      |
| `zb`               | redraw, cursor line at bottom of window                                 |
| `zt`               | redraw, cursor line at top of window                                    |
| `zz`               | redraw, cursor line at center of window                                 |
| `z+`               | cursor on line N (default line below window), otherwise like `z<Enter>` |
| `z^`               | cursor on line N (default line above window), otherwise like "z-"       |


## Page

|          |                                                                    |
| -------- | ------------------------------------------------------------------ |
| `ctrl+f` | page forward (by full screen)                                      |
| `ctrl+b` | page backward (by full screen)                                     |
| `ctrl+d` | half page down                                                     |
| `ctrl+u` | half page up                                                       |
| `ctrl+e` | Scroll the screen down (expose) by one line (cursor remains fixed) |
| `ctrl+y` | Scroll the screen up (yank) by one line (cursor remains fixed)     |

## Global

|             |                                                                   |
| ----------- | ----------------------------------------------------------------- |
| `gg`        | Move cursor to the first line of the file                         |
| `G`         | Move cursor to the last line of the file                          |
| `g;`        | Move cursor to the last change                                    |
| `g,`        | Move cursor to the previous change                                |
| `gd`        | go to definition of word under the cursor in current function     |
| `gD`        | go to definition of word under the cursor in current file         |
| `Ctrl+o`    | Move cursor to the previous position                              |
| `''`/` `` ` | Go to last position (Switch between the last two saved positions) |
| Ctrl+i      | Move cursor to the next position                                  |
| `[n]gg`     | cursor to line `[n]`, default first line                          |
| `[n]go`     | cursor to **byte** `[n]` in the buffer                            |


## Mark

|                       |                                                |
| --------------------- | ---------------------------------------------- |
| `m[a-zA-Z]`           | Set mark                                       |
| `delmarks [a-zA-Z]`   | Delete marks                                   |
| `:delmarks [pattern]` | Delete marks matching pattern                  |
| `:delmarks!`          | Delete all marks                               |
| `'[a-zA-Z]`           | Go to mark                                     |
| `:marks`              | Show marks                                     |
| `g'[marker]`          | like `'` but without changing the jumplist     |
| ``g`[marker]``        | like `` ` `` but without changing the jumplist |
