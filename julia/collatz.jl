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
        push!(seq_list, Vector{UInt128}(n, seq_len))
    end

    min_ind = get_min_index(seq_list)
    min_pair = seq_list[min_ind]

    if seq_len > min_pair[2]
        seq_list[min_ind] = [n, seq_len]
    end
end

function print_by_seq_len(seq_list:: Vector{Vector{UInt128}})
    println("Sorted based on sequence length")
    sorted_vector = sort(outer_vector, by = x -> x[2])

    for item in sorted_vector
        @printf("%20s %20s\n", item[1], item[2])
    end
end

function print_by_n(seq_list:: Vector{Vector{UInt128}})
    println("Sorted based on integer size")
    sorted_vector = sort(outer_vector, by = x -> x[1])

    for item in sorted_vector
        @printf("%20s %20s\n", item[1], item[2])
    end
end

println(calculate_sequence_length(UInt128(989345275647)))

