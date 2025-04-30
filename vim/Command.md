# Command

`: ![command]`: Execute command in shell

`:[command]!`: Execute command (force)

| Range Expression | Description                                        |
| ---------------- | -------------------------------------------------- |
| `[row1],[row2]`  | from line [row1] to line [row2]                    |
| `%`              | entire file                                        |
| `'/`             | from the previous mark to the cursor position      |
| `''`             | from the last jump position to the cursor position |
| `*`              | all lines matching a pattern (global range)        |

## Terminal

|                         |               |
| ----------------------- | ------------- |
| `:ter(minal)`           | open terminal |
| `vert(ical) ter(minal)` |               |

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

## Location

|          |                            |
| -------- | -------------------------- |
| `:[row]` | Move cursor to line number |
|          |                            |

More Details: [Normal Motion](Normal.md)

## Wrap

|            |                                                                                                   |
| ---------- | ------------------------------------------------------------------------------------------------- |
| `zH`       | when 'wrap' off scroll half a screenwidth to the right                                            |
| `zh`       | when 'wrap' off scroll screen N characters to the right                                           |
| `zL`       | when 'wrap' off scroll half a screenwidth to the left                                             |
| `zl`       | when 'wrap' off scroll screen N characters to the left                                            |
| `ze`       | when 'wrap' off scroll horizontally to position the cursor at the end (right side) of the screen  |
| `zs`       | when 'wrap' off scroll horizontally to position the cursor at the start (left side) of the screen |
| `z[Left]`  | same as `zh`                                                                                      |
| `z[Right]` | same as `zl`                                                                                      |

## Spell Check

|      |                                              |
| ---- | -------------------------------------------- |
| `zg` | permanently mark word as correctly spelled   |
| `zG` | temporarily mark word as correctly spelled   |
| `zw` | permanently mark word as incorrectly spelled |
| `zW` | temporarily mark word as incorrectly spelled |
| `z=` | give spelling suggestions                    |

## Fold

|              |                                                      |
| ------------ | ---------------------------------------------------- |
| `za`         | open a closed fold, close an open fold               |
| `zA`         | open a closed fold or close an open fold recursively |
| `zc`         | close a fold                                         |
| `zC`         | close folds recursively                              |
| `zd`         | delete a fold                                        |
| `zD`         | delete folds recursively                             |
| `zE`         | eliminate all folds                                  |
| `zf[motion]` | create a fold for Nmove text                         |
| `zF`         | create a fold for N lines                            |
| `zi`         | toggle 'foldenable'                                  |
| `zj`         | move to the start of the next fold                   |
| `zk`         | move to the end of the previous fold                 |
| `zm`         | subtract one from 'foldlevel'                        |
| `zM`         | set 'foldlevel' to zero                              |
| `zn`         | reset 'foldenable'                                   |
| `zN`         | set 'foldenable'                                     |
| `zo`         | open fold                                            |
| `zO`         | open folds recursively                               |
| `zr`         | add one to 'foldlevel'                               |
| `zR`         | set 'foldlevel' to the deepest fold                  |
| `zv`         | open enough folds to view the cursor line            |
| `zx`         | re-apply 'foldlevel' and do `zv`                     |
| `zX`         | re-apply 'foldlevel'                                 |

### Fold Options

`:set foldmethod=[options]`

| options  |     |
| -------- | --- |
| `manual` |     |
| `indent` |     |
| `syntax` |     |
| `marker` |     |
| `expr`   |     |

`set foldlevel=[n]`: top [n] levels of folds are shown

`set foldcolumn=[n]`: columns show fold info

## Buffer Status

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

## Tabs Management

|                              |                                          |
| ---------------------------- | ---------------------------------------- |
| `:tabs`                      | list open tabs                           |
| `:tabo(nly)`                 | close all other tabs                     |
| `:tabnew`                    | create new tab                           |
| `:tabc(lose)`                | close current tab                        |
| `tabe(dit) [file]`           | open file on new tab                     |
| `:tabfir(st)`/`:tabrew(ind)` | switch to first tab (goto tab if exists) |
| `:tabl(ast)`                 | switch to last tab                       |
| `:tabn(ext)`/`gt`            | switch to next tab                       |
| `:tabp(rev)`/`gT`            | switch to prev tab                       |
| `:tabm/tabn [n]`/`[n]gt`     | move current tab to [n]                  |
| `:tabdo [command]`           | execute [command] on all tabs            |
| `g[Tab]`                     | go to last accessed tab page             |
| `gt`                         | go to the next tab page                  |
| `gT`                         | go to the previous tab page              |

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

## More

|                         |                                                        |
| ----------------------- | ------------------------------------------------------ |
| `:set number`           | show line number                                       |
| `:set nonumber`         | hide line number                                       |
| `:set relativenumber`   | show relative line number                              |
| `:set norelativenumber` | hide relative line number                              |
| `:set wrap`             | wrap (if text longer than window)                      |
| `:set nowrap`           | no wrap                                                |
| `:set list`             | show invisible characters                              |
| `:set nolist`           | hide invisible characters                              |
| `:set spell`            | spell check                                            |
| `:set nospell`          | no spell check                                         |
| `:set paste`            | disable features that might interfere with pasted text |
| `:set nopaste`          |                                                        |
| `:set tabstop=[n]`      | set tabstop to [n]                                     |
| `:set shiftwidth=[n]`   | set shiftwidth to [n] (width of autoindent)            |
| `set expandtab`         | enable insert space for tab                            |
| `:set softtabstop=[n]`  | insert [n] spaces when input tab                       |
| `set noexpandtab`       |                                                        |
| `zuw`                   | undo                                                   |
| `zug`                   | undo                                                   |
| `zuW`                   | undo                                                   |
| `zuG`                   | undo                                                   |

| `[n]gs` | go to sleep for `[n]` seconds (default 1) |
