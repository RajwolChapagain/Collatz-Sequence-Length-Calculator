import sys

sys.setrecursionlimit(2000)

def calculate_sequence_length(n):
    if n == 1:
        return 0

    return 1 + calculate_sequence_length(int(n / 2) if n % 2 == 0 else n * 3 + 1)

# Returns the index of the pair with the smallest sequence length and highest starting value
def get_min_index(seq_list):
    min_ind = 0

    for i, pair in enumerate(seq_list):
        min_pair = seq_list[min_ind]

        if pair[1] < min_pair[1]:
            min_ind = i
        elif pair[1] == min_pair[1]:
            if pair[0] > min_pair[0]:
                min_ind = i

    return min_ind

def compare_and_add(n, seq_len, seq_list):
    # Since n will always be greater than every existing starting value in seq_list,
    # don't add [n, seq_len] if it has the same sequence length as an existing smaller starting value
    for pair in seq_list:
        if seq_len == pair[1]:
            return

    if len(seq_list) < 10:
        seq_list.append([n, seq_len])
        return

    min_ind = get_min_index(seq_list)
    min_pair = seq_list[min_ind]

    if seq_len > min_pair[1]:
        seq_list[min_ind] = [n, seq_len]

def print_by_seq_len(seq_list):
    print("Sorted based on sequence length")
    for item in sorted(seq_list, key=lambda x: x[1], reverse=True):
        print(f"{item[0]:>20} {item[1]:>20}")

def print_by_n(seq_list):
    print("Sorted based on integer size")
    for item in sorted(seq_list, key=lambda x: x[0], reverse=True):
        print(f"{item[0]:>20} {item[1]:>20}")

def main():
    seq_list = []
    
    start = int(sys.argv[1])
    end = int(sys.argv[2])

    for i in range(start, end+1):
        seq_len = calculate_sequence_length(i)

        compare_and_add(i, seq_len, seq_list)

    print_by_seq_len(seq_list)
    print_by_n(seq_list)

main()
