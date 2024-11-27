# CollatzConjecture

## Introduction
This repository contains a program that calculates the smallest 10 starting values with the largest stopping times in a Collatz Sequence for a given range of integers from 1 to 2,100,000,000. The program is written in six different programming languages and for each language, there is one loop-based implementation and one recursive implementation for calculating the length of a Collatz sequence.

## Instructions

To run this program, first start by cloning this repository:
```
git clone https://anvil.cs.mercer.edu/chapagain_r/collatzconjecture.git
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
