# 3.1 Interpreting the Instruction Reference Pages

This section describes the format of information contained in the instruction reference pages in this chapter. It
explains notational conventions and abbreviations used in these sections.

## 3.1.1 Instruction Format

The following is an example of the format used for each instruction description in this chapter. The heading below
introduces the example. The table below provides an example summary table.

CMC—Complement Carry Flag [this is an example]

<table border="1">
    <tr><th>Opcode</th><th>Instruction</th><th>Op/En</th><th>64/32-bit Mode</th><th>CPUID Feature Flag</th><th>Description</th></tr>
    <tr><th>F5</th><th>CMC</th><th>ZO</th><th>V/V</th><th>N/A</th><th>Complement carry flag.</th></tr>
</table>

Instruction Operand Encoding

<table border="1">
    <tr><th>Op/En</th><th>Operand 1</th><th>Operand 2</th><th>Operand 3</th><th>Operand 4</th></tr>
    <tr><th>20</th><th>N/A</th><th>N/A</th><th>N/A</th><th>N/A</th></tr>
</table>

### 3.1.1.1 Opcode Column in the Instruction Summary Table (Instructions without VEX Prefix)

The “Opcode” column in the table above shows the object code produced for each form of the instruction. When
possible, codes are given as hexadecimal bytes in the same order in which they appear in memory. Definitions of
entries other than hexadecimal bytes are as follows:

- NP — Indicates the use of 66/F2/F3 prefixes (beyond those already part of the instructions opcode) are not
allowed with the instruction. Such use will either cause an invalid-opcode exception (#UD) or result in the
encoding for a different instruction.
- NFx — Indicates the use of F2/F3 prefixes (beyond those already part of the instructions opcode) are not
allowed with the instruction. Such use will either cause an invalid-opcode exception (#UD) or result in the
encoding for a different instruction.
- REX.W — Indicates the use of a REX prefix that affects operand size or instruction semantics. The ordering of
the REX prefix and other optional/mandatory instruction prefixes are discussed Chapter 2. Note that REX
prefixes that promote legacy instructions to 64-bit behavior are not listed explicitly in the opcode column.
- /digit — A digit between 0 and 7 indicates that the ModR/M byte of the instruction uses only the r/m (register
or memory) operand. The reg field contains the digit that provides an extension to the instruction's opcode.
- /r — Indicates that the ModR/M byte of the instruction contains a register operand and an r/m operand.
- cb, cw, cd, cp, co, ct — A 1-byte (cb), 2-byte (cw), 4-byte (cd), 6-byte (cp), 8-byte (co) or 10-byte (ct) value
following the opcode. This value is used to specify a code offset and possibly a new value for the code segment
register.
- ib, iw, id, io — A 1-byte (ib), 2-byte (iw), 4-byte (id) or 8-byte (io) immediate operand to the instruction that
follows the opcode, ModR/M bytes or scale-indexing bytes. The opcode determines if the operand is a signed
value. All words, doublewords, and quadwords are given with the low-order byte first.
- +rb, +rw, +rd, +ro — Indicated the lower 3 bits of the opcode byte is used to encode the register operand
without a modR/M byte. The instruction lists the corresponding hexadecimal value of the opcode byte with low
3 bits as 000b. In non-64-bit mode, a register code, from 0 through 7, is added to the hexadecimal value of the
opcode byte. In 64-bit mode, indicates the four bit field of REX.b and opcode[2:0] field encodes the register
operand of the instruction. “+ro” is applicable only in 64-bit mode. See Table 3-1 for the codes.
- +i — A number used in floating-point instructions when one of the operands is ST(i) from the FPU register stack.
The number i (which can range from 0 to 7) is added to the hexadecimal byte given at the left of the plus sign
to form a single opcode byte.

Register Codes Associated With +rb, +rw, +rd, +ro

<table border="1">
    <tr><th colspan = "3">byte register</th><th colspan = "3">word register</th><th colspan = "3">dword register</th><th colspan = "3"><br>quadword register</br>(64-Bit Mode only)</th></tr>
    <tr><th>Register</th><th>REX.B</th><th>Reg Field</th><th>Register</th><th>REX.B</th><th>Reg Field</th><th>Register</th><th>REX.B</th><th>Reg Field</th><th>Register</th><th>REX.B</th><th>Reg Field</th></tr>
    <tr>
    <td>AL</td>
    <td>None</td>
    <td>0</td>
    <td>AX</td>
    <td>None</td>
    <td>0</td>
    <td>EAX</td>
    <td>None</td>
    <td>0</td>
    <td>RAX</td>
    <td>None</td>
    <td>0</td>
</tr>
<tr>
    <td>CL</td>
    <td>None</td>
    <td>1</td>
    <td>CX</td>
    <td>None</td>
    <td>1</td>
    <td>ECX</td>
    <td>None</td>
    <td>1</td>
    <td>RCX</td>
    <td>None</td>
    <td>1</td>
</tr>
<tr>
    <td>DL</td>
    <td>None</td>
    <td>2</td>
    <td>DX</td>
    <td>None</td>
    <td>2</td>
    <td>EDX</td>
    <td>None</td>
    <td>2</td>
    <td>RDX</td>
    <td>None</td>
    <td>2</td>
</tr>
<tr>
    <td>BL</td>
    <td>None</td>
    <td>3</td>
    <td>BX</td>
    <td>None</td>
    <td>3</td>
    <td>EBX</td>
    <td>None</td>
    <td>3</td>
    <td>RBX</td>
    <td>None</td>
    <td>3</td>
</tr>
<tr>
    <td>AH</td>
    <td>N.E.</td>
    <td>4</td>
    <td>SP</td>
    <td>None</td>
    <td>4</td>
    <td>ESP</td>
    <td>None</td>
    <td>4</td>
    <td>N/A</td>
    <td>N/A</td>
    <td>N/A</td>
</tr>
<tr>
    <td>CH</td>
    <td>N.E.</td>
    <td>5</td>
    <td>BP</td>
    <td>None</td>
    <td>5</td>
    <td>EBP</td>
    <td>None</td>
    <td>5</td>
    <td>N/A</td>
    <td>N/A</td>
    <td>N/A</td>
</tr>
<tr>
    <td>DH</td>
    <td>N.E.</td>
    <td>6</td>
    <td>SI</td>
    <td>None</td>
    <td>6</td>
    <td>ESI</td>
    <td>None</td>
    <td>6</td>
    <td>N/A</td>
    <td>N/A</td>
    <td>N/A</td>
</tr>
<tr>
    <td>BH</td>
    <td>N.E.</td>
    <td>7</td>
    <td>DI</td>
    <td>None</td>
    <td>7</td>
    <td>EDI</td>
    <td>None</td>
    <td>7</td>
    <td>N/A</td>
    <td>N/A</td>
    <td>N/A</td>
</tr>
<tr>
    <td>SPL</td>
    <td>Yes</td>
    <td>4</td>
    <td>SP</td>
    <td>None</td>
    <td>4</td>
    <td>ESP</td>
    <td>None</td>
    <td>4</td>
    <td>RSP</td>
    <td>None</td>
    <td>4</td>
</tr>
<tr>
    <td>BPL</td>
    <td>Yes</td>
    <td>5</td>
    <td>BP</td>
    <td>None</td>
    <td>5</td>
    <td>EBP</td>
    <td>None</td>
    <td>5</td>
    <td>RBP</td>
    <td>None</td>
    <td>5</td>
</tr>
<tr>
    <td>SIL</td>
    <td>Yes</td>
    <td>6</td>
    <td>SI</td>
    <td>None</td>
    <td>6</td>
    <td>ESI</td>
    <td>None</td>
    <td>6</td>
    <td>RSI</td>
    <td>None</td>
    <td>6</td>
</tr>
<tr>
    <td>DIL</td>
    <td>Yes</td>
    <td>7</td>
    <td>DI</td>
    <td>None</td>
    <td>7</td>
    <td>EDI</td>
    <td>None</td>
    <td>7</td>
    <td>RDI</td>
    <td>None</td>
    <td>7</td>
</tr>
<tr>
    <td colspan = "12">Registers R8 - R15 (see below): Available in 64-Bit Mode Only</td>
</tr>
<tr>
    <td>R8B</td>
    <td>Yes</td>
    <td>0</td>
    <td>R8W</td>
    <td>Yes</td>
    <td>0</td>
    <td>R8D</td>
    <td>Yes</td>
    <td>0</td>
    <td>R8</td>
    <td>Yes</td>
    <td>0</td>
</tr>
<tr>
    <td>R9B</td>
    <td>Yes</td>
    <td>1</td>
    <td>R9W</td>
    <td>Yes</td>
    <td>1</td>
    <td>R9D</td>
    <td>Yes</td>
    <td>1</td>
    <td>R9</td>
    <td>Yes</td>
    <td>1</td>
</tr>
<tr>
    <td>R10B</td>
    <td>Yes</td>
    <td>2</td>
    <td>R10W</td>
    <td>Yes</td>
    <td>2</td>
    <td>R10D</td>
    <td>Yes</td>
    <td>2</td>
    <td>R10</td>
    <td>Yes</td>
    <td>2</td>
</tr>
<tr>
    <td>R11B</td>
    <td>Yes</td>
    <td>3</td>
    <td>R11W</td>
    <td>Yes</td>
    <td>3</td>
    <td>R11D</td>
    <td>Yes</td>
    <td>3</td>
    <td>R11</td>
    <td>Yes</td>
    <td>3</td>
</tr>
<tr>
    <td>R12B</td>
    <td>Yes</td>
    <td>4</td>
    <td>R12W</td>
    <td>Yes</td>
    <td>4</td>
    <td>R12D</td>
    <td>Yes</td>
    <td>4</td>
    <td>R12</td>
    <td>Yes</td>
    <td>4</td>
</tr>
<tr>
    <td>R13B</td>
    <td>Yes</td>
    <td>5</td>
    <td>R13W</td>
    <td>Yes</td>
    <td>5</td>
    <td>R13D</td>
    <td>Yes</td>
    <td>5</td>
    <td>R13</td>
    <td>Yes</td>
    <td>5</td>
</tr>
<tr>
    <td>R14B</td>
    <td>Yes</td>
    <td>6</td>
    <td>R14W</td>
    <td>Yes</td>
    <td>6</td>
    <td>R14D</td>
    <td>Yes</td>
    <td>6</td>
    <td>R14</td>
    <td>Yes</td>
    <td>6</td>
</tr>
<tr>
    <td>R15B</td>
    <td>Yes</td>
    <td>7</td>
    <td>R15W</td>
    <td>Yes</td>
    <td>7</td>
    <td>R15D</td>
    <td>Yes</td>
    <td>7</td>
    <td>R15</td>
    <td>Yes</td>
    <td>7</td>
</tr>
</table>

### 3.1.1.2 Opcode Column in the Instruction Summary Table (Instructions with VEX prefix)

In the Instruction Summary Table, the Opcode column presents each instruction encoded using the VEX prefix in
following form (including the modR/M byte if applicable, the immediate byte if applicable):

**VEX.[128,256].[66,F2,F3].0F/0F3A/0F38.[W0,W1] opcode [/r] [/ib,/is4]**

- VEX — Indicates the presence of the VEX prefix is required. The VEX prefix can be encoded using the threebyte
form (the first byte is C4H), or using the two-byte form (the first byte is C5H). The two-byte form of VEX
only applies to those instructions that do not require the following fields to be encoded: VEX.mmmmm, VEX.W,
VEX.X, VEX.B. Refer to Section 2.3 for more detail on the VEX prefix.

The encoding of various sub-fields of the VEX prefix is described using the following notations:

— 128,256: VEX.L field can be 0 (denoted by VEX.128, VEX.L0, or VEX.LZ) or 1 (denoted by VEX.256 or
VEX.L1). The VEX.L field can be encoded using either the 2-byte or 3-byte form of the VEX prefix. The
presence of the notation VEX.256 or VEX.128 in the opcode column should be interpreted as follows:

- If VEX.256 is present in the opcode column: The semantics of the instruction must be encoded with
VEX.L = 1. An attempt to encode this instruction with VEX.L= 0 can result in one of two situations: (a)
if VEX.128 version is defined, the processor will behave according to the defined VEX.128 behavior; (b)
an #UD occurs if there is no VEX.128 version defined.

- If VEX.128 is present in the opcode column but there is no VEX.256 version defined for the same
opcode byte: Two situations apply: (a) For VEX-encoded, 128-bit SIMD integer instructions, software
must encode the instruction with VEX.L = 0. The processor will treat the opcode byte encoded with
VEX.L= 1 by causing an #UD exception; (b) For VEX-encoded, 128-bit packed floating-point instructions,
software must encode the instruction with VEX.L = 0. The processor will treat the opcode byte
encoded with VEX.L= 1 by causing an #UD exception (e.g., VMOVLPS).

- If VEX.L0 or VEX.L1 is present in the opcode column: The specified VEX.L value is required for encoding
this instruction but does not have the connotation of specifying vector length.

- If VEX.LIG is present in the opcode column: The VEX.L value is ignored. This generally applies to VEXencoded
scalar SIMD floating-point instructions. Scalar SIMD floating-point instruction can be distinguished
from the mnemonic of the instruction. Generally, the last two letters of the instruction
mnemonic would be either “SS”, “SD”, or “SI” for SIMD floating-point conversion instructions.

- If VEX.LZ is present in the opcode column: The VEX.L must be encoded to be 0B, an #UD occurs if
VEX.L is not zero.

— 66,F2,F3: The presence or absence of these values map to the VEX.pp field encodings. If absent, this
corresponds to VEX.pp=00B. If present, the corresponding VEX.pp value affects the “opcode” byte in the
same way as if a SIMD prefix (66H, F2H or F3H) does to the ensuing opcode byte. Thus a non-zero encoding
of VEX.pp may be considered as an implied 66H/F2H/F3H prefix. The VEX.pp field may be encoded using
either the 2-byte or 3-byte form of the VEX prefix.

— 0F,0F3A,0F38: The presence maps to a valid encoding of the VEX.mmmmm field. Only three encoded
values of VEX.mmmmm are defined as valid, corresponding to the escape byte sequence of 0FH, 0F3AH,
and 0F38H. The effect of a valid VEX.mmmmm encoding on the ensuing opcode byte is same as if the
corresponding escape byte sequence on the ensuing opcode byte for non-VEX encoded instructions. Thus a
valid encoding of VEX.mmmmm may be consider as an implies escape byte sequence of either 0FH, 0F3AH
or 0F38H. The VEX.mmmmm field must be encoded using the 3-byte form of VEX prefix.

— 0F,0F3A,0F38 and 2-byte/3-byte VEX: The presence of 0F3A and 0F38 in the opcode column implies
that opcode can only be encoded by the three-byte form of VEX. The presence of 0F in the opcode column
does not preclude the opcode to be encoded by the two-byte of VEX if the semantics of the opcode does not
require any subfield of VEX not present in the two-byte form of the VEX prefix.

— W0: VEX.W=0.

— W1: VEX.W=1.

— The presence of W0/W1 in the opcode column applies to two situations: (a) it is treated as an extended
opcode bit, (b) the instruction semantics support an operand size promotion to 64-bit of a general-purpose
register operand or a 32-bit memory operand. The presence of W1 in the opcode column implies the opcode
must be encoded using the 3-byte form of the VEX prefix. The presence of W0 in the opcode column does
not preclude the opcode to be encoded using the C5H form of the VEX prefix, if the semantics of the opcode
does not require other VEX subfields not present in the two-byte form of the VEX prefix. Please see Section
2.3 on the subfield definitions within VEX.

— WIG: can use C5H form (if not requiring VEX.mmmmm) or VEX.W value is ignored in the C4H form of VEX
prefix.

— If WIG is present, the instruction may be encoded using either the two-byte form or the three-byte form of
VEX. When encoding the instruction using the three-byte form of VEX, the value of VEX.W is ignored.

- opcode — Instruction opcode.

- /is4 — An 8-bit immediate byte is present containing a source register specifier in either imm8[7:4] (for 64-
bit mode) or imm8[6:4] (for 32-bit mode), and instruction-specific payload in imm8[3:0].

- In general, the encoding o f VEX.R, VEX.X, VEX.B field are not shown explicitly in the opcode column. The
encoding scheme of VEX.R, VEX.X, VEX.B fields must follow the rules defined in Section 2.3.

**EVEX.[128,256,512,LLIG].[66,F2,F3].0F/0F3A/0F38.[W0,W1,WIG] opcode [/r] [/ib]**

- EVEX — The EVEX prefix is encoded using the four-byte form (the first byte is 62H). Refer to Section 2.7.1 for
more detail on the EVEX prefix.

The encoding of various sub-fields of the EVEX prefix is described using the following notations:

— 128, 256, 512, LLIG: This corresponds to the vector length; three values are allowed by EVEX: 512-bit,
256-bit and 128-bit. Alternatively, vector length is ignored (LIG) for certain instructions; this typically
applies to scalar instructions operating on one data element of a vector register.

— 66,F2,F3: The presence of these value maps to the EVEX.pp field encodings. The corresponding VEX.pp
value affects the “opcode” byte in the same way as if a SIMD prefix (66H, F2H or F3H) does to the ensuing
opcode byte. Thus a non-zero encoding of VEX.pp may be considered as an implied 66H/F2H/F3H prefix.

— 0F,0F3A,0F38: The presence maps to a valid encoding of the EVEX.mmm field. Only three encoded values
of EVEX.mmm are defined as valid, corresponding to the escape byte sequence of 0FH, 0F3AH, and 0F38H.
The effect of a valid EVEX.mmm encoding on the ensuing opcode byte is the same as if the corresponding
escape byte sequence on the ensuing opcode byte for non-EVEX encoded instructions. Thus a valid
encoding of EVEX.mmm may be considered as an implied escape byte sequence of either 0FH, 0F3AH or
0F38H.

— W0: EVEX.W=0.

— W1: EVEX.W=1.

— WIG: EVEX.W bit ignored

- opcode — Instruction opcode.
- In general, the encoding of EVEX.R and R’, EVEX.X and X’, and EVEX.B and B’ fields are not shown explicitly in
the opcode column.

NOTE

Previously, the terms NDS, NDD, and DDS were used in instructions with an EVEX (or VEX) prefix.
These terms indicated that the vvvv field was valid for encoding, and specified register usage.
These terms are no longer necessary and are redundant with the instruction operand encoding
tables provided with each instruction. The instruction operand encoding tables give explicit details
on all operands, indicating where every operand is stored and if they are read or written. If vvvv is
not listed as an operand in the instruction operand encoding table, then EVEX (or VEX) vvvv must
be 0b1111.

### 3.1.1.3 Instruction Column in the Opcode Summary Table

The “Instruction” column gives the syntax of the instruction statement as it would appear in an ASM386 program.
The following is a list of the symbols used to represent operands in the instruction statements:

- rel8 — A relative address in the range from 128 bytes before the end of the instruction to 127 bytes after the
end of the instruction.
- rel16, rel32 — A relative address within the same code segment as the instruction assembled. The rel16
symbol applies to instructions with an operand-size attribute of 16 bits; the rel32 symbol applies to instructions
with an operand-size attribute of 32 bits.
- ptr16:16, ptr16:32 — A far pointer, typically to a code segment different from that of the instruction. The
notation 16:16 indicates that the value of the pointer has two parts. The value to the left of the colon is a 16-
bit selector or value destined for the code segment register. The value to the right corresponds to the offset
within the destination segment. The ptr16:16 symbol is used when the instruction's operand-size attribute is
16 bits; the ptr16:32 symbol is used when the operand-size attribute is 32 bits.
- r8 — One of the byte general-purpose registers: AL, CL, DL, BL, AH, CH, DH, BH, BPL, SPL, DIL, and SIL; or
one of the byte registers (R8B - R15B) available when using REX.R and 64-bit mode.
- r16 — One of the word general-purpose registers: AX, CX, DX, BX, SP, BP, SI, DI; or one of the word registers
(R8-R15) available when using REX.R and 64-bit mode.
- r32 — One of the doubleword general-purpose registers: EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI; or one of
the doubleword registers (R8D - R15D) available when using REX.R in 64-bit mode.
- r64 — One of the quadword general-purpose registers: RAX, RBX, RCX, RDX, RDI, RSI, RBP, RSP, R8–R15.
These are available when using REX.R and 64-bit mode.
- imm8 — An immediate byte value. The imm8 symbol can be a signed number between –128 and +127
inclusive; an unsigned number between 0 and 255 inclusive; or a bitmap when an instruction uses its individual
bits. For instructions in which imm8 is combined with a word or doubleword operand, the immediate value is
sign-extended to form a word or doubleword. The upper byte of the word is filled with the topmost bit of the
immediate value.
- imm16 — An immediate word value used for instructions whose operand-size attribute is 16 bits. This is a
number between –32,768 and +32,767 inclusive.
- imm32 — An immediate doubleword value used for instructions whose operand-size attribute is 32
bits. It allows the use of a number between +2,147,483,647 and –2,147,483,648 inclusive.
- imm64 — An immediate quadword value used for instructions whose operand-size attribute is 64 bits.
The value allows the use of a number between +9,223,372,036,854,775,807 and –
9,223,372,036,854,775,808 inclusive.
- /ib — A single-byte value.
- r/m8 — A byte operand that is either the contents of a byte general-purpose register (AL, CL, DL, BL, AH, CH,
DH, BH, BPL, SPL, DIL, and SIL) or a byte from memory. Byte registers R8B - R15B are available using REX.R
in 64-bit mode.
- r/m16 — A word general-purpose register or memory operand used for instructions whose operand-size
attribute is 16 bits. The word general-purpose registers are: AX, CX, DX, BX, SP, BP, SI, DI. The contents of
memory are found at the address provided by the effective address computation. Word registers R8W - R15W
are available using REX.R in 64-bit mode.
- r/m32 — A doubleword general-purpose register or memory operand used for instructions whose operandsize
attribute is 32 bits. The doubleword general-purpose registers are: EAX, ECX, EDX, EBX, ESP, EBP, ESI,
EDI. The contents of memory are found at the address provided by the effective address computation.
Doubleword registers R8D - R15D are available when using REX.R in 64-bit mode.
- r/m64 — A quadword general-purpose register or memory operand used for instructions whose operand-size
attribute is 64 bits when using REX.W. Quadword general-purpose registers are: RAX, RBX, RCX, RDX, RDI,
RSI, RBP, RSP, R8–R15; these are available only in 64-bit mode. The contents of memory are found at the
address provided by the effective address computation.
- reg — A general-purpose register used for instructions when the width of the register does not matter to the
semantics of the operation of the instruction. The register can be r16, r32, or r64.
- m — A 16-, 32- or 64-bit operand in memory.
- m8 — A byte operand in memory, usually expressed as a variable or array name, but pointed to by the
DS:(E)SI or ES:(E)DI registers. In 64-bit mode, it is pointed to by the RSI or RDI registers.
- m16 — A word operand in memory, usually expressed as a variable or array name, but pointed to by the
DS:(E)SI or ES:(E)DI registers. This nomenclature is used only with the string instructions.
- m32 — A doubleword operand in memory. The contents of memory are found at the address provided by the
effective address computation.
- m64 — A memory quadword operand in memory.
- m128 — A memory double quadword operand in memory.
- m16:16, m16:32 & m16:64 — A memory operand containing a far pointer composed of two numbers. The
number to the left of the colon corresponds to the pointer's segment selector. The number to the right
corresponds to its offset.
- m16&32, m16&16, m32&32, m16&64 — A memory operand consisting of data item pairs whose sizes are
indicated on the left and the right side of the ampersand. All memory addressing modes are allowed. The
m16&16 and m32&32 operands are used by the BOUND instruction to provide an operand containing an upper
and lower bounds for array indices. The m16&32 operand is used by LIDT and LGDT to provide a word with
which to load the limit field, and a doubleword with which to load the base field of the corresponding GDTR and
IDTR registers. The m16&64 operand is used by LIDT and LGDT in 64-bit mode to provide a word with which to
load the limit field, and a quadword with which to load the base field of the corresponding GDTR and IDTR
registers.
- m80bcd— A Binary Coded Decimal (BCD) operand in memory, 80 bits.
- moffs8, moffs16, moffs32, moffs64 — A simple memory variable (memory offset) of type byte, word, or
doubleword used by some variants of the MOV instruction. The actual address is given by a simple offset
relative to the segment base. No ModR/M byte is used in the instruction. The number shown with moffs
indicates its size, which is determined by the address-size attribute of the instruction.
- Sreg — A segment register. The segment register bit assignments are ES = 0, CS = 1, SS = 2, DS = 3, FS =
4, and GS = 5.
- m32fp, m64fp, m80fp — A single precision, double precision, and double extended-precision (respectively)
floating-point operand in memory. These symbols designate floating-point values that are used as operands for
x87 FPU floating-point instructions.
- m16int, m32int, m64int — A word, doubleword, and quadword integer (respectively) operand in memory.
These symbols designate integers that are used as operands for x87 FPU integer instructions.
- ST or ST(0) — The top element of the FPU register stack.
- ST(i) — The ith element from the top of the FPU register stack (i := 0 through 7).
- mm — An MMX register. The 64-bit MMX registers are: MM0 through MM7.
- mm/m32 — The low order 32 bits of an MMX register or a 32-bit memory operand. The 64-bit MMX registers
are: MM0 through MM7. The contents of memory are found at the address provided by the effective address
computation.
- mm/m64 — An MMX register or a 64-bit memory operand. The 64-bit MMX registers are: MM0 through MM7.
The contents of memory are found at the address provided by the effective address computation.
- xmm — An XMM register. The 128-bit XMM registers are: XMM0 through XMM7; XMM8 through XMM15 are
available using REX.R in 64-bit mode.
- xmm/m32— An XMM register or a 32-bit memory operand. The 128-bit XMM registers are XMM0 through
XMM7; XMM8 through XMM15 are available using REX.R in 64-bit mode. The contents of memory are found at
the address provided by the effective address computation.
- xmm/m64 — An XMM register or a 64-bit memory operand. The 128-bit SIMD floating-point registers are
XMM0 through XMM7; XMM8 through XMM15 are available using REX.R in 64-bit mode. The contents of
memory are found at the address provided by the effective address computation.
- xmm/m128 — An XMM register or a 128-bit memory operand. The 128-bit XMM registers are XMM0 through
XMM7; XMM8 through XMM15 are available using REX.R in 64-bit mode. The contents of memory are found at
the address provided by the effective address computation.
- <XMM0>— Indicates implied use of the XMM0 register.
When there is ambiguity, xmm1 indicates the first source operand using an XMM register and xmm2 the second
source operand using an XMM register.
Some instructions use the XMM0 register as the third source operand, indicated by <XMM0>. The use of the
third XMM register operand is implicit in the instruction encoding and does not affect the ModR/M encoding.
- ymm — A YMM register. The 256-bit YMM registers are: YMM0 through YMM7; YMM8 through YMM15 are
available in 64-bit mode.
- m256 — A 32-byte operand in memory. This nomenclature is used only with AVX instructions.
- ymm/m256 — A YMM register or 256-bit memory operand.
- <YMM0>— Indicates use of the YMM0 register as an implicit argument.
- bnd — A 128-bit bounds register. BND0 through BND3.
- mib — A memory operand using SIB addressing form, where the index register is not used in address calculation,
Scale is ignored. Only the base and displacement are used in effective address calculation.
- m512 — A 64-byte operand in memory.
- zmm/m512 — A ZMM register or 512-bit memory operand.
- {k1}{z} — A mask register used as instruction writemask. The 64-bit k registers are: k1 through k7.
Writemask specification is available exclusively via EVEX prefix. The masking can either be done as a mergingmasking,
where the old values are preserved for masked out elements or as a zeroing masking. The type of
masking is determined by using the EVEX.z bit.
- {k1} — Without {z}: a mask register used as instruction writemask for instructions that do not allow zeroingmasking
but support merging-masking. This corresponds to instructions that require the value of the aaa field
to be different than 0 (e.g., gather) and store-type instructions which allow only merging-masking.
- k1 — A mask register used as a regular operand (either destination or source). The 64-bit k registers are: k0
through k7.
- mV — A vector memory operand; the operand size is dependent on the instruction.
- vm32{x,y, z} — A vector array of memory operands specified using VSIB memory addressing. The array of
memory addresses are specified using a common base register, a constant scale factor, and a vector index
register with individual elements of 32-bit index value in an XMM register (vm32x), a YMM register (vm32y) or
a ZMM register (vm32z).
- vm64{x,y, z} — A vector array of memory operands specified using VSIB memory addressing. The array of
memory addresses are specified using a common base register, a constant scale factor, and a vector index
register with individual elements of 64-bit index value in an XMM register (vm64x), a YMM register (vm64y) or
a ZMM register (vm64z).

- zmm/m512/m32bcst — An operand that can be a ZMM register, a 512-bit memory location or a 512-bit
vector loaded from a 32-bit memory location.
- zmm/m512/m64bcst — An operand that can be a ZMM register, a 512-bit memory location or a 512-bit
vector loaded from a 64-bit memory location.
- `<ZMM0>` — Indicates use of the ZMM0 register as an implicit argument.
- {er} — Indicates support for embedded rounding control, which is only applicable to the register-register form
of the instruction. This also implies support for SAE (Suppress All Exceptions).
- {sae} — Indicates support for SAE (Suppress All Exceptions). This is used for instructions that support SAE,
but do not support embedded rounding control.
- SRC1 — Denotes the first source operand in the instruction syntax of an instruction encoded with the
VEX/EVEX prefix and having two or more source operands.
- SRC2 — Denotes the second source operand in the instruction syntax of an instruction encoded with the
VEX/EVEX prefix and having two or more source operands.
- SRC3 — Denotes the third source operand in the instruction syntax of an instruction encoded with the
VEX/EVEX prefix and having three source operands.
- SRC — The source in a single-source instruction.
- DST — The destination in an instruction. This field is encoded by reg_field.
In the instruction encoding, the MODRM byte is represented several ways depending on the role it plays. The
MODRM byte has 3 fields: 2-bit MODRM.MOD field, a 3-bit MODRM.REG field and a 3-bit MODRM.RM field. When all
bits of the MODRM byte have fixed values for an instruction, the 2-hex nibble value of that byte is presented after
the opcode in the encoding boxes on the instruction description pages. When only some fields of the MODRM byte
must contain fixed values, those values are specified as follows:
- If only the MODRM.MOD must be 0b11, and MODRM.REG and MODRM.RM fields are unrestricted, this is
denoted as 11:rrr:bbb. The rrr correspond to the 3-bits of the MODRM.REG field and the bbb correspond to
the 3-bits of the MODMR.RM field.
- If the MODRM.MOD field is constrained to be a value other than 0b11, i.e., it must be one of 0b00, 0b01, or
0b10, then we use the notation !(11).
- If the MODRM.REG field had a specific required value, e.g., 0b101, that would be denoted as mm:101:bbb.

### 3.1.1.4 Operand Encoding Column in the Instruction Summary Table

The “operand encoding” column is abbreviated as Op/En in the Instruction Summary table heading. Instruction
operand encoding information is provided for each assembly instruction syntax using a letter to cross reference to
a row entry in the operand encoding definition table that follows the instruction summary table. The operand
encoding table in each instruction reference page lists each instruction operand (according to each instruction
syntax and operand ordering shown in the instruction column) relative to the ModRM byte, VEX.vvvv field or additional
operand encoding placement.

EVEX encoded instructions employ compressed disp8*N encoding of the displacement bytes, where N is defined in
Table 2-36 and Table 2-37, according to tupletypes. The tupletype for an instruction is listed in the operand
encoding definition table where applicable.

NOTES

- The letters in the Op/En column of an instruction apply ONLY to the encoding definition table
immediately following the instruction summary table.
- In the encoding definition table, the letter ‘r’ within a pair of parenthesis denotes the content of
the operand will be read by the processor. The letter ‘w’ within a pair of parenthesis denotes the
content of the operand will be updated by the processor.

### 3.1.1.5 64/32-bit Mode Column in the Instruction Summary Table

The “64/32-bit Mode” column indicates whether the opcode sequence is supported in (a) 64-bit mode or (b) the
Compatibility mode and other IA-32 modes that apply in conjunction with the CPUID feature flag associated
specific instruction extensions.

The 64-bit mode support is to the left of the ‘slash’ and has the following notation:

- V — Supported.
- I — Not supported.
- N.E. — Indicates an instruction syntax is not encodable in 64-bit mode (it may represent part of a sequence of
valid instructions in other modes).
- N.P. — Indicates the REX prefix does not affect the legacy instruction in 64-bit mode.
- N.I. — Indicates the opcode is treated as a new instruction in 64-bit mode.
- N.S. — Indicates an instruction syntax that requires an address override prefix in 64-bit mode and is not
supported. Using an address override prefix in 64-bit mode may result in model-specific execution behavior.

The Compatibility/Legacy Mode support is to the right of the ‘slash’ and has the following notation:

- V — Supported.
- I — Not supported.
- N.E. — Indicates an Intel 64 instruction mnemonics/syntax that is not encodable; the opcode sequence is not
applicable as an individual instruction in compatibility mode or IA-32 mode. The opcode may represent a valid
sequence of legacy IA-32 instructions.

### 3.1.1.6 CPUID Support Column in the Instruction Summary Table

The fourth column holds abbreviated CPUID feature flags (e.g., appropriate bit in CPUID.01H.ECX,
CPUID.01H.EDX for SSE/SSE2/SSE3/SSSE3/SSE4.1/SSE4.2/AESNI/PCLMULQDQ/AVX/RDRAND support) that
indicate processor support for the instruction. If the corresponding flag is ‘0’, the instruction will #UD.

### 3.1.1.7 Description Column in the Instruction Summary Table

The “Description” column briefly explains forms of the instruction.

### 3.1.1.8 Description Section

Each instruction is then described by number of information sections. The “Description” section describes the
purpose of the instructions and required operands in more detail.
Summary of terms that may be used in the description section:

- Legacy SSE — Refers to SSE, SSE2, SSE3, SSSE3, SSE4, AESNI, PCLMULQDQ, and any future instruction sets
referencing XMM registers and encoded without a VEX prefix.
- VEX.vvvv — The VEX bit field specifying a source or destination register (in 1’s complement form).
- rm_field — shorthand for the ModR/M r/m field and any REX.B.
- reg_field — shorthand for the ModR/M reg field and any REX.R.

### 3.1.1.9 Operation Section

The “Operation” section contains an algorithm description (frequently written in pseudo-code) for the instruction.
Algorithms are composed of the following elements:

- Comments are enclosed within the symbol pairs “(*” and “*)”.
- Compound statements are enclosed in keywords, such as: IF, THEN, ELSE, and FI for an if statement; DO and
OD for a do statement; or CASE... OF for a case statement.
- A register name implies the contents of the register. A register name enclosed in brackets implies the contents
of the location whose address is contained in that register. For example, ES:[DI] indicates the contents of the
location whose ES segment relative address is in register DI. [SI] indicates the contents of the address
contained in register SI relative to the SI register’s default segment (DS) or the overridden segment.
- Parentheses around the “E” in a general-purpose register name, such as (E)SI, indicates that the offset is read
from the SI register if the address-size attribute is 16, from the ESI register if the address-size attribute is 32.
Parentheses around the “R” in a general-purpose register name, (R)SI, in the presence of a 64-bit register
definition such as (R)SI, indicates that the offset is read from the 64-bit RSI register if the address-size
attribute is 64.
- Brackets are used for memory operands where they mean that the contents of the memory location is a
segment-relative offset. For example, [SRC] indicates that the content of the source operand is a segmentrelative
offset.
- A := B indicates that the value of B is assigned to A.
- The symbols =, ≠, >, <, ≥, and ≤ are relational operators used to compare two values: meaning equal, not
equal, greater or equal, less or equal, respectively. A relational expression such as A = B is TRUE if the value of
A is equal to B; otherwise it is FALSE.
- The expression “« COUNT” and “» COUNT” indicates that the destination operand should be shifted left or right
by the number of bits indicated by the count operand.
The following identifiers are used in the algorithmic descriptions:
- OperandSize and AddressSize — The OperandSize identifier represents the operand-size attribute of the
instruction, which is 16, 32 or 64-bits. The AddressSize identifier represents the address-size attribute, which
is 16, 32 or 64-bits. For example, the following pseudo-code indicates that the operand-size attribute depends
on the form of the MOV instruction used.

```pseudo
IF Instruction = MOVW
    THEN OperandSize := 16;
ELSE
    IF Instruction = MOVD
        THEN OperandSize := 32;
    ELSE
        IF Instruction = MOVQ
            THEN OperandSize := 64;
        FI;
    FI;
FI;
```

See “Operand-Size and Address-Size Attributes” in Chapter 3 of the Intel® 64 and IA-32 Architectures
Software Developer’s Manual, Volume 1, for guidelines on how these attributes are determined.

- StackAddrSize — Represents the stack address-size attribute associated with the instruction, which has a
value of 16, 32 or 64-bits. See “Address-Size Attribute for Stack” in Chapter 6, “Procedure Calls, Interrupts, and
Exceptions,” of the Intel® 64 and IA-32 Architectures Software Developer’s Manual, Volume 1.
- SRC — Represents the source operand.
- DEST — Represents the destination operand.
- MAXVL — The maximum vector register width pertaining to the instruction. This is not the vector-length
encoding in the instruction's encoding but is instead determined by the current value of XCR0. For details, refer
to the table below. Note that the value of MAXVL is the largest of the features enabled. Future processors may
define new bits in XCR0 whose setting may imply other values for MAXVL.

MAXVL Definition

<table>
    <tr>
        <th>XCR0 Component</th>
        <th>MAXVL</th>
    </tr>
    <tr>
        <th>XCR0.SSE</th>
        <th>128</th>
    </tr>
    <tr>
        <th>XCR0.AVX</th>
        <th>256</th>
    </tr>
    <tr>
        <th>XCR0.{ZMM_Hi256, Hi16_ZMM, OPMASK}</th>
        <th>512</th>
    </tr>
</table>

The following functions are used in the algorithmic descriptions:

- ZeroExtend(value) — Returns a value zero-extended to the operand-size attribute of the instruction. For
example, if the operand-size attribute is 32, zero extending a byte value of –10 converts the byte from F6H to
a doubleword value of 000000F6H. If the value passed to the ZeroExtend function and the operand-size
attribute are the same size, ZeroExtend returns the value unaltered.
- SignExtend(value) — Returns a value sign-extended to the operand-size attribute of the instruction. For
example, if the operand-size attribute is 32, sign extending a byte containing the value –10 converts the byte
from F6H to a doubleword value of FFFFFFF6H. If the value passed to the SignExtend function and the operandsize
attribute are the same size, SignExtend returns the value unaltered.
- SaturateSignedWordToSignedByte — Converts a signed 16-bit value to a signed 8-bit value. If the signed
16-bit value is less than –128, it is represented by the saturated value -128 (80H); if it is greater than 127, it
is represented by the saturated value 127 (7FH).
- SaturateSignedDwordToSignedWord — Converts a signed 32-bit value to a signed 16-bit value. If the
signed 32-bit value is less than –32768, it is represented by the saturated value –32768 (8000H); if it is
greater than 32767, it is represented by the saturated value 32767 (7FFFH).
- SaturateSignedWordToUnsignedByte — Converts a signed 16-bit value to an unsigned 8-bit value. If the
signed 16-bit value is less than zero, it is represented by the saturated value zero (00H); if it is greater than
255, it is represented by the saturated value 255 (FFH).
- SaturateToSignedByte — Represents the result of an operation as a signed 8-bit value. If the result is less
than –128, it is represented by the saturated value –128 (80H); if it is greater than 127, it is represented by
the saturated value 127 (7FH).
- SaturateToSignedWord — Represents the result of an operation as a signed 16-bit value. If the result is less
than –32768, it is represented by the saturated value –32768 (8000H); if it is greater than 32767, it is
represented by the saturated value 32767 (7FFFH).
- SaturateToUnsignedByte — Represents the result of an operation as a signed 8-bit value. If the result is less
than zero it is represented by the saturated value zero (00H); if it is greater than 255, it is represented by the
saturated value 255 (FFH).
- SaturateToUnsignedWord — Represents the result of an operation as a signed 16-bit value. If the result is
less than zero it is represented by the saturated value zero (00H); if it is greater than 65535, it is represented
by the saturated value 65535 (FFFFH).
- LowOrderWord(DEST * SRC) — Multiplies a word operand by a word operand and stores the least significant
word of the doubleword result in the destination operand.
- HighOrderWord(DEST * SRC) — Multiplies a word operand by a word operand and stores the most
significant word of the doubleword result in the destination operand.
- Push(value) — Pushes a value onto the stack. The number of bytes pushed is determined by the operand-size
attribute of the instruction. See the “Operation” subsection of the “PUSH—Push Word, Doubleword, or
Quadword Onto the Stack” section in Chapter 4 of the Intel® 64 and IA-32 Architectures Software Developer’s
Manual, Volume 2B.
- Pop() — removes the value from the top of the stack and returns it. The statement EAX := Pop(); assigns to
EAX the 32-bit value from the top of the stack. Pop will return either a word, a doubleword or a quadword
depending on the operand-size attribute. See the “Operation” subsection in the “POP—Pop a Value From the
Stack” section of Chapter 4 of the Intel® 64 and IA-32 Architectures Software Developer’s Manual, Volume 2B.
- PopRegisterStack — Marks the FPU ST(0) register as empty and increments the FPU register stack pointer
(TOP) by 1.
- Switch-Tasks — Performs a task switch.
- Bit(BitBase, BitOffset) — Returns the value of a bit within a bit string. The bit string is a sequence of bits in
memory or a register. Bits are numbered from low-order to high-order within registers and within memory
bytes. If the BitBase is a register, the BitOffset can be in the range 0 to [15, 31, 63] depending on the mode
and register size. See Figure 3-1: the function Bit[RAX, 21] is illustrated.

![Figure 3-1. Bit Offset for BIT[RAX, 21]](../../res/Figure%203-1.%20Bit%20Offset%20for%20BIT[RAX,%2021].png)

If BitBase is a memory address, the BitOffset has different ranges depending on the operand size (see Table
3-2).

<table>
    <tr>
        <th>Operand Size</th>
        <th>Immediate BitOffset</th>
        <th>Register BitOffset</th>
    </tr>
    <tr>
        <td>16</td>
        <td>0 to 15</td>
        <td>−2<sup>15</sup> to 2<sup>15</sup> − 1</td>
    </tr>
    <tr>
        <td>32</td>
        <td>0 to 31</td>
        <td>−2<sup>31</sup> to 2<sup>31</sup> − 1</td>
    </tr>
    <tr>
        <td>64</td>
        <td>0 to 63</td>
        <td>−2<sup>63</sup> to 2<sup>63</sup> − 1</td>
    </tr>
</table>

The addressed bit is numbered (Offset MOD 8) within the byte at address (BitBase + (BitOffset DIV 8)) where
DIV is signed division with rounding towards negative infinity and MOD returns a positive number (see
Figure 3-2).

![Figure 3-2. Memory Bit Indexing](../../res/Figure%203-2.%20Memory%20Bit%20Indexing.png)

### 3.1.1.10 Intel® C/C++ Compiler Intrinsics Equivalents Section

The Intel C/C++ compiler intrinsic functions give access to the full power of the Intel Architecture Instruction Set,
while allowing the compiler to optimize register allocation and instruction scheduling for faster execution. Most of
these functions are associated with a single IA instruction, although some may generate multiple instructions or
different instructions depending upon how they are used. In particular, these functions are used to invoke instructions
that perform operations on vector registers that can hold multiple data elements. These SIMD instructions
use the following data types.
- __m128, __m256, and __m512 can represent 4, 8, or 16 packed single precision floating-point values, and are
used with the vector registers and SSE, AVX, or AVX-512 instruction set extension families. The __m128 data
type is also used with various single precision floating-point scalar instructions that perform calculations using
only the lowest 32 bits of a vector register; the remaining bits of the result come from one of the sources or are
set to zero depending upon the instruction.
- __m128d, __m256d, and __m512d can represent 2, 4, or 8 packed double precision floating-point values, and
are used with the vector registers and SSE, AVX, or AVX-512 instruction set extension families. The __m128d
data type is also used with various double precision floating-point scalar instructions that perform calculations
using only the lowest 64 bits of a vector register; the remaining bits of the result come from one of the sources
or are set to zero depending upon the instruction.
- __m128i, __m256i, and __m512i can represent integer data in bytes, words, doublewords, quadwords, and
occasionally larger data types.
Each of these data types incorporates in its name the number of bits it can hold. For example, the __m128 type
holds 128 bits, and because each single precision floating-point value is 32 bits long the __m128 type holds
(128/32) or four values. Normally the compiler will allocate memory for these data types on an even multiple of the
size of the type. Such aligned memory locations may be faster to read and write than locations at other addresses.
These SIMD data types are not basic Standard C data types or C++ objects, so they may be used only with the
assignment operator, passed as function arguments, and returned from a function call. If you access the internal
members of these types directly, or indirectly by using them in a union, there may be side effects affecting optimization,
so it is recommended to use them only with the SIMD instruction intrinsic functions described in this manual
or the Intel C/C++ compiler documentation.
Many intrinsic functions names are prefixed with an indicator of the vector length and suffixed by an indicator of
the vector element data type, although some functions do not follow the rules below. The prefixes are:
- _mm_ indicates that the function operates on 128-bit (or sometimes 64-bit) vectors.
- _mm256_ indicates the function operates on 256-bit vectors.
- _mm512_ indicates that the function operates on 512-bit vectors.
The suffixes include:
- _ps, which indicates a function that operates on packed single precision floating-point data. Packed single
precision floating-point data corresponds to arrays of the C/C++ type float with either 4, 8 or 16 elements.
Values of this type can be loaded from an array using the _mm_loadu_ps, _mm256_loadu_ps, or _mm512_-
loadu_ps functions, or created from individual values using _mm_set_ps, _mm256_set_ps, or
_mm512_set_ps functions, and they can be stored in an array using _mm_storeu_ps, _mm256_storeu_ps, or
_mm512_storeu_ps.
- _ss, which indicates a function that operates on scalar single precision floating-point data. Single precision
floating-point data corresponds to the C/C++ type float, and values of type float can be converted to type
__m128 for use with these functions using the _mm_set_ss function, and converted back using the
_mm_cvtss_f32 function. When used with functions that operate on packed single precision floating-point data
the scalar element corresponds with the first packed value.
- _pd, which indicates a function that operates on packed double precision floating-point data. Packed double
precision floating-point data corresponds to arrays of the C/C++ type double with either 2, 4, or 8 elements.
Values of this type can be loaded from an array using the _mm_loadu_pd, _mm256_loadu_pd, or _mm512_-
loadu_pd functions, or created from individual values using _mm_set_pd, _mm2566_set_pd, or
_mm512_set_pd functions, and they can be stored in an array using _mm_storeu_pd, _mm256_storeu_pd, or
_mm512_storeu_pd.
- _sd, which indicates a function that operates on scalar double precision floating-point data. Double precision
floating-point data corresponds to the C/C++ type double, and values of type double can be converted to type
__m128d for use with these functions using the _mm_set_sd function, and converted back using the
_mm_cvtsd_f64 function. When used with functions that operate on packed double precision floating-point
data the scalar element corresponds with the first packed value.
- _epi8, which indicates a function that operates on packed 8-bit signed integer values. Packed 8-bit signed
integers correspond to an array of signed char with 16, 32 or 64 elements. Values of this type can be created
from individual elements using _mm_set_epi8, _mm256_set_epi8, or _mm512_set_epi8 functions.
- _epi16, which indicates a function that operates on packed 16-bit signed integer values. Packed 16-bit signed
integers correspond to an array of short with 8, 16 or 32 elements. Values of this type can be created from
individual elements using _mm_set_epi16, _mm256_set_epi16, or _mm512_set_epi16 functions.
- _epi32, which indicates a function that operates on packed 32-bit signed integer values. Packed 32-bit signed
integers correspond to an array of int with 4, 8 or 16 elements. Values of this type can be created from
individual elements using _mm_set_epi32, _mm256_set_epi32, or _mm512_set_epi32 functions.
- _epi64, which indicates a function that operates on packed 64-bit signed integer values. Packed 64-bit signed
integers correspond to an array of long long (or long if it is a 64-bit data type) with 2, 4 or 8 elements. Values
of this type can be created from individual elements using _mm_set_epi32, _mm256_set_epi32, or
_mm512_set_epi32 functions.
- _epu8, which indicates a function that operates on packed 8-bit unsigned integer values. Packed 8-bit unsigned
integers correspond to an array of unsigned char with 16, 32 or 64 elements.
- _epu16, which indicates a function that operates on packed 16-bit unsigned integer values. Packed 16-bit
unsigned integers correspond to an array of unsigned short with 8, 16 or 32 elements.
- _epu32, which indicates a function that operates on packed 32-bit unsigned integer values. Packed 32-bit
unsigned integers correspond to an array of unsigned with 4, 8 or 16 elements.
- _epu64, which indicates a function that operates on packed 64-bit unsigned integer values. Packed 64-bit
unsigned integers correspond to an array of unsigned long long (or unsigned long if it is a 64-bit data type) with
2, 4 or 8 elements.
- _si128, which indicates a function that operates on a single 128-bit value of type __m128i.
- _si256, which indicates a function that operates on a single a 256-bit value of type __m256i.
- _si512, which indicates a function that operates on a single a 512-bit value of type __m512i.
Values of any packed integer type can be loaded from an array using the _mm_loadu_si128, _mm256_loadu_-
si256, or _mm512_loadu_si512 functions, and they can be stored in an array using _mm_storeu_si128,
_mm256_storeu_si256, or _mm512_storeu_si512.
These functions and data types are used with the SSE, AVX, and AVX-512 instruction set extension families. In
addition there are similar functions that correspond to MMX instructions. These are less frequently used because
they require additional state management, and only operate on 64-bit packed integer values.
The declarations of Intel C/C++ compiler intrinsic functions may reference some non-standard data types, such as
__int64. The C Standard header stdint.h defines similar platform-independent types, and the documentation for
that header gives characteristics that apply to corresponding non-standard types according to the following table.

Standard and Non-Standard Data Types

<table>
        <tr>
            <th>Non-standard Type</th>
            <th>Standard Type (from stdint.h)</th>
        </tr>
        <tr>
            <td>__int64</td>
            <td>int64_t</td>
        </tr>
        <tr>
            <td>unsigned __int64</td>
            <td>uint64_t</td>
        </tr>
        <tr>
            <td>__int32</td>
            <td>int32_t</td>
        </tr>
        <tr>
            <td>unsigned __int32</td>
            <td>uint32_t</td>
        </tr>
        <tr>
            <td>__int16</td>
            <td>int16_t</td>
        </tr>
        <tr>
            <td>unsigned __int16</td>
            <td>uint16_t</td>
        </tr>
    </table>

For a more detailed description of each intrinsic function and additional information related to its usage, refer to the
online Intel Intrinsics Guide, [https://software.intel.com/sites/landingpage/IntrinsicsGuide](https://software.intel.com/sites/landingpage/IntrinsicsGuide).

### 3.1.1.11 Flags Affected Section

The “Flags Affected” section lists the flags in the EFLAGS register that are affected by the instruction. When a flag
is cleared, it is equal to 0; when it is set, it is equal to 1. The arithmetic and logical instructions usually assign
values to the status flags in a uniform manner (see Appendix A, “EFLAGS Cross-Reference,” in the Intel® 64 and
IA-32 Architectures Software Developer’s Manual, Volume 1). Non-conventional assignments are described in the
“Operation” section. The values of flags listed as undefined may be changed by the instruction in an indeterminate
manner. Flags that are not listed are unchanged by the instruction.

### 3.1.1.12 FPU Flags Affected Section

The floating-point instructions have an “FPU Flags Affected” section that describes how each instruction can affect
the four condition code flags of the FPU status word.

### 3.1.1.13 Protected Mode Exceptions Section

The “Protected Mode Exceptions” section lists the exceptions that can occur when the instruction is executed in
protected mode and the reasons for the exceptions. Each exception is given a mnemonic that consists of a pound
sign (#) followed by two letters and an optional error code in parentheses. For example, #GP(0) denotes a general
protection exception with an error code of 0. Table 3-4 associates each two-letter mnemonic with the corresponding
exception vector and name. See Chapter 6, “Procedure Calls, Interrupts, and Exceptions,” in the Intel®
64 and IA-32 Architectures Software Developer’s Manual, Volume 3A, for a detailed description of the exceptions.
Application programmers should consult the documentation provided with their operating systems to determine
the actions taken when exceptions occur.

Intel 64® and IA-32 General Exceptions

<table border="1">
    <tr>
        <th>Vector</th>
        <th>Name</th>
        <th>Source</th>
        <th>Protected Mode</th>
        <th>Real Address Mode</th>
        <th>Virtual 8086 Mode</th>
    </tr>
    <tr>
        <td>0</td>
        <td>#DE—Divide Error</td>
        <td>DIV and IDIV instructions.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>1</td>
        <td>#DB—Debug</td>
        <td>Any code or data reference.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>3</td>
        <td>#BP—Breakpoint</td>
        <td>INT3 instruction.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>4</td>
        <td>#OF—Overflow</td>
        <td>INTO instruction.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>5</td>
        <td>#BR—BOUND Range Exceeded</td>
        <td>BOUND instruction.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>6</td>
        <td>#UD—Invalid Opcode</td>
        <td>UD instruction or reserved opcode.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>7</td>
        <td>#NM—Device Not Available</td>
        <td>Floating-point or WAIT/FWAIT instruction.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>8</td>
        <td>#DF—Double Fault</td>
        <td>Any instruction that can generate an exception, an NMI, or an INTR.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>10</td>
        <td>#TS—Invalid TSS</td>
        <td>Task switch or TSS access.</td>
        <td>Yes</td>
        <td>No</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>11</td>
        <td>#NP—Segment Not Present</td>
        <td>Loading segment registers or accessing system segments.</td>
        <td>Yes</td>
        <td>No</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>12</td>
        <td>#SS—Stack Segment Fault</td>
        <td>Stack operations and SS register loads.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>13</td>
        <td>#GP—General Protection</td>
        <td>Any memory reference and other protection checks.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>14</td>
        <td>#PF—Page Fault</td>
        <td>Any memory reference.</td>
        <td>Yes</td>
        <td>No</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>16</td>
        <td>#MF—Floating-Point Error</td>
        <td>Floating-point or WAIT/FWAIT instruction.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>17</td>
        <td>#AC—Alignment Check</td>
        <td>Any data reference in memory.</td>
        <td>Yes</td>
        <td>No</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>18</td>
        <td>#MC—Machine Check</td>
        <td>Model dependent machine check errors.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>19</td>
        <td>#XM—SIMD Floating-Point Numeric Error</td>
        <td>SSE/SSE2/SSE3 floating-point instructions.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>20</td>
        <td>#VE—Virtualization Exception</td>
        <td>EPT violations.</td>
        <td>Yes</td>
        <td>No</td>
        <td>No</td>
    </tr>
    <tr>
        <td>21</td>
        <td>#CP—Control Protection Exception</td>
        <td>RET, IRET, RSTORSSP, and SETSSBSY
instructions can generate this exception. When
CET indirect branch tracking is enabled, this
exception can be generated due to a missing
ENDBRANCH instruction at target of an
indirect call or jump.</td>
        <td>Yes</td>
        <td>No</td>
        <td>No</td>
    </tr>
</table>

NOTES:

1. Apply to protected mode, compatibility mode, and 64-bit mode.
2. In the real-address mode, vector 13 is the segment overrun exception.
3. This exception can occur only on processors that support the 1-setting of the “EPT-violation #VE” VM-execution control.

### 3.1.1.14 Real-Address Mode Exceptions Section
The “Real-Address Mode Exceptions” section lists the exceptions that can occur when the instruction is executed in
real-address mode (see Table 3-4).
### 3.1.1.15 Virtual-8086 Mode Exceptions Section
The “Virtual-8086 Mode Exceptions” section lists the exceptions that can occur when the instruction is executed in
virtual-8086 mode (see Table 3-4).
### 3.1.1.16 Floating-Point Exceptions Section
The “Floating-Point Exceptions” section lists exceptions that can occur when an x87 FPU floating-point instruction
is executed. All of these exception conditions result in a floating-point error exception (#MF, exception 16) being
generated. Table 3-5 associates a one- or two-letter mnemonic with the corresponding exception name. See
“Floating-Point Exception Conditions” in Chapter 8 of the Intel® 64 and IA-32 Architectures Software Developer’s
Manual, Volume 1, for a detailed description of these exceptions.

Table 3-5. x87 FPU Floating-Point Exceptions

<table>
    <tr>
        <th>Mnemonic</th>
        <th>Name</th>
        <th>Source</th>
    </tr>
    <tr>
        <td><br>#IS</br><br>#IA</br></td>
        <td>Floating-point invalid operation
            <ul>
                <li>Stack overflow or underflow</li>
                <li>Invalid arithmetic operation</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>x87 FPU stack overflow or underflow</li>
                <li>Invalid FPU arithmetic operation</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>#Z</td>
        <td>Floating-point divide-by-zero</td>
        <td>Divide-by-zero</td>
    </tr>
    <tr>
        <td>#D</td>
        <td>Floating-point denormal operand</td>
        <td>Source operand that is a denormal number</td>
    </tr>
    <tr>
        <td>#O</td>
        <td>Floating-point numeric overflow</td>
        <td>Overflow in result</td>
    </tr>
    <tr>
        <td>#U</td>
        <td>Floating-point numeric underflow</td>
        <td>Underflow in result</td>
    </tr>
    <tr>
        <td>#P</td>
        <td>Floating-point inexact result (precision)</td>
        <td>Inexact result (precision)</td>
    </tr>
</table>

### 3.1.1.17 SIMD Floating-Point Exceptions Section

The “SIMD Floating-Point Exceptions” section lists exceptions that can occur when an SSE/SSE2/SSE3 floatingpoint
instruction is executed. All of these exception conditions result in a SIMD floating-point error exception (#XM,
exception 19) being generated. Table 3-6 associates a one-letter mnemonic with the corresponding exception
name. For a detailed description of these exceptions, refer to ”SSE and SSE2 Exceptions”, in Chapter 11 of the
Intel® 64 and IA-32 Architectures Software Developer’s Manual, Volume 1.

Table 3-6. SIMD Floating-Point Exceptions

<table>
    <tr>
        <th>Mnemonic</th>
        <th>Name</th>
        <th>Source</th>
    </tr>
    <tr>
        <td>#I</td>
        <td>Floating-point invalid operation</td>
        <td>Invalid arithmetic operation or source operand</td>
    </tr>
    <tr>
        <td>#Z</td>
        <td>Floating-point divide-by-zero</td>
        <td>Divide-by-zero</td>
    </tr>
    <tr>
        <td>#D</td>
        <td>Floating-point denormal operand</td>
        <td>Source operand that is a denormal number</td>
    </tr>
    <tr>
        <td>#O</td>
        <td>Floating-point numeric overflow</td>
        <td>Overflow in result</td>
    </tr>
    <tr>
        <td>#U</td>
        <td>Floating-point numeric underflow</td>
        <td>Underflow in result</td>
    </tr>
    <tr>
        <td>#P</td>
        <td>Floating-point inexact result</td>
        <td>Inexact result (precision)</td>
    </tr>
</table>

### 3.1.1.18 Compatibility Mode Exceptions Section
This section lists exceptions that occur within compatibility mode.

### 3.1.1.19 64-Bit Mode Exceptions Section
This section lists exceptions that occur within 64-bit mode.
