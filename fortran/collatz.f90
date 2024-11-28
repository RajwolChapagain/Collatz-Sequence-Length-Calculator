program collatz
    implicit none

    integer(kind=16) :: x

    x = 989345275647

    print *, calculate_sequence_length(x)

contains
    function calculate_sequence_length(n) result(counter)
        integer(kind=16) :: n
        integer(kind=16) :: counter

        counter = 0
        do while (n /= 1)
            if (mod(n, 2) == 0) then
                n = n / 2
            else
                n = n * 3 + 1
            end if

            counter = counter + 1
        end do
    end function calculate_sequence_length

end program collatz
