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

println(calculate_sequence_length(UInt128(989345275647)))

