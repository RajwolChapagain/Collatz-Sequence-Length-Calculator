program collatz
    integer(kind=16) x

    x = calculate_sequence_length(989345275647_16)

    print *, x

contains
    integer(kind=16) function calculate_sequence_length(n) result(counter)
        integer(kind=16), intent(in) :: n
        integer(kind=16) :: temp_n

        temp_n = n
        counter = 0_16
        do while (temp_n .ne. 1)
            if (mod(temp_n, 2) .eq. 0) then
                temp_n = temp_n / 2
            else
                temp_n = temp_n * 3 + 1
            endif

            counter = counter + 1
        end do
    end function

end program collatz
