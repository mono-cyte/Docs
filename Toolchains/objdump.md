# Objdump

反汇编目标文件和可执行文件

主要功能

反汇编 (Disassembly): 将机器码指令转换成汇编语言指令，方便阅读和分析。
显示头信息 (Header Information): 显示目标文件的头部信息，例如文件类型、架构、入口点地址等。
显示符号表 (Symbol Table): 显示文件中定义的符号（函数名、变量名等）及其地址。
显示段信息 (Section Information): 显示文件中各个段的起始地址、大小、权限等。
显示重定位信息 (Relocation Information): 显示文件中需要进行地址重定位的部分。
显示程序头 (Program Headers): 用于动态链接和加载的可执行文件和共享对象。

## llvm-objdump

USAGE: `llvm-objdump.exe [options] <input object files>`

### OPTIONS

| Options                          | Description                                                                                                                               |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `--adjust-vma=offset`            | Increase the displayed address by the specified offset                                                                                    |
| `--all-headers`                  | Display all available header information, relocation entries and the symbol table                                                         |
| `--arch-name=<value>`            | Target arch to disassemble for, see --version for available targets                                                                       |
| `--archive-headers`              | Display archive header information                                                                                                        |
| `-a`                             | Alias for --archive-headers                                                                                                               |
| `--build-id=<hex>`               | Build ID to look up. Once found, added as an input file                                                                                   |
| `-C`                             | Alias for --demangle                                                                                                                      |
| `--debug-file-directory=<dir>`   | Path to directory where to look for debug files                                                                                           |
| `--debug-vars-indent=<value>`    | Distance to indent the source-level variable display, relative to the start of the disassembly                                            |
| `--debug-vars=<value>`           | Print the locations (in registers or memory) of source-level variables alongside disassembly. Supported formats: ascii, unicode (default) |
| `--debuginfod`                   | Use debuginfod to find debug files                                                                                                        |
| `--demangle`                     | Demangle symbol names                                                                                                                     |
| `--disassemble-all`              | Disassemble all sections found in the input files                                                                                         |
| `--disassemble-symbols=<value>`  | List of symbols to disassemble. Accept demangled names when --demangle is specified, otherwise accept mangled names                       |
| `--disassemble-zeroes`           | Do not skip blocks of zeroes when disassembling                                                                                           |
| `--disassembler-color=mode`      | Enable or disable disassembler color output. Valid options are "on", "off" and "terminal" (default)                                       |
| `--disassembler-options=options` | Pass target specific disassembler options                                                                                                 |
| `--disassemble`                  | Disassemble all executable sections found in the input files                                                                              |
| `--dwarf=<value>`                | Dump the specified DWARF debug sections. The only supported value is 'frames'                                                             |
| `--dynamic-reloc`                | Display the dynamic relocation entries in the file                                                                                        |
| `--dynamic-syms`                 | Display the contents of the dynamic symbol table                                                                                          |
| `-D`                             | Alias for --disassemble-all                                                                                                               |
| `-d`                             | Alias for --disassemble                                                                                                                   |
| `--fault-map-section`            | Display the content of the fault map section                                                                                              |
| `--file-headers`                 | Display the contents of the overall file header                                                                                           |
| `--full-contents`                | Display the content of each section                                                                                                       |
| `-f`                             | Alias for --file-headers                                                                                                                  |
| `--headers`                      | Alias for --section-headers                                                                                                               |
| `--help`                         | Display available options (--help-hidden for more)                                                                                        |
| `-h`                             | Alias for --section-headers                                                                                                               |
| `-j <value>`                     | Alias for --section                                                                                                                       |
| `--line-numbers`                 | When disassembling, display source line numbers. Implies --disassemble                                                                    |
| `-l`                             | Alias for --line-numbers                                                                                                                  |
| `--macho`                        | Use MachO specific object file parser                                                                                                     |
| `--mattr=a1,+a2,-a3,...`         | Target specific attributes (--mattr=help for details)                                                                                     |
| `--mcpu=cpu-name`                | Target a specific cpu type (--mcpu=help for details)                                                                                      |
| `-mllvm <arg>`                   | Specify an argument to forward to LLVM's CommandLine library                                                                              |
| `-M <value>`                     | Alias for --disassembler-options=                                                                                                         |
| `-m`                             | Alias for --macho                                                                                                                         |
| `--no-addresses`                 | Alias for --no-leading-addr                                                                                                               |
| `--no-debuginfod`                | Don't use debuginfod to find debug files                                                                                                  |
| `--no-leading-addr`              | When disassembling, do not print leading addresses for instructions or inline relocations                                                 |
| `--no-print-imm-hex`             | Do not use hex format for immediate values                                                                                                |
| `--no-show-raw-insn`             | When disassembling instructions, do not print the instruction bytes.                                                                      |
| `--offloading`                   | Display the content of the offloading section                                                                                             |
| `--prefix-strip=prefix`          | Strip out initial directories from absolute paths. No effect without --prefix                                                             |
| `--prefix=prefix`                | Add prefix to absolute paths                                                                                                              |
| `--pretty-pgo-analysis-map`      | Display PGO analysis values with formatting rather than raw numbers                                                                       |
| `--print-imm-hex`                | Use hex format for immediate values (default)                                                                                             |
| `--private-headers`              | Display format specific file headers                                                                                                      |
| `-p`                             | Alias for --private-headers                                                                                                               |
| `--raw-clang-ast`                | Dump the raw binary contents of the clang AST section                                                                                     |
| `--reloc`                        | Display the relocation entries in the file                                                                                                |
| `-R`                             | Alias for --dynamic-reloc                                                                                                                 |
| `-r`                             | Alias for --reloc                                                                                                                         |
| `--section-headers`              | Display summaries of the headers for each section.                                                                                        |
| `--section=<value>`              | Operate on the specified sections only. With --macho dump segment,section                                                                 |
| `--show-all-symbols`             | Show all symbols during disassembly, even if multiple symbols are defined at the same location                                            |
| `--show-lma`                     | Display LMA column when dumping ELF section headers                                                                                       |
| `--source`                       | When disassembling, display source interleaved with the disassembly. Implies --disassemble                                                |
| `--start-address=address`        | Set the start address for disassembling, printing relocations and printing symbols                                                        |
| `--stop-address=address`         | Set the stop address for disassembling, printing relocations and printing symbols                                                         |
| `--symbol-description`           | Add symbol description for disassembly. This option is for XCOFF files only                                                               |
| `--symbolize-operands`           | Symbolize instruction operands when disassembling                                                                                         |
| `--syms`                         | Display the symbol table                                                                                                                  |
| `-S`                             | Alias for --source                                                                                                                        |
| `-s`                             | Alias for --full-contents                                                                                                                 |
| `--traceback-table`              | Decode traceback table in disassembly. Implies --disassemble. This option is for XCOFF files only                                         |
| `--triple=<value>`               | Target triple to disassemble for, see --version for available targets                                                                     |
| `-T`                             | Alias for --dynamic-syms                                                                                                                  |
| `-t`                             | Alias for --syms                                                                                                                          |
| `--unwind-info`                  | Display unwind information                                                                                                                |
| `-u`                             | Alias for --unwind-info                                                                                                                   |
| `--version`                      | Display the version of this program                                                                                                       |
| `-v`                             | Alias for --version                                                                                                                       |
| `--wide`                         | Ignored for compatibility with GNU objdump                                                                                                |
| `--x86-asm-syntax=att`           | Emit AT&T-style disassembly                                                                                                               |
| `--x86-asm-syntax=intel`         | Emit Intel-style disassembly                                                                                                              |
| `-x`                             | Alias for --all-headers                                                                                                                   |
| `-z`                             | Alias for --disassemble-zeroes                                                                                                            |

### llvm-objdump MachO Specific Options

| MachO Specific Options      | Description                                                                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `--arch=<value>`            | architecture(s) from a Mach-O file to dump                                                                                |
| `--archive-member-offsets`  | Print the offset to each archive member for Mach-O archives (requires --macho and --archive-headers)                      |
| `--bind`                    | Display mach-o binding info                                                                                               |
| `--chained-fixups`          | Print chained fixup information (requires --macho)                                                                        |
| `--data-in-code`            | Print the data in code table for Mach-O objects (requires --macho)                                                        |
| `--dis-symname <value>`     | disassemble just this symbol's instructions (requires --macho)                                                            |
| `--dsym=<value>`            | Use .dSYM file for debug info                                                                                             |
| `--dyld-info`               | Print bind and rebase information used by dyld to resolve external references in a final linked binary (requires --macho) |
| `--dylib-id`                | Print the shared library's id for the dylib Mach-O file (requires --macho)                                                |
| `--dylibs-used`             | Print the shared libraries used for linked Mach-O files (requires --macho)                                                |
| `--exports-trie`            | Display mach-o exported symbols                                                                                           |
| `--full-leading-addr`       | Print full leading address                                                                                                |
| `--function-starts=<value>` | Print the function starts table for Mach-O objects. Options: addrs (default), names, both (requires --macho)              |
| `-g`                        | Print line information from debug info if available                                                                       |
| `--indirect-symbols`        | Print indirect symbol table for Mach-O objects (requires --macho)                                                         |
| `--info-plist`              | Print the info plist section as strings for Mach-O objects (requires --macho)                                             |
| `--lazy-bind`               | Display mach-o lazy binding info                                                                                          |
| `--link-opt-hints`          | Print the linker optimization hints for Mach-O objects (requires --macho)                                                 |
| `--no-leading-headers`      | Print no leading headers                                                                                                  |
| `--no-symbolic-operands`    | do not symbolic operands when disassembling (requires --macho)                                                            |
| `--non-verbose`             | Print the info for Mach-O objects in non-verbose or numeric form (requires --macho)                                       |
| `--objc-meta-data`          | Print the Objective-C runtime meta data for Mach-O files (requires --macho)                                               |
| `--private-header`          | Display only the first format specific file header                                                                        |
| `--rebase`                  | Display mach-o rebasing info                                                                                              |
| `--rpaths`                  | Print the runtime search paths for the Mach-O file (requires --macho)                                                     |
| `--universal-headers`       | Print Mach-O universal headers (requires --macho)                                                                         |
| `--weak-bind`               | Display mach-o weak binding info                                                                                          |

示例:

```shell
llvm-objdump -d xxx.exe | llvm-cxxfilt > output.da
```

指定 intel 风格

```shell
llvm-objdump -d -M intel xxx.exe | llvm-cxxfilt -i > output.da
```
