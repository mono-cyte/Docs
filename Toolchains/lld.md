# lld

USAGE: `ld.lld [options] file...`

For Clang: `clang -Wl,[options],file`

| OPTIONS                                 | Description                                                                                         |
| --------------------------------------- | --------------------------------------------------------------------------------------------------- |
| -###                                    | Print (but do not run) the commands to run for this compilation                                     |
| --allow-multiple-definition             | Allow multiple definitions                                                                          |
| --appcontainer                          | Set the appcontainer flag in the executable                                                         |
| --Bdynamic                              | Link against shared libraries                                                                       |
| --Bstatic                               | Do not link against shared libraries                                                                |
| --build-id=<arg>                        | Generate build ID note (pass none to disable)                                                       |
| --build-id                              | Alias for --build-id=                                                                               |
| -call_shared                            | Link against shared libraries                                                                       |
| --delayload=<value>                     | DLL to load only on demand                                                                          |
| --demangle                              | Demangle symbol names (default)                                                                     |
| --disable-auto-import                   | Don't automatically import data symbols from other DLLs without dllimport                           |
| --disable-dynamicbase                   | Disable ASLR                                                                                        |
| --disable-high-entropy-va               | Don't set the 'high entropy VA' flag                                                                |
| --disable-no-seh                        | Don't set the 'no SEH' flag                                                                         |
| --disable-nxcompat                      | Don't set the 'nxcompat' flag                                                                       |
| --disable-reloc-section                 | Disable base relocations                                                                            |
| --disable-runtime-pseudo-reloc          | Don't do automatic imports that require runtime fixups                                              |
| --disable-stdcall-fixup                 | Don't resolve stdcall/fastcall/vectorcall to undecorated symbols                                    |
| --disable-tsaware                       | Don't set the 'Terminal Server aware' flag                                                          |
| --dll                                   | Build a shared object                                                                               |
| -dn                                     | Do not link against shared libraries                                                                |
| --dynamicbase                           | Enable ASLR                                                                                         |
| -dy                                     | Link against shared libraries                                                                       |
| --enable-auto-import                    | Automatically import data symbols from other DLLs where needed                                      |
| --enable-reloc-section                  | Enable base relocations                                                                             |
| --enable-runtime-pseudo-reloc           | Allow automatic imports that require runtime fixups                                                 |
| --enable-stdcall-fixup                  | Resolve stdcall/fastcall/vectorcall to undecorated symbols without warnings                         |
| --entry=<entry>                         | Name of entry point symbol                                                                          |
| --error-limit=<value>                   | Maximum number of errors to emit before stopping (0 = no limit)                                     |
| --exclude-all-symbols                   | Don't automatically export any symbols                                                              |
| --exclude-symbols=<symbol[,symbol,...]> | Exclude symbols from automatic export                                                               |
| --export-all-symbols                    | Export all symbols even if a def file or dllexport attributes are used                              |
| --fatal-warnings                        | Treat warnings as errors                                                                            |
| --file-alignment=<value>                | Set file alignment                                                                                  |
| --gc-sections                           | Remove unused sections                                                                              |
| --guard-cf                              | Enable Control Flow Guard                                                                           |
| --guard-longjmp                         | Enable Control Flow Guard long jump hardening (default for --guard-cf)                              |
| --heap=<value>                          | Set size of the initial heap                                                                        |
| --help                                  | Print option help                                                                                   |
| --high-entropy-va                       | Set the 'high entropy VA' flag                                                                      |
| --icf=<value>                           | Identical code folding                                                                              |
| --image-base=<value>                    | Base address of the program                                                                         |
| --insert-timestamp                      | Include PE header timestamp                                                                         |
| --kill-at                               | Remove @n from exported symbols                                                                     |
| --large-address-aware                   | Enable large addresses                                                                              |
| --lto-CGO<cgopt-level>                  | Codegen optimization level for LTO                                                                  |
| --lto-cs-profile-file=<value>           | Context sensitive profile file path                                                                 |
| --lto-cs-profile-generate               | Perform context sensitive PGO instrumentation                                                       |
| --lto-emit-asm                          | Emit assembly code                                                                                  |
| --lto-O<opt-level>                      | Optimization level for LTO                                                                          |
| --lto-sample-profile=<value>            | Sample profile file path                                                                            |
| -L <dir>                                | Add a directory to the library search path                                                          |
| -l <libName>                            | Root name of library to use                                                                         |
| --major-os-version=<value>              | Set the OS and subsystem major version                                                              |
| --major-subsystem-version=<value>       | Set the OS and subsystem major version                                                              |
| --Map=<value>                           | Output a linker map                                                                                 |
| --minor-os-version=<value>              | Set the OS and subsystem minor version                                                              |
| --minor-subsystem-version=<value>       | Set the OS and subsystem minor version                                                              |
| -m <value>                              | Set target emulation                                                                                |
| --no-allow-multiple-definition          | Do not allow multiple definitions (default)                                                         |
| --no-demangle                           | Do not demangle symbol names                                                                        |
| --no-dynamicbase                        | Disable ASLR                                                                                        |
| --no-fatal-warnings                     | Do not treat warnings as errors (default)                                                           |
| --no-gc-sections                        | Don't remove unused sections                                                                        |
| --no-guard-cf                           | Do not enable Control Flow Guard (default)                                                          |
| --no-guard-longjmp                      | Do not enable Control Flow Guard long jump hardening                                                |
| --no-insert-timestamp                   | Don't include PE header timestamp                                                                   |
| --no-seh                                | Set the 'no SEH' flag in the executable                                                             |
| --no-whole-archive                      | No longer include all object files for following archives                                           |
| -non_shared                             | Do not link against shared libraries                                                                |
| --nxcompat                              | Set the 'nxcompat' flag in the executable                                                           |
| --out-implib=<value>                    | Import library name                                                                                 |
| --output-def=<value>                    | Output def file                                                                                     |
| -o <path>                               | Path to file to write output                                                                        |
| --pdb=<value>                           | Output PDB debug info file, chosen implicitly if the argument is empty                              |
| --plugin-opt=-<value>                   | Specify an LLVM option for compatibility with LLVMgold.so                                           |
| --plugin-opt=cs-profile-generate        | Alias for --lto-cs-profile-generate                                                                 |
| --plugin-opt=cs-profile-path=<value>    | Alias for --lto-cs-profile-file                                                                     |
| --plugin-opt=dwo_dir=<value>            | Directory to store .dwo files when LTO and debug fission are used                                   |
| --plugin-opt=emit-asm                   | Alias for --lto-emit-asm                                                                            |
| --plugin-opt=jobs=<value>               | Alias for --thinlto-jobs=                                                                           |
| --plugin-opt=O<value>                   | Alias for --lto-O                                                                                   |
| --reproduce=<value>                     | Write a tar file containing input files and command line options to reproduce link                  |
| --require-defined=<value>               | Force symbol to be added to symbol table as an undefined one                                        |
| --section-alignment=<value>             | Set section alignment                                                                               |
| --shared                                | Build a shared object                                                                               |
| --stack=<value>                         | Set size of the initial stack                                                                       |
| -static                                 | Do not link against shared libraries                                                                |
| --strip-all                             | Omit all symbol information from the output binary                                                  |
| --strip-debug                           | Omit all debug information, but keep symbol information                                             |
| --subsystem=<value>                     | Specify subsystem                                                                                   |
| -S                                      | Omit all debug information, but keep symbol information                                             |
| -s                                      | Omit all symbol information from the output binary                                                  |
| --thinlto-cache-dir=<value>             | Path to ThinLTO cached object file directory                                                        |
| --thinlto-cache-policy=<value>          | Pruning policy for the ThinLTO cache                                                                |
| --thinlto-jobs=<value>                  | Number of ThinLTO jobs. Default to --threads=                                                       |
| --threads=<value>                       | Number of threads. '1' disables multi-threading. By default all available hardware threads are used |
| --tsaware                               | Set the 'Terminal Server aware' flag                                                                |
| --undefined=<value>                     | Include symbol in the link, if available                                                            |
| --verbose                               | Verbose mode                                                                                        |
| --version                               | Display the version number and exit                                                                 |
| -v                                      | Display the version number                                                                          |
| --whole-archive                         | Include all object files for following archives                                                     |
| --wrap=<symbol>                         | Use wrapper functions for symbol                                                                    |
| --Xlink=<arg>                           | Pass <arg> to the COFF linker                                                                       |
