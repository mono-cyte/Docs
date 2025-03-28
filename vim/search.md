# search

|              |                                                                                  |
| ------------ | -------------------------------------------------------------------------------- |
| `/[pattern]` | Search forward for pattern                                                       |
| `?[pattern]` | Search backward for pattern                                                      |
| `n`          | Find next match                                                                  |
| `N`          | Find previous match                                                              |
| `gn`         | find the next match with the last used search pattern and Visually select it     |
| `gN`         | find the previous match with the last used search pattern and Visually select it |
| `[n]*`       | Search forward for the `[n]`'th occurrence of the word nearest to the cursor     |
| `[n]#`       | Search backward for the `[n]`'th occurrence of the word nearest to the cursor    |
| `g*`         | like `*`, but without using `\<` and `\>`                                        |
| `g#`         | like "#", but without using `\<` and `\>`                                        |

## Search Options

|                   |                                |
| ----------------- | ------------------------------ |
| `:set hlsearch`   | highlight search results       |
| `:set nohlsearch` | set no highlight               |
| `:nohlsearch`     | clear highlight search results |
| `:set incsearch`  | incremental search             |
| `:set ignorecase` | ignore case                    |
| `:set smartcase`  | case sensitive search          |