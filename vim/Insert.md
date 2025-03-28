# Insert Mode

## Switch

|      |                                                                  |
| ---- | ---------------------------------------------------------------- |
| `i`  | insert at the current cursor position                            |
| `I`  | insert at the start of the first non-blank character in the line |
| `gi` | like "i", but first move to the `'^` mark                        |
| `a`  | insert after the current cursor position                         |
| `A`  | insert at the end of the line                                    |
| `o`  | insert a new line below the current line and insert              |
| `O`  | insert a new line above the current line and insert              |
| `s`  | delete the character under the cursor and insert                 |
| `S`  | delete the current line and insert                               |
| `c`  | combine with other motions to delete text and insert             |
| `gI` | like `I`, but always start in column 1                           |
| `C`  | delete from the cursor to the end of the line and insert         |
| `gr` | replace the current character and insert                         |

> [!NOTE]
> `'^`: To the position where the cursor was the last time when Insert mode was stopped


## Commands

|                        |                                                   |
| ---------------------- | ------------------------------------------------- |
| `Ctrl+o`               | temporarily switch to normal mode for one command |
| `Ctrl+h`               | Backspace                                         |
| `Ctrl+w`               | delete the word before the cursor                 |
| `Ctrl+u`               | delete the line before the cursor                 |
| `Ctrl+t`               | Tab                                               |
| `Ctrl+d`               | delete the Tab                                    |
| `Ctrl+r + [Registers]` | paste the register                                |

