# Replace Mode

## Switch

|      |                            |
| ---- | -------------------------- |
| `r`  |                            |
| `R`  | Replace Mode               |
| `gR` | enter Virtual Replace mode |
| `[n]gr[char]`    | virtual replace `[n]` chars with `[char]`                                                                 |

> [!NOTE]
>
> Virtual Replace mode is similar to Replace mode, but instead of replacing actual characters in the file, you are replacing screen real estate, so that characters further on in the file never appear to move.
>
> So if you type a `<Tab>` it may replace several normal characters, and if you type a letter on top of a <Tab> it may not replace anything at all, since the <Tab> will still line up to the same place as before.
>
> Typing a `<NL>` still doesn't cause characters later in the file to appear to move.  The rest of the current line will be replaced by the <NL> (that is, they are deleted), and replacing continues on the next line.  A new line is NOT inserted unless you go past the end of the file.

## Editing

|                 |                           |
| --------------- | ------------------------- |
| `Backspace`     | undo the last replacement |
| `Delete`        | removes the character     |
| `↑`/`↓`/`←`/`→` | move the cursor           |


| `g&`             | repeat last `:s` on all lines                                                                                                                                                  |