# more

## Info

|            |                                                                   |
| ---------- | ----------------------------------------------------------------- |
| `ga`       | print ascii value of character under the cursor                   |
| `g8`       | print hex value of bytes used in UTF-8 character under the cursor |
| `g Ctrl+g` | show information about current cursor position                    |
| `g<`       | display previous command output                                   |

## Rotate by 13 places

|        |                           |
| ------ | ------------------------- |
| `g?`   | Rot13 encoding operator   |
| `g??`  | Rot13 encode current line |
| `g?g?` | Rot13 encode current line |

|      |                                                                                                          |
| ---- | -------------------------------------------------------------------------------------------------------- |
| `gf` | start editing the file whose name is under the cursor                                                    |
| `gF` | start editing the file whose name is under the cursor and jump to the line number following the filename |
| `gx` | execute application for file name under the cursor (only with netrw plugin)                              |

