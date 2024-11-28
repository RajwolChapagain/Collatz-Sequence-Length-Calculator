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


    integer(kind=16) function get_min_index(seq_list) result(min_ind)
        integer(kind=16), intent(in) :: seq_list(:,:) 
        integer :: i
        integer(kind=16) :: min_pair(2)

        min_ind = 1
        do i = 1, size(seq_list, 1) 
            min_pair = seq_list(min_ind,:)

            if (seq_list(i,2) < min_pair(2)) then
                min_ind = i
            else if (seq_list(i,2) == min_pair(2)) then
                if (seq_list(i,1) > min_pair(1)) then
                    min_ind = i
                end if
            end if
        end do
    end function get_min_index

end program collatz
