# Normal Mode

## Switch

|          |                                        |
| -------- | -------------------------------------- |
| `Esc`    | Exit current mode and return to normal |
| `Ctrl [` | Exit current mode and return to normal |
| `Ctrl c` | Exit current mode and return to normal |

## Commands

### Motion

#### Basic

|          |                            |
| -------- | -------------------------- |
| `h`      | ← Move cursor left         |
| `j`      | ↓ Move cursor down         |
| `k`      | ↑ Move cursor up           |
| `l`      | → Move cursor right        |
| `:[row]` | Move cursor to line number |

#### Word

|     |                                                              |
| --- | ------------------------------------------------------------ |
| `w` | Move cursor to the beginning of the next word                |
| `W` | Move cursor to the beginning of the next WORD                |
| `b` | Move cursor to the beginning of the current or previous word |
| `B` | Move cursor to the beginning of the current or previous WORD |
| `e` | Move cursor to the end of the current or next word           |
| `E` | Move cursor to the end of the current or next WORD           |

> [!NOTE]
> WORD: String separated by spaces

#### Line

|      |                                                          |
| ---- | -------------------------------------------------------- |
| `0`  | Move cursor to the beginning of the line                 |
| `$`  | Move cursor to the end of the line                       |
| `^`  | Move cursor to the first non-blank character of the line |
| `g0` | Move cursor to the first character of the line           |
| `g$` | Move cursor to the last character of the line            |
| `g^` | Move cursor to the first non-blank character of the line |
| `g_` | Move cursor to the last non-blank character of the line  |

#### Screen

##### Move Cursor

|     |                                             |
| --- | ------------------------------------------- |
| `H` | Move **cursor** to the top of the screen    |
| `M` | Move **cursor** to the middle of the screen |
| `L` | Move **cursor** to the bottom of the screen |

##### Move Screen

|           |                                                                                                                               |

| `zt`      | Move **screen** so cursor is at the top of the screen                                                                         |
| `zz`      | Move **screen** so cursor is at the middle of the                                                                             |
| `zb`      | Move **screen** so cursor is at the bottom of screen                                                                          |
| `z Enter` | Move **screen** so cursor is at the top of the screen and position the cursor at the first non-blank character of the line    |
| `z.`      | Move **screen** so cursor is at the middle of the screen and position the cursor at the first non-blank character of the line |
| `z-`      | Move **screen** so cursor is at the bottom of the screen and position the cursor at the first non-blank character of the line |

#### Page

|          |                                                   |
| -------- | ------------------------------------------------- |
| `Ctrl+f` | Page down (by full screen)                        |
| `Ctrl+b` | Page up (by full screen)                          |
| `Ctrl+d` | Half Page down                                    |
| `Ctrl+u` | Half Page up                                      |
| `Ctrl+e` | Scroll the screen down by one line (cursor stays) |
| `Ctrl+y` | Scroll the screen up by one line (cursor stays)   |

#### Global

|             |                                                                   |
| ----------- | ----------------------------------------------------------------- |
| `gg`        | Move cursor to the first line of the file                         |
| `G`         | Move cursor to the last line of the file                          |
| `g;`        | Move cursor to the last change                                    |
| `g,`        | Move cursor to the previous change                                |
| `gd`        | Move cursor to **local** declaration of the word                  |
| `gD`        | Move cursor to the **global** declaration of the word             |
| `g*`        | Move cursor to the next occurrence of the word                    |
| `g#`        | Move cursor to the previous occurrence of the word                |
| Ctrl+o      | Move cursor to the previous position                              |
| `''`/` `` ` | Go to last position (Switch between the last two saved positions) |
| Ctrl+i      | Move cursor to the next position                                  |

#### Mark

|                       |                               |
| --------------------- | ----------------------------- |
| `m[a-zA-Z]`           | Set mark                      |
| `delmarks [a-zA-Z]`   | Delete marks                  |
| `:delmarks [pattern]` | Delete marks matching pattern |
| `:delmarks!`          | Delete all marks              |
| `'[a-zA-Z]`           | Go to mark                    |
| `:marks`              | Show marks                    |

### Editing

More details: [Command](Command.md)

#### Common

|              |                                                               |
| ------------ | ------------------------------------------------------------- |
| `x`          | Delete the character under the cursor                         |
| `X`          | Delete the character before the cursor                        |
| `p`          | Paste after the cursor                                        |
| `P`          | Paste before the cursor                                       |
| `u`          | Undo                                                          |
| `U`          | Undo all changes on the line                                  |
| `Ctrl + r`   | Redo                                                          |
| `.`          | Repeat last command                                           |
| `g&`         | Repeat the last substitute operation                          |
| `>[motion]`  | Indent line                                                   |
| `<[motion]`  | Unindent line                                                 |
| `=`          | Auto-indent line                                              |
| `~`          | Toggle case of the character under the cursor                 |
| `J`          | Join line below to the current one and remove spaces and tabs |
| `gJ`         | Keeping spaces and removing only one tab from the joined line |
| `gq[motion]` | Format text                                                   |
| `g~[motion]` | Toggle case of the text                                       |
| `gu[motion]` | Convert to lowercase                                          |
| `gU[motion]` | Convert to uppercase                                          |
| `g Ctrl+a`   | Increment number                                              |
| `g Ctrl+x`   | Decrement number                                              |

#### Editing current line

`[command]` × 2

|      |                                |
| ---- | ------------------------------ |
| `dd` | Delete (cut) the current line  |
| `yy` | Copy the current line          |
| `cc` | delete current line and insert |

#### Editing with Batch

`[count] [command]`

|                           |                         |
| ------------------------- | ----------------------- |
| `[count] j`               | Move down [count] lines |
| `[count] d`/ `[count] dd` | delete [count] lines    |

`[command] [count]`

|                            |                      |
| -------------------------- | -------------------- |
| `d [count]`/ `d [count] d` | delete [count] lines |

#### Editing with Motion

|             |                             |
| ----------- | --------------------------- |
| `d[motion]` | delete (cut) by motion      |
| `y[motion]` | copy by motion              |
| `c[motion]` | delete by motion and insert |

#### Editing with Row Position

`[row] [motion]`

|            |                   |
| ---------- | ----------------- |
| `:[row] d` | delete line [row] |

#### Editing with Range

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

### Search

> [!NOTE]
> Supports regular expressions

|              |                              |
| ------------ | ---------------------------- |
| `/[pattern]` | Search forward for pattern   |
| `?[pattern]` | Search backward for pattern  |
| `n`          | Find next match              |
| `N`          | Find previous match          |
| `*`          | Search for word under cursor |
