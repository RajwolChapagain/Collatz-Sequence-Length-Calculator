using System;
using System.Numerics;


public class Collatz {
    public static void Main(string[] args) {
        int test = CalculateSequenceLength(989345275647);
        Console.WriteLine(test);
    }

    public static int CalculateSequenceLength(BigInteger n) {
        int counter = 0;

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
