# CollatzConjecture

## Introduction
This repository contains a program that calculates the smallest 10 starting values with the largest stopping times in a Collatz Sequence for a given range of integers from 1 to 2,100,000,000. The program is written in six different programming languages and for each language, there is one loop-based implementation and one recursive implementation for calculating the length of a Collatz sequence.

## Instructions

To run this program, first start by cloning this repository:
```
git clone https://github.com/RajwolChapagain/Collatz-Sequence-Length-Calculator.git
```

### Python
1. Navigate to the python or pythonRecur directory depending on whether you want to run the loop-based or the recursive implmentation of the program.
```
cd python
```
or
```
cd pythonRecur
```
2. Run the program by passing in two integers in the range 1 to 2,100,000,000 as command-line arguments to the program:
```
python3 collatz.py 50 100
```

### Lisp
1. Navigate to the lisp or lispRecur directory depending on whether you want to run the loop-based or the recursive implmentation of the program.
```
cd lisp
```
or
```
cd lispRecur
```
2. Run the program by passing in two integers in the range 1 to 2,100,000,000 as command-line arguments to the program:
```
sbcl --script collatz.lisp 50 100
```

### Rust
1. Navigate to the rust or rustRecur directory depending on whether you want to run the loop-based or the recursive implmentation of the program.
```
cd rust
```
or
```
cd rustRecur
```
2. Run the program by passing in two integers in the range 1 to 2,100,000,000 as command-line arguments to the program:
```
cargo run 50 100
```

### C#
1. Navigate to the c# or c#Recur directory depending on whether you want to run the loop-based or the recursive implmentation of the program.
```
cd c#
```
or
```
cd c#Recur
```
2. Compile the program:
```
mcs -r:System.Numerics Collatz.cs
```
3. Run the program by passing in two integers in the range 1 to 2,100,000,000 as command-line arguments to the program:
```
mono Collatz.exe 50 100
```

### Julia
1. Navigate to the julia or juliaRecur directory depending on whether you want to run the loop-based or the recursive implmentation of the program.
```
cd julia
```
or
```
cd juliaRecur
```
2. Run the program by passing in two integers in the range 1 to 2,100,000,000 as command-line arguments to the program:
```
julia collatz.jl 50 100
```

### Fortran
1. Navigate to the fortran or fortranRecur directory depending on whether you want to run the loop-based or the recursive implmentation of the program.
```
cd fortran
```
or
```
cd fortranRecur
```
2. Compile the program:
```
gfortran collatz.f90 -fno-range-check
```
3. Run the program by passing in two integers in the range 1 to 2,100,000,000 as command-line arguments to the program:
```
./a.out 50 100
```
