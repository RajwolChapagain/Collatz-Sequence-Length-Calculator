program collatz
    integer(kind=16), allocatable :: seq_list(:,:)
    integer ind

    allocate(seq_list(3, 2))
    seq_list(1, 1) = 10
    seq_list(1, 2) = 10
    seq_list(2, 1) = 5
    seq_list(2, 2) = 5
    seq_list(3, 1) = 4
    seq_list(3, 2) = 5

    ind = get_min_index(seq_list)

    print *, ind
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

    integer function get_min_index(seq_list) result(min_ind)
        integer(kind=16), intent(in), allocatable :: seq_list(:,:)
        integer(kind=16) :: min_pair(2)
        integer(kind=16) :: pair(2)
        integer i

        min_ind = 1

        if (.not. allocated(seq_list)) then
            return
        endif

        do i = 1, size(seq_list, 1)
            min_pair(1) = seq_list(min_ind, 1)
            min_pair(2) = seq_list(min_ind, 2)

            pair(1) = seq_list(i, 1)
            pair(2) = seq_list(i, 2)

            if (pair(2) < min_pair(2)) then
                min_ind = i
            else if (pair(2) == min_pair(2)) then
                if (pair(1) > min_pair(1)) then
                    min_ind = i
                end if
            end if
        end do

    end function

end program collatz
