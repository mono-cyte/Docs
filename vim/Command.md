# Command

`: ![command]`: Execute command in shell

`:[command]!`: Execute command (force)


| Range           | Description                                        |
| --------------- | -------------------------------------------------- |
| `[row1],[row2]` | from line [row1] to line [row2]                    |
| `%`             | entire file                                        |
| `'/`            | from the previous mark to the cursor position      |
| `''`            | from the last jump position to the cursor position |
| `*`             | all lines matching a pattern (global range)        |


## Buffer Status

以下是翻译为英文的缓冲区状态表：

|         |                                                 |
| ------- | ----------------------------------------------- |
| (space) | Inactive buffer                                 |
| `a`     | Active buffer (displayed in the current window) |
| `h`     | Hidden buffer (not displayed in any window)     |
| `%`     | Current buffer                                  |
| `#`     | Previous buffer                                 |
| `+`     | Modified buffer                                 |
| `-`     | Read-only buffer                                |

## Buffers Management

|                            |                                       |
| -------------------------- | ------------------------------------- |
| `:w`                       | Save                                  |
| `w [file]`/`saveas [file]` | Save as [file] (overwrite if exists)  |
| `w >> [file]`              | append to [file]                      |
| `:w!`                      | Save (force)                          |
| `:q`                       | Quit                                  |
| `:q!`                      | Quit (force)                          |
| `:qa`                      | quit all buffers                      |
| `:qa!`                     | quit all buffers (force)              |
| `:wq`/`:x`                 | Save and Quit                         |
| `enew`                     | create new buffer                     |
| `:e [file]`                | open file (create if not exist)       |
| `:e!`                      | reload file & discard unsaved changes |
| `:r [file]`                | insert file content at cursor         |
| `:r ![command]`            | insert output of command at cursor    |
| `:ls`/`:buffers`           | list open buffers                     |
| `:b [n]`                   | switch to buffer [n]                  |
| `:b [name]`                | switch to buffer [name]               |
| `:bn(ext)`                 | switch to next buffer                 |
| `:bp(rev)`                 | switch to prev buffer                 |
| `:bd(elete)`               | delete current buffer                 |
| `:bd [n]`                  | delete buffer [n]                     |

## Search

|              |                                                    |
| ------------ | -------------------------------------------------- |
| `/[pattern]` | Search backward for pattern                        |
| `?[pattern]` | Search forward for pattern                         |
| `n`/`N`      | Next/Prev match                                    |
| `*`          | Search forward for the word                        |
| `g*`         | Move cursor to the next occurrence of the word     |
| `#`          | Search backward for the word                       |
| `g#`         | Move cursor to the previous occurrence of the word |

### Options

|                   |                                |
| ----------------- | ------------------------------ |
| `:set hlsearch`   | highlight search results       |
| `:set nohlsearch` | set no highlight               |
| `nohlsearch`      | clear highlight search results |
| `:set incsearch`  | incremental search             |
| `:set ignorecase` | ignore case                    |
| `:set smartcase`  | case sensitive search          |

### History

|           |                                    |
| --------- | ---------------------------------- |
| `/ + ↑/↓` | browse search history              |
| `q/`      | open search (by `/`) history panel |
| `q?`      | open search (by `?`) history panel |

## Replace

|                                              |                                                         |
| -------------------------------------------- | ------------------------------------------------------- |
| `:[range] s/[pattern]/[replacement]/[flags]` | Replace all occurrences of [pattern] with [replacement] |

| Flags | Description                                                                 |
| ----- | --------------------------------------------------------------------------- |
| `g`   | Global: Replace all occurrences in the line (not just the first one)        |
| `c`   | Confirm: Prompt for confirmation before each replacement                    |
| `i`   | Ignore case: Perform case-insensitive matching                              |
| `I`   | Case-sensitive matching (overrides ignorecase option)                       |
| `p`   | Print: Display the last replacement                                         |
| `e`   | Suppress error messages (e.g., if no match is found)                        |
| `n`   | No replacement: Report the number of matches but do not perform replacement |
| `&`   | Repeat the last :s command with the same flags and range                    |
| `r`   | Not a valid flag in Vim (remove this row)                                   |


## Postion

|          |                            |
| -------- | -------------------------- |
| `:[row]` | Move cursor to line number |

## Tabs Management

|                              |                                           |
| ---------------------------- | ----------------------------------------- |
| `:tabs`                      | list open tabs                            |
| `:tabo(nly)`                 | close all other tabs                      |
| `:tabnew`                    | create new tab                            |
| `:tabc(lose)`                | close current tab                         |
| `:tabfir(st)`/`:tabrew(ind)` | switch to first tab                       |
| `:tabl(ast)`                 | switch to last tab                        |
| `:tabn(ext)`/`gt`            | switch to next tab                        |
| `:tabp(rev)`/`gT`            | switch to prev tab                        |
| `:tabm/tabn [n]`/`[n]gt`     | move current tab to [n]                   |
| `:tabdo [command]`           | execute [command] on all tabs             |
| `:tabfind [file]`            | open file on new tab (goto tab if exists) |

## Panels Management

|                              |                                        |
| ---------------------------- | -------------------------------------- |
| `Ctrl + w + q`               | quit current panel                     |
| `:only`/`Ctrl + w + o`       | quit other panels                      |
| `:hide`                      | hide current panel                     |
| `:sp(lit)`                   | split current panel horizontally       |
| `:sp [file]`                 | open file & split horizontally         |
| `:vsp(lit)`/`vs`             | split current panel vertically         |
| `:resize [n]`                | resize height (char) of current panel  |
| `:resize +/- [n]`            | resize height (char) of current panel  |
| `:vertical resize [n]`       | resize width (char) of current panel   |
| `:vertical resize +/- [n]`   | resize width (char) of current panel   |
| `Ctrl + w + h/j/k/l/←/↓/↑/→` | move cursor between panels             |
| `Ctrl + w + w`               | switch to the next window (panel)      |
| `Ctrl + w + +`               | increase height of current panel       |
| `Ctrl + w + -`               | decrease height of current panel       |
| `Ctrl + w + _`               | maximize height of current panel       |
| `Ctrl + w + >`               | Increase width of current panel        |
| `Ctrl + w + <`               | decrease width of current panel        |
| `Ctrl + w + \|`              | maximize width of current panel        |
| `Ctrl + w + =`               | equalize the size of all panels        |
| `Ctrl + w + r`               | rotate panels clockwise                |
| `Ctrl + w + x`               | swap current panel with the next panel |

## Vim Script