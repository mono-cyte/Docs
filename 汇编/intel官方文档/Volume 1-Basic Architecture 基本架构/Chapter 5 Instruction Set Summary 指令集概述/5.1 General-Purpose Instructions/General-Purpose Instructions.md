# General-Purpose Instructions

The general-purpose instructions perform basic data movement, arithmetic, logic, program flow, and string operations
that programmers commonly use to write application and system software to run on Intel 64 and IA-32
processors. They operate on data contained in memory, in the general-purpose registers (EAX, EBX, ECX, EDX,
EDI, ESI, EBP, and ESP) and in the EFLAGS register. They also operate on address information contained in
memory, the general-purpose registers, and the segment registers (CS, DS, SS, ES, FS, and GS).

This group of instructions includes the data transfer, binary integer arithmetic, decimal arithmetic, logic operations,
shift and rotate, bit and byte operations, program control, string, flag control, segment register operations, and
miscellaneous subgroups. The sections that follow introduce each subgroup.

For more detailed information on general purpose-instructions, see Chapter 7, “Programming With General-
Purpose Instructions.”

## Data Transfer Instructions

The data transfer instructions move data between memory and the general-purpose and segment registers. They
also perform specific operations such as conditional moves, stack access, and data conversion.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr>
        <th>MOV</th>
        <th>Move data between general-purpose registers; move data between memory and generalpurpose
or segment registers; move immediates to general-purpose registers.</th>
    </tr>
    <tr>
       <th>CMOVE/CMOVZ</th>
       <th>Conditional move if equal/Conditional move if zero.</th>
    </tr>
    <tr>
       <th>CMOVNE/CMOVNZ</th>
       <th>Conditional move if not equal/Conditional move if not zero.</th>
    </tr>
    <tr>
       <th>CMOVA/CMOVNBE</th>
       <th>Conditional move if above/Conditional move if not below or equal.</th>
    </tr>
    <tr>
       <th>CMOVAE/CMOVNB</th>
       <th>Conditional move if above or equal/Conditional move if not below.</th>
    </tr>
    <tr>
       <th>CMOVB/CMOVNAE</th>
       <th>Conditional move if below/Conditional move if not above or equal.</th>
    </tr>
    <tr>
       <th>CMOVBE/CMOVNA</th>
       <th>Conditional move if below or equal/Conditional move if not above.</th>
    </tr>
    <tr>
       <th>CMOVG/CMOVNLE</th>
       <th>Conditional move if greater/Conditional move if not less or equal.</th>
    </tr>
    <tr>
       <th>CMOVGE/CMOVNL</th>
       <th>Conditional move if greater or equal/Conditional move if not less.</th>
    </tr>
    <tr>
       <th>CMOVL/CMOVNGE</th>
       <th>Conditional move if less/Conditional move if not greater or equal.</th>
    </tr>
    <tr>
       <th>CMOVLE/CMOVNG</th>
       <th>Conditional move if less or equal/Conditional move if not greater.</th>
    </tr>
    <tr>
       <th>CMOVC</th>
       <th>Conditional move if carry.</th>
    </tr>
    <tr>
       <th>CMOVNC</th>
       <th>Conditional move if not carry.</th>
    </tr>
    <tr>
       <th>CMOVO</th>
       <th>Conditional move if overflow.</th>
    </tr>
    <tr>
       <th>CMOVNO</th>
       <th>Conditional move if not overflow.</th>
    </tr>
    <tr>
       <th>CMOVS</th>
       <th>Conditional move if sign (negative).</th>
    </tr>
    <tr>
       <th>CMOVNS</th>
       <th>Conditional move if not sign (non-negative).</th>
    </tr>
    <tr>
       <th>CMOVP/CMOVPE</th>
       <th>Conditional move if parity/Conditional move if parity even.</th>
    </tr>
    <tr>
       <th>CMOVNP/CMOVPO</th>
       <th>Conditional move if not parity/Conditional move if parity odd.</th>
    </tr>
    <tr>
       <th>XCHG</th>
       <th>Exchange.</th>
    </tr>
    <tr>
       <th>BSWAP</th>
       <th>Byte swap.</th>
    </tr>
    <tr>
       <th>XADD</th>
       <th>Exchange and add.</th>
    </tr>
    <tr>
       <th>CMPXCHG</th>
       <th>Compare and exchange.</th>
    </tr>
    <tr>
       <th>CMPXCHG8B</th>
       <th>Compare and exchange 8 bytes.</th>
    </tr>
    <tr>
       <th>PUSH</th>
       <th>Push onto stack.</th>
    </tr>
    <tr>
       <th>POP</th>
       <th>Pop off of stack.</th>
    </tr>
    <tr>
       <th>PUSHA/PUSHAD</th>
       <th>Push general-purpose registers onto stack.</th>
    </tr>
    <tr>
       <th>POPA/POPAD</th>
       <th>Pop general-purpose registers from stack.</th>
    </tr>
    <tr>
       <th>CWD/CDQ</th>
       <th>Convert word to doubleword/Convert doubleword to quadword.</th>
    </tr>
    <tr>
       <th>CBW/CWDE</th>
       <th>Convert byte to word/Convert word to doubleword in EAX register.</th>
    </tr>
    <tr>
       <th>MOVSX</th>
       <th>Move and sign extend.</th>
    </tr>
    <tr>
       <th>MOVZX Move</th>
       <th>Move and zero extend.</th>
</table>

## Binary Arithmetic Instructions

The binary arithmetic instructions perform basic binary integer computations on byte, word, and doubleword integers
located in memory and/or the general purpose registers.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr>
        <th>ADCX</th>
        <th>Unsigned integer add with carry.</th>
    </tr>
    <tr>
        <th>ADOX</th>
        <th>Unsigned integer add with overflow.</th>
    </tr>
    <tr>
        <th>ADD</th>
        <th>Integer add.</th>
    </tr>
    <tr>
        <th>ADC</th>
        <th>Add with carry.</th>
    </tr>
    <tr>
        <th>SUB</th>
        <th>Subtract.</th>
    </tr>
    <tr>
        <th>SBB</th>
        <th>Subtract with borrow.</th>
    </tr>
    <tr>
        <th>IMUL</th>
        <th>Signed multiply.</th>
    </tr>
    <tr>
        <th>MUL</th>
        <th>Unsigned multiply.</th>
    </tr>
    <tr>
        <th>IDIV</th>
        <th>Signed divide.</th>
    </tr>
    <tr>
        <th>DIV</th>
        <th>Unsigned divide.</th>
    </tr>
    <tr>
        <th>INC</th>
        <th>Increment.</th>
    </tr>
    <tr>
        <th>DEC</th>
        <th>Decrement.</th>
    </tr>
    <tr>
        <th>NEG</th>
        <th>Negate.</th>
    </tr>
    <tr>
        <th>CMP</th>
        <th>Compare.</th>
    </tr>
</table>

## Decimal Arithmetic Instructions

The decimal arithmetic instructions perform decimal arithmetic on binary coded decimal (BCD) data.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr>
        <th>DAA</th>
        <th>Decimal adjust after addition.</th>
    </tr>
    <tr>
        <th>DAS</th>
        <th>Decimal adjust after subtraction.</th>
    </tr>
    <tr>
        <th>AAA</th>
        <th>ASCII adjust after addition.</th>
    </tr>
    <tr>
        <th>AAS</th>
        <th>ASCII adjust after subtraction.</th>
    </tr>
    <tr>
        <th>AAM</th>
        <th>ASCII adjust after multiplication.</th>
    </tr>
    <tr>
        <th>AAD</th>
        <th>ASCII adjust before division.</th>
    </tr>
</table>

## Logical Instructions

The logical instructions perform basic AND, OR, XOR, and NOT logical operations on byte, word, and doubleword
values.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr>
        <th>AND</th>
        <th>Perform bitwise logical AND.</th>
    </tr>
    <tr>
        <th>OR</th>
        <th>Perform bitwise logical OR.</th>
    </tr>
    <tr>
        <th>XOR</th>
        <th>Perform bitwise logical exclusive OR.</th>
    </tr>
    <tr>
        <th>NOT</th>
        <th>Perform bitwise logical NOT.</th>
    </tr>
</table>

## Shift and Rotate Instructions

The shift and rotate instructions shift and rotate the bits in word and doubleword operands.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr>
        <th>SAR</th>
        <th>Shift arithmetic right.</th>
    </tr>
    <tr>
        <th>SHR</th>
        <th>Shift logical right.</th>
    </tr>
    <tr>
        <th>SAL/SHL</th>
        <th>Shift arithmetic left/Shift logical left.</th>
    </tr>
    <tr>
        <th>SHRD</th>
        <th>Shift right double.</th>
    </tr>
    <tr>
        <th>SHLD</th>
        <th>Shift left double.</th>
    </tr>
    <tr>
        <th>ROR</th>
        <th>Rotate right.</th>
    </tr>
    <tr>
        <th>ROL</th>
        <th>Rotate left.</th>
    </tr>
    <tr>
        <th>RCR</th>
        <th>Rotate through carry right.</th>
    </tr>
    <tr>
        <th>RCL</th>
        <th>Rotate through carry left.</th>
    </tr>
</table>

## Bit and Byte Instructions

Bit instructions test and modify individual bits in word and doubleword operands. Byte instructions set the value of
a byte operand to indicate the status of flags in the EFLAGS register.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr>
        <th>BT</th>
        <th>Bit test.</th>
    </tr>
    <tr>
        <th>BTS</th>
        <th>Bit test and set.</th>
    </tr>
    <tr>
        <th>BTR</th>
        <th>Bit test and reset.</th>
    </tr>
    <tr>
        <th>BTC</th>
        <th>Bit test and complement.</th>
    </tr>
    <tr>
        <th>BSF</th>
        <th>Bit scan forward.</th>
    </tr>
    <tr>
        <th>BSR</th>
        <th>Bit scan reverse.</th>
    </tr>
    <tr>
        <th>SETE/SETZ</th>
        <th>Set byte if equal/Set byte if zero.</th>
    </tr>
    <tr>
        <th>SETNE/SETNZ</th>
        <th>Set byte if not equal/Set byte if not zero.</th>
    </tr>
    <tr>
        <th>SETA/SETNBE</th>
        <th>Set byte if above/Set byte if not below or equal.</th>
    </tr>
    <tr>
        <th>SETAE/SETNB/SETNC</th>
        <th>Set byte if above or equal/Set byte if not below/Set byte if not carry.</th>
    </tr>
    <tr>
        <th>SETB/SETNAE/SETC</th>
        <th>Set byte if below/Set byte if not above or equal/Set byte if carry.</th>
    </tr>
    <tr>
        <th>SETBE/SETNA</th>
        <th>Set byte if below or equal/Set byte if not above.</th>
    </tr>
    <tr>
        <th>SETG/SETNLE</th>
        <th>Set byte if greater/Set byte if not less or equal.</th>
    </tr>
    <tr>
        <th>SETGE/SETNL</th>
        <th>Set byte if greater or equal/Set byte if not less.</th>
    </tr>
    <tr>
        <th>SETL/SETNGE</th>
        <th>Set byte if less/Set byte if not greater or equal.</th>
    </tr>
    <tr>
        <th>SETLE/SETNG</th>
        <th>Set byte if less or equal/Set byte if not greater.</th>
    </tr>
    <tr>
        <th>SETS</th>
        <th>Set byte if sign (negative).</th>
    </tr>
    <tr>
        <th>SETNS</th>
        <thSet byte if not sign (non-negative).</th>
    </tr>
    <tr>
        <th>SETO</th>
        <th>Set byte if overflow.</th>
    </tr>
    <tr>
        <th>SETNO</th>
        <th>Set byte if not overflow.</th>
    </tr>
    <tr>
        <th>SETPE/SETP</th>
        <th>Set byte if parity even/Set byte if parity.</th>
    </tr>
    <tr>
        <th>SETPO/SETNP</th>
        <th>Set byte if parity odd/Set byte if not parity.</th>
    </tr>
    <tr>
        <th>TEST</th>
        <th>Logical compare.</th>
    </tr>
    <tr>
        <th>CRC32</th>
        <th>Provides hardware acceleration to calculate cyclic redundancy checks for fast and efficient
implementation of data integrity protocols.</th>
    </tr>
    <tr>
        <th>POPCNT</th>
        <th>Calculates of number of bits set to 1 in the second operand (source) and returns the count
in the first operand (a destination register).</th>
    </tr>
</table>

1. Processor support of CRC32 is enumerated by CPUID.01:ECX[SSE4.2] = 1
2. Processor support of POPCNT is enumerated by CPUID.01:ECX[POPCNT] = 1

## Control Transfer Instructions

The control transfer instructions provide jump, conditional jump, loop, and call and return operations to control
program flow.

<table>
    <tr>
      <th>Instruction</th>
      <th>Description</th>
    </tr>
    <tr><td>JMP</td><td>Jump.</td></tr>
    <tr><td>JE/JZ</td><td>Jump if equal/Jump if zero.</td></tr>
    <tr><td>JNE/JNZ</td><td>Jump if not equal/Jump if not zero.</td></tr>
    <tr><td>JA/JNBE</td><td>Jump if above/Jump if not below or equal.</td></tr>
    <tr><td>JAE/JNB</td><td>Jump if above or equal/Jump if not below.</td></tr>
    <tr><td>JB/JNAE</td><td>Jump if below/Jump if not above or equal.</td></tr>
    <tr><td>JBE/JNA</td><td>Jump if below or equal/Jump if not above.</td></tr>
    <tr><td>JG/JNLE</td><td>Jump if greater/Jump if not less or equal.</td></tr>
    <tr><td>JGE/JNL</td><td>Jump if greater or equal/Jump if not less.</td></tr>
    <tr><td>JL/JNGE</td><td>Jump if less/Jump if not greater or equal.</td></tr>
    <tr><td>JLE/JNG</td><td>Jump if less or equal/Jump if not greater.</td></tr>
    <tr><td>JC</td><td>Jump if carry.</td></tr>
    <tr><td>JNC</td><td>Jump if not carry.</td></tr>
    <tr><td>JO</td><td>Jump if overflow.</td></tr>
    <tr><td>JNO</td><td>Jump if not overflow.</td></tr>
    <tr><td>JS</td><td>Jump if sign (negative).</td></tr>
    <tr><td>JNS</td><td>Jump if not sign (non-negative).</td></tr>
    <tr><td>JPO/JNP</td><td>Jump if parity odd/Jump if not parity.</td></tr>
    <tr><td>JPE/JP</td><td>Jump if parity even/Jump if parity.</td></tr>
    <tr><td>JCXZ/JECXZ</td><td>Jump register CX zero/Jump register ECX zero.</td></tr>
    <tr><td>LOOP</td><td>Loop with ECX counter.</td></tr>
    <tr><td>LOOPZ/LOOPE</td><td>Loop with ECX and zero/Loop with ECX and equal.</td></tr>
    <tr><td>LOOPNZ/LOOPNE</td><td>Loop with ECX and not zero/Loop with ECX and not equal.</td></tr>
    <tr><td>CALL</td><td>Call procedure.</td></tr>
    <tr><td>RET</td><td>Return.</td></tr>
    <tr><td>IRET</td><td>Return from interrupt.</td></tr>
    <tr><td>INT</td><td>Software interrupt.</td></tr>
    <tr><td>INTO</td><td>Interrupt on overflow.</td></tr>
    <tr><td>BOUND</td><td>Detect value out of range.</td></tr>
    <tr><td>ENTER</td><td>High-level procedure entry.</td></tr>
    <tr><td>LEAVE</td><td>High-level procedure exit.</td></tr>
</table>

## String Instructions

The string instructions operate on strings of bytes, allowing them to be moved to and from memory.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr><td>MOVS/MOVSB</td><td>Move string/Move byte string.</td></tr>
    <tr><td>MOVS/MOVSW</td><td>Move string/Move word string.</td></tr>
    <tr><td>MOVS/MOVSD</td><td>Move string/Move doubleword string.</td></tr>
    <tr><td>CMPS/CMPSB</td><td>Compare string/Compare byte string.</td></tr>
    <tr><td>CMPS/CMPSW</td><td>Compare string/Compare word string.</td></tr>
    <tr><td>CMPS/CMPSD</td><td>Compare string/Compare doubleword string.</td></tr>
    <tr><td>SCAS/SCASB</td><td>Scan string/Scan byte string.</td></tr>
    <tr><td>SCAS/SCASW</td><td>Scan string/Scan word string.</td></tr>
    <tr><td>SCAS/SCASD</td><td>Scan string/Scan doubleword string.</td></tr>
    <tr><td>LODS/LODSB</td><td>Load string/Load byte string.</td></tr>
    <tr><td>LODS/LODSW</td><td>Load string/Load word string.</td></tr>
    <tr><td>LODS/LODSD</td><td>Load string/Load doubleword string.</td></tr>
    <tr><td>STOS/STOSB</td><td>Store string/Store byte string.</td></tr>
    <tr><td>STOS/STOSW</td><td>Store string/Store word string.</td></tr>
    <tr><td>STOS/STOSD</td><td>Store string/Store doubleword string.</td></tr>
    <tr><td>REP</td><td>Repeat while ECX not zero.</td></tr>
    <tr><td>REPE/REPZ</td><td>Repeat while equal/Repeat while zero.</td></tr>
    <tr><td>REPNE/REPNZ</td><td>Repeat while not equal/Repeat while not zero.</td></tr>
</table>

## I/O Instructions

These instructions move data between the processor’s I/O ports and a register or memory.

<table>
    <tr>
      <th>Instruction</th>
      <th>Description</th>
    </tr>
    <tr><td>IN</td><td>Read from a port.</td></tr>
    <tr><td>OUT</td><td>Write to a port.</td></tr>
    <tr><td>INS/INSB</td><td>Input string from port/Input byte string from port.</td></tr>
    <tr><td>INS/INSW</td><td>Input string from port/Input word string from port.</td></tr>
    <tr><td>INS/INSD</td><td>Input string from port/Input doubleword string from port.</td></tr>
    <tr><td>OUTS/OUTSB</td><td>Output string to port/Output byte string to port.</td></tr>
    <tr><td>OUTS/OUTSW</td><td>Output string to port/Output word string to port.</td></tr>
    <tr><td>OUTS/OUTSD</td><td>Output string to port/Output doubleword string to port.</td></tr>
</table>

## Enter and Leave Instructions

These instructions provide machine-language support for procedure calls in block-structured languages.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr>
        <th>ENTER</th>
        <th>High-level procedure entry.</th>
    </tr>
    <tr>
        <th>LEAVE</th>
        <th>High-level procedure exit.</th>
    </tr>
</table>

## Flag Control (EFLAG) Instructions

The flag control instructions operate on the flags in the EFLAGS register.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr><td>STC</td><td>Set carry flag.</td></tr>
    <tr><td>CLC</td><td>Clear the carry flag.</td></tr>
    <tr><td>CMC</td><td>Complement the carry flag.</td></tr>
    <tr><td>CLD</td><td>Clear the direction flag.</td></tr>
    <tr><td>STD</td><td>Set direction flag.</td></tr>
    <tr><td>LAHF</td><td>Load flags into AH register.</td></tr>
    <tr><td>SAHF</td><td>Store AH register into flags.</td></tr>
    <tr><td>PUSHF/PUSHFD</td><td>Push EFLAGS onto stack.</td></tr>
    <tr><td>POPF/POPFD</td><td>Pop EFLAGS from stack.</td></tr>
    <tr><td>STI</td><td>Set interrupt flag.</td></tr>
    <tr><td>CLI</td><td>Clear the interrupt flag.</td></tr>
</table>

## Segment Register Instructions

The segment register instructions allow far pointers (segment addresses) to be loaded into the segment registers.

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr><td>LDS</td><td>Load far pointer using DS.</td></tr>
    <tr><td>LES</td><td>Load far pointer using ES.</td></tr>
    <tr><td>LFS</td><td>Load far pointer using FS.</td></tr>
    <tr><td>LGS</td><td>Load far pointer using GS.</td></tr>
    <tr><td>LSS</td><td>Load far pointer using SS.</td></tr>
</table>

## Miscellaneous Instructions

The miscellaneous instructions provide such functions as loading an effective address, executing a “no-operation,”
and retrieving processor identification information.

<table>
    <tr>
      <th>Instruction</th>
      <th>Description</th>
    </tr>
    <tr>
      <td>LEA</td>
      <td>Load effective address.</td>
    </tr>
    <tr>
      <td>NOP</td>
      <td>No operation.</td>
    </tr>
    <tr>
      <td>UD</td>
      <td>Undefined instruction.</td>
    </tr>
    <tr>
      <td>XLAT/XLATB</td>
      <td>Table lookup translation.</td>
    </tr>
    <tr>
      <td>CPUID</td>
      <td>Processor identification.</td>
    </tr>
    <tr>
      <td>MOVBE</td>
      <td>Move data after swapping data bytes.</td>
    </tr>
    <tr>
      <td>PREFETCHW</td>
      <td>Prefetch data into cache in anticipation of write.</td>
    </tr>
    <tr>
      <td>PREFETCHWT1</td>
      <td>Prefetch hint T1 with intent to write.</td>
    </tr>
    <tr>
      <td>CLFLUSH</td>
      <td>Flushes and invalidates a memory operand and its associated cache line from all levels of the processor’s cache hierarchy.</td>
    </tr>
    <tr>
      <td>CLFLUSHOPT</td>
      <td>Flushes and invalidates a memory operand and its associated cache line from all levels of the processor’s cache hierarchy with optimized memory system throughput.</td>
    </tr>
</table>

1. Processor support of MOVBE is enumerated by CPUID.01:ECX.MOVBE[bit 22] = 1.

## User Mode Extended State Save/Restore Instructions

<table>
    <tr>
        <th>Instruction</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>XSAVE</td>
        <td>Save processor extended states to memory.</td>
    </tr>
    <tr>
        <td>XSAVEC</td>
        <td>Save processor extended states with compaction to memory.</td>
    </tr>
    <tr>
        <td>XSAVEOPT</td>
        <td>Save processor extended states to memory, optimized.</td>
    </tr>
    <tr>
        <td>XRSTOR</td>
        <td>Restore processor extended states from memory.</td>
    </tr>
    <tr>
        <td>XGETBV</td>
        <td>Reads the state of an extended control register.</td>
    </tr>
</table>

## Random Number Generator Instructions

<table>
    <tr>
      <th>Instruction</th>
      <th>Description</th>
    </tr>
    <tr>
      <td>RDRAND</td>
      <td>Retrieves a random number generated from hardware.</td>
    </tr>
    <tr>
      <td>RDSEED</td>
      <td>Retrieves a random number generated from hardware.</td>
    </tr>
</table>

## BMI1 and BMI2 Instructions

<table>
    <tr>
      <th>Instruction</th>
      <th>Description</th>
    </tr>
    <tr>
      <td>ANDN</td>
      <td>Bitwise AND of first source with inverted second source operands.</td>
    </tr>
    <tr>
      <td>BEXTR</td>
      <td>Contiguous bitwise extract.</td>
    </tr>
    <tr>
      <td>BLSI</td>
      <td>Extract lowest set bit.</td>
    </tr>
    <tr>
      <td>BLSMSK</td>
      <td>Set all lower bits below first set bit to 1.</td>
    </tr>
    <tr>
      <td>BLSR</td>
      <td>Reset lowest set bit.</td>
    </tr>
    <tr>
      <td>BZHI</td>
      <td>Zero high bits starting from specified bit position.</td>
    </tr>
    <tr>
      <td>LZCNT</td>
      <td>Count the number of leading zero bits.</td>
    </tr>
    <tr>
      <td>MULX</td>
      <td>Unsigned multiply without affecting arithmetic flags.</td>
    </tr>
    <tr>
      <td>PDEP</td>
      <td>Parallel deposit of bits using a mask.</td>
    </tr>
    <tr>
      <td>PEXT</td>
      <td>Parallel extraction of bits using a mask.</td>
    </tr>
    <tr>
      <td>RORX</td>
      <td>Rotate right without affecting arithmetic flags.</td>
    </tr>
    <tr>
      <td>SARX</td>
      <td>Shift arithmetic right.</td>
    </tr>
    <tr>
      <td>SHLX</td>
      <td>Shift logic left.</td>
    </tr>
    <tr>
      <td>SHRX</td>
      <td>Shift logic right.</td>
    </tr>
    <tr>
      <td>TZCNT</td>
      <td>Count the number of trailing zero bits.</td>
    </tr>
</table>

### Detection of VEX-Encoded GPR Instructions, LZCNT, TZCNT, and PREFETCHW

VEX-encoded general-purpose instructions do not operate on any vector registers.

There are separate feature flags for the following subsets of instructions that operate on general purpose registers, and the detection requirements for hardware support are:

CPUID.(EAX=07H, ECX=0H):EBX.BMI1[bit 3]: if 1 indicates the processor supports the first group of advanced bit
manipulation extensions (ANDN, BEXTR, BLSI, BLSMSK, BLSR, TZCNT);

CPUID.(EAX=07H, ECX=0H):EBX.BMI2[bit 8]: if 1 indicates the processor supports the second group of advanced
bit manipulation extensions (BZHI, MULX, PDEP, PEXT, RORX, SARX, SHLX, SHRX);

CPUID.EAX=80000001H:ECX.LZCNT[bit 5]: if 1 indicates the processor supports the LZCNT instruction.

CPUID.EAX=80000001H:ECX.PREFTEHCHW[bit 8]: if 1 indicates the processor supports the PREFTEHCHW instruction.

CPUID.(EAX=07H, ECX=0H):ECX.PREFTEHCHWT1[bit 0]: if 1 indicates the processor supports the PREFTEHCHWT1
instruction.