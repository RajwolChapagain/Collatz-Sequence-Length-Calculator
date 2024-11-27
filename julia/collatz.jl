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

println(calculate_sequence_length(UInt128(989345275647)))

