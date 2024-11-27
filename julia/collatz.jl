using Printf

function calculate_sequence_length(n:: UInt128)
    counter = UInt128(0)
    while n != 1
        if n % 2 == 0
            n /= 2
        else
            n = n * 3 + 1
        end

        counter += 1
    end

    return counter
end

function get_min_index(seq_list:: Vector{Vector{UInt128}})
    min_ind = 1

    for (i, pair) in enumerate(seq_list)
        min_pair = seq_list[min_ind]

        if pair[2] < min_pair[2]
            min_ind = i
        elseif pair[2] == min_pair[2]
            if pair[1] > min_pair[1]
                min_ind = i
            end
        end
    end

    return min_ind
end

function compare_and_add(n:: UInt128, seq_len:: UInt128, seq_list:: Vector{Vector{UInt128}})
    for pair in seq_list
        if seq_len == pair[2]
            return
        end
    end

    if length(seq_list) < 10
        push!(seq_list, [n, seq_len])
        return
    end

    min_ind = get_min_index(seq_list)
    min_pair = seq_list[min_ind]

    if seq_len > min_pair[2]
        seq_list[min_ind] = [n, seq_len]
    end
end

function print_by_seq_len(seq_list:: Vector{Vector{UInt128}})
    println("Sorted based on sequence length")
    sorted_vector = sort(seq_list, by = x -> x[2])
    reverse!(sorted_vector)

    for item in sorted_vector
        @printf("%20s %20s\n", item[1], item[2])
    end
end

function print_by_n(seq_list:: Vector{Vector{UInt128}})
    println("Sorted based on integer size")
    sorted_vector = sort(seq_list, by = x -> x[1])
    reverse!(sorted_vector)

    for item in sorted_vector
        @printf("%20s %20s\n", item[1], item[2])
    end
end

function main()
    seq_list = Vector{Vector{UInt128}}()

    start_val = parse(UInt128, ARGS[1])
    end_val = parse(UInt128, ARGS[2])

    for i in range(start_val, end_val)
        if i % 100000 == 0
            @printf("At %s\n", string(i, format="a"))
        end

        seq_len = calculate_sequence_length(i)
        compare_and_add(i, seq_len, seq_list)
    end

    print_by_seq_len(seq_list)
    print_by_n(seq_list)
end

main()
