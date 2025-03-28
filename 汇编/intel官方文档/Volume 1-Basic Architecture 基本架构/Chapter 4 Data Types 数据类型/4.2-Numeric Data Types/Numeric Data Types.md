# 4.2 Numeric Data Types

Although bytes, words, and doublewords are fundamental data types, some instructions support additional interpretations of these data types to allow operations to be performed on numeric data types (signed and unsigned integers, and floating-point numbers). Single precision (32-bit) floating-point and double precision (64-bit) floating-point data types are supported across all generations of Intel SSE extensions and Intel AVX extensions. The half precision (16-bit) floating-point data type was supported only with F16C extensions (VCVTPH2PS and VCVTPS2PH) beginning with the third generation of Intel® Core™ processors based on Ivy Bridge microarchitec-ture. Starting with the 4th generation Intel® Xeon® Scalable Processor Family, an Intel® AVX-512 instruction set architecture (ISA) for FP16 was added, supporting a wide range of general-purpose numeric operations for 16-bit half precision floating-point values (binary16 in IEEE Standard 754-2019 for Floating-Point Arithmetic, aka half precision or FP16), which complements the existing 32-bit and 64-bit floating-point instructions already available in the Intel Xeon processor-based products. This ISA also provides complex-valued native hardware support for half precision floating-point. See Figure 4-3.

![Figure 4-3.  Numeric Data Types](../res/Figure%204-3.%20%20Numeric%20Data%20Types.png)

## 4.2.1 Integers

The Intel 64 and IA-32 architectures define two types of integers: unsigned and signed. Unsigned integers are ordi-nary binary values ranging from 0 to the maximum positive number that can be encoded in the selected operand size. Signed integers are two’s complement binary values that can be used to represent both positive and negative integer values.
Some integer instructions (such as the ADD, SUB, PADDB, and PSUBB instructions) operate on either unsigned or signed integer operands. Other integer instructions (such as IMUL, MUL, IDIV, DIV, FIADD, and FISUB) operate on only one integer type.
The following sections describe the encodings and ranges of the two types of integers.

### 4.2.1.1 Unsigned Integers

Unsigned integers are unsigned binary numbers contained in a byte, word, doubleword, and quadword.
Their values range from 0 to 255 for an unsigned byte integer,
from 0 to 65,535 for an unsigned word integer,
from 0 to 2<sup>32</sup> - 1 for an unsigned doubleword integer,
and from 0 to 2<sup>64</sup> - 1 for an unsigned quadword integer.
Unsigned integers are sometimes referred to as ordinals.

### 4.2.1.2 Signed Integers

Signed integers are signed binary numbers held in a byte, word, doubleword, or quadword. All operations on signed integers assume a two's complement representation. The sign bit is located in bit 7 in a byte integer, bit 15 in a word integer, bit 31 in a doubleword integer, and bit 63 in a quadword integer (see the signed integer encodings in Table 4-1).

<table border="1">
    <tr>
        <th rowspan = "2" colspan="2">Class</th>
        <th colspan="2">Two’s Complement Encoding</th>
    </tr>
    <tr>
        <th>Sign</th>
        <th></th>
    </tr>
    <tr>
        <th>Positive</th>
        <th><br>Largest</br><br></br></br><br></br></br><br>Smallest</br></th>
        <th><br>0</br><br></br>.</br><br></br>.</br><br>0</br></th>
        <th><br>11..11</br><br></br>.</br><br></br>.</br><br>00..01</br></th>
    </tr>
    <tr>
        <th colspan="2">Zero</th>
        <th>0</th>
        <th>00..00</th>
    </tr>
    <tr>
        <th>Negative</th>
        <th><br>Smallest</br><br></br></br><br></br></br><br>Largest</br></th>
        <th><br>1</br><br></br>.</br><br></br>.</br><br>1</br></th>
        <th><br>11..11</br><br></br>.</br><br></br>.</br><br>00..00</br></th>
    </tr>
    <tr>
        <th colspan="2">Integer indefinite</th>
        <th>1</th>
        <th>00..00</th>
    </tr>
    <tr>
        <th></th>
        <th></th>
        <th><br>Signed Byte Integer:</br><br>Signed Word Integer:</br><br>Signed Doubleword Integer:</br><br>Signed Quadword Integer:</br></th>
        <th><br>7bits</br><br>15bits</br><br>31bits</br><br>63bits</br></th>
    </tr>
</table>

The sign bit is set for negative integers and cleared for positive integers and zero.
Integer values range from -128 to +127 for a byte integer, from -32,768 to +32,767 for a word integer, from -2^31 to +2^31 - 1 for a doubleword integer, and from -2^63 to +2^63 - 1 for a quadword integer.
When storing integer values in memory, word integers are stored in 2 consecutive bytes; doubleword integers are stored in 4 consecutive bytes; and quadword integers are stored in 8 consecutive bytes.
The integer indefinite is a special value that is sometimes returned by the x87 FPU when operating on integer values. For more information, see Section 8.2.1, “Indefinites.”

## 4.2.2 Floating-Point Data Types

The IA-32 architecture defines and operates on four floating-point data types: half precision floating-point, single precision floating-point, double precision floating-point, and double-extended precision floating-point (see Figure 4-3). The data formats for these data types correspond directly to formats specified in the IEEE Standard 754 for Floating-Point Arithmetic. 
The half precision (16-bit) floating-point data type was supported only with F16C extensions (VCVTPH2PS and VCVTPS2PH) beginning with the third generation of Intel Core processors based on Ivy Bridge microarchitecture. Starting with the 4th generation Intel Xeon Scalable Processor Family, an Intel AVX-512 instruction set architecture (ISA) for FP16 was added, supporting a wide range of general-purpose numeric operations for 16-bit half precision floating-point values (binary16 in the IEEE Standard 754-2019 for Floating-Point Arithmetic, aka half precision or FP16), which complements the existing 32-bit and 64-bit floating-point instructions already available in the Intel Xeon processor-based products.
Table 4-2 gives the length, precision, and approximate normalized range that can be represented by each of these data types. Denormal values are also supported in each of these types.

<table border="1">
    <tr>
        <th rowspan = "2">Data Type</th>
        <th rowspan = "2">Length (bits)</th>
        <th rowspan = "2">Precision (decimal digits)</th>
        <th colspan = "2">Approximate Normalized Range</th>
    </tr>
    <tr>
        <th>Binary</th>
        <th>Decimal</th>
    </tr>
    <tr>
        <td>Half Precision</td>
        <td>16</td>
        <td>11</td>
        <td>2<sup>-14</sup> to 2<sup>16</sup></td>
        <td>6.10 * 10^<sup>-5</sup> to 6.55 * 10<sup>4</sup></td>
    </tr>
    <tr>
        <td>Single Precision</td>
        <td>32</td>
        <td>24</td>
        <td>2<sup>-126</sup> to 2<sup>128</sup></td>
        <td>1.18 * 10<sup>-38</sup> to 3.40 * 10<sup>38</sup></td>
    </tr>
    <tr>
        <td>Double Precision</td>
        <td>64</td>
        <td>53</td>
        <td>2^(-1022) to 2^1024</td>
        <td>2.23 * 10^(-308) to 1.19 * 10^308</td>
    </tr>
    <tr>
       <td>Extended Precision</td>
       <td>80</td>
       <td>64</td>
       <td>2<sup>-16382</sup> to 2<sup>16384</sup></td>
       <td>3.36 * 10<sup>-4932</sup> to 1.19 * 10<sup>4932</sup></td>
    </tr>
</table>

> [!NOTE]
>
> Section 4.8, “Real Numbers and Floating-Point Formats,” gives an overview of the IEEE Standard 754 floating-point formats and defines the terms integer bit, QNaN, SNaN, and denormal value.

Table 4-3 shows the floating-point encodings for zeros, denormalized finite numbers, normalized finite numbers, infinites, and NaNs for each of the three floating-point data types. It also gives the format for the QNaN floating-point indefinite value. (See Section 4.8.3.7, “QNaN Floating-Point Indefinite,” for a discussion of the use of the QNaN floating-point indefinite value.)
For the half precision, single precision, and double precision formats, only the fraction part of the significand is encoded.

The integer is assumed to be 1 for all numbers except 0 and denormalized finite numbers.
For the double extended precision format, the integer is contained in bit 63, and the most-significant fraction bit is bit 62. Here, the integer is explicitly set to 1 for normalized numbers, infinities, and NaNs, and to 0 for zero and denormalized numbers.

<table border="1">
            <tr>
                <th rowspan="2" colspan="2">Class</th>
                <th rowspan="2">Sign</th>
                <th rowspan="2">Biased Exponent</th>
                <th colspan="2">Significand</th>
            </tr>
            <tr>
                <th>Integer</th>
                <th>Fraction</th>
            </tr>
            <tr>
                <td rowspan="4">Positive</td>
                <td>+∞</td>
                <td>0</td>
                <td>11..11</td>
                <td>1</td>
                <td>00..00</td>
            </tr>
            <tr>
                <td>+Normals</td>
                <td><br>0</br><br>.</br><br>.</br><br>0</br></td>
                <td><br>11..10</br><br>.</br><br>.</br><br>00..01</br></td>
                <td><br>1</br><br>.</br><br>.</br><br>1</br></td>
                <td><br>11..11</br><br>.</br><br>.</br><br>00..00</br></td>
            </tr>
            <tr>
                <td>+Denormals</td>
                <td><br>0</br><br>.</br><br>.</br><br>0</br></td>
                <td><br>00..00</br><br>.</br><br>.</br><br>00..00</br></td>
                <td><br>0</br><br>.</br><br>.</br><br>0</br></td>
                <td><br>11..11</br><br>.</br><br>.</br><br>00..01</br></td>
            </tr>
            <tr>
                <td>+Zero</td>
                <td>0</td>
                <td>00..00</td>
                <td>0</td>
                <td>00..00</td>
            </tr>
            <tr>
                <td rowspan="4">Negative</td>
                <td>−Zero</td>
                <td>1</td>
                <td>00..00</td>
                <td>0</td>
                <td>00..00</td>
            </tr>
            <tr>
                <td>-Denormals</td>
                <td><br>1</br><br>.</br><br>.</br><br>1</br></td>
                <td><br>00..00</br><br>.</br><br>.</br><br>00..00</br></td>
                <td><br>0</br><br>.</br><br>.</br><br>0</br></td>
                <td><br>00..01</br><br>.</br><br>.</br><br>11..11</br></td>
            </tr>
            <tr>
                <td>-Normals</td>
                <td><br>1</br><br>.</br><br>.</br><br>1</br></td>
                <td><br>00..01</br><br>.</br><br>.</br><br>11..10</br></td>
                <td><br>1</br><br>.</br><br>.</br><br>1</br></td>
                <td><br>00..00</br><br>.</br><br>.</br><br>11..11</br></td>
            </tr>
            <tr>
                <td>−∞</td>
                <td>1</td>
                <td>11..11</td>
                <td>1</td>
                <td>00..00</td>
            </tr>
            <tr>
                <td rowspan="3">NaNs</td>
                <td>SNaN</td>
                <td>X</td>
                <td>11..11</td>
                <td>1</td>
                <td>0X..XX<sup>2</sup></td>
            </tr>
            <tr>
                <td>QNaN</td>
                <td>X</td>
                <td>11..11</td>
                <td>1</td>
                <td>1X..XX</td>
            </tr>
            <tr>
                <td>QNaN Floating-Point Indefinite</td>
                <td>1</td>
                <td>11..11</td>
                <td>1</td>
                <td>10..00</td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><br>Half Precision</br><br>Single Precision:</br><br>Double Precision:</br><br></br>Double Extended Precision:</td>
                <td><br>5bits</br><br>8bits</br><br>11bits</br><br>15bits</br></td>
                <td></td>
                <td><br>10bits</br><br>23bits</br><br>52bits</br><br>63bits</br></td>
            </tr>
    </table>

> [!NOTE]
>
> 1. Integer bit is implied and not stored for half precision, single precision, and double precision formats.
> 2. The fraction for SNaN encodings must be non-zero with the most-significant bit 0.

The exponent of each floating-point data type is encoded in biased format; see Section 4.8.2.2, “Biased Exponent.” The biasing constant is 15 for the half precision format, 127 for the single precision format, 1023 for the double precision format, and 16,383 for the double extended precision format.

When storing floating-point values in memory, half precision values are stored in 2 consecutive bytes in memory; single precision values are stored in 4 consecutive bytes in memory; double precision values are stored in 8 consec-utive bytes; and double extended precision values are stored in 10 consecutive bytes.

The single precision and double precision floating-point data types are operated on by x87 FPU, and Intel SSE/SSE2/SSE3/SSE4.1/AVX instructions. The double extended precision floating-point format is only operated on by the x87 FPU. See Section 11.6.8, “Compatibility of SIMD and x87 FPU Floating-Point Data Types,” for a discus-sion of the compatibility of single precision and double precision floating-point data types between the x87 FPU and Intel SSE/SSE2/SSE3 extensions.
