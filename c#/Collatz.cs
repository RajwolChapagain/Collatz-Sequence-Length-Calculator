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

    public static int GetMinIndex(List<List<BigInteger>> seq_list) {
        int min_ind = 0;
        
        int i = 0;
        foreach (var pair in seq_list) {
            var min_pair = seq_list[min_ind];

            if (pair[1] < min_pair[1]) {
                min_ind = i;
            }
            else if (pair[1] == min_pair[1]) {
                if (pair[0] > min_pair[0]) {
                    min_ind = i;
                }
            }
            i++;
        }

        return min_ind;
    }

    public static void CompareAndAdd(BigInteger n, BigInteger seq_len, List<List<BigInteger>> seq_list) {
        foreach (var pair in seq_list) {
            if (seq_len == pair[1]) {
                return;
            }
        }

        if (seq_list.Count < 10) {
            seq_list.Add(new List<BigInteger> {n, seq_len});
            return;
        }

        int min_ind = GetMinIndex(seq_list);
        var min_pair = seq_list[min_ind];

        if (seq_len > min_pair[1]) {
            seq_list[min_ind] = new List<BigInteger> {n, seq_len};
        }
    }
}
