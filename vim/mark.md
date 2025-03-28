# mark

## Default Marks

|               |                                                                                                                                                                                                                                                                                                                                                    |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `` `< ``/`'<` | To **the first line or character of the last selected Visual area in the current buffer**.  For block mode it may also be the last character in the first line (to be able to define the block).                                                                                                                                                   |
| `` `> ``/`'>` | To **the last line or character of the last selected Visual area in the current buffer**.  For block mode it may also be the first character of the last line (to be able to define the block).  Note that 'selection' applies, the position may be just after the Visual area.                                                                    |
| ` `` `/`''`   | To **the position before the latest jump**, or where the last `m'` or ``m` `` command was given. Not set when the `:keepjumps`  command modifier was used.                                                                                                                                                                                         |
| `` `" ``/`'"` | To **the cursor position when last exiting the current buffer**.  Defaults to the first character of the first line.                                                                                                                                                                                                                               |
| `` `^ ``/`'^` | To **the position where the cursor was the last time when Insert mode was stopped**.  This is used by the `gi` command.  Not set when the `:keepjumps` command modifier was used.                                                                                                                                                                  |
| `` `. ``/`'.` | To **the position where the last change was made**.  The position is at or near where the change started. Sometimes a command is executed as several changes, then the position can be near the end of what the command changed.  For example when inserting a word, the position will be on the last character. To jump to older changes use `g;` |
| `` `( ``/`'(` | To **the start of the current sentence**, like the `(` command.                                                                                                                                                                                                                                                                                    |
| `` `) ``/`')` | To **the end of the current sentence**, like the `)` command.                                                                                                                                                                                                                                                                                      |
| `` `{ ``/`'{` | To **the start of the current paragraph**, like the `{` command.                                                                                                                                                                                                                                                                                   |
| `` `} ``/`'}` | To **the end of the current paragraph**, like the `}` command.                                                                                                                                                                                                                                                                                     |

## Commands

|                       |                               |
| --------------------- | ----------------------------- |
| `m[a-zA-Z]`           | Set mark                      |
| `delmarks [a-zA-Z]`   | Delete marks                  |
| `:delmarks [pattern]` | Delete marks matching pattern |
| `:delmarks!`          | Delete all marks              |
| `'[a-zA-Z]`           | Go to mark                    |
| `:marks`              | Show marks                    |