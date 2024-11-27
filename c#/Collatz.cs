using System;
using System.Numerics;
using System.Collections.Generic;

public class Collatz {
    public static void Main(string[] args) {
        BigInteger test = CalculateSequenceLength(989345275647);
        Console.WriteLine(test);
    }

    public static BigInteger CalculateSequenceLength(BigInteger n) {
        BigInteger counter = new BigInteger(0);

        while (n != 1) {
            if (n % 2 == 0) {
                n /= 2;
            }
            else {
                n = n * 3 + 1;
            }

            counter += 1;
        }

        return counter;
    }

}
