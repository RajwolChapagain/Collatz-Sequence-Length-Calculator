using System;
using System.Numerics;
using System.Collections.Generic;
using System.Linq;

public class Collatz {
    public static void Main(string[] args) {
        List<List<BigInteger>> seq_list = new List<List<BigInteger>>();

        BigInteger start = BigInteger.Parse(args[0]);
        BigInteger end = BigInteger.Parse(args[1]);

        for (BigInteger i = start; i < end + 1; i++) {
            BigInteger seq_len = CalculateSequenceLength(i);
            CompareAndAdd(i, seq_len, seq_list);
        }

        PrintBySeqLen(seq_list);
        PrintByN(seq_list);
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

    public static void PrintBySeqLen(List<List<BigInteger>> seq_list) {
        Console.WriteLine("Sorted based on sequence length");
        var sorted_list = seq_list.OrderByDescending(pair => pair[1]).ToList();

        foreach (var item in sorted_list) {
            Console.WriteLine(string.Format("{0,20} {1,20}", item[0], item[1]));
        }
    }

    public static void PrintByN(List<List<BigInteger>> seq_list) {
        Console.WriteLine("Sorted based on integer size");
        var sorted_list = seq_list.OrderByDescending(pair => pair[0]).ToList();

        foreach (var item in sorted_list) {
            Console.WriteLine(string.Format("{0,20} {1,20}", item[0], item[1]));
        }
    }
}
