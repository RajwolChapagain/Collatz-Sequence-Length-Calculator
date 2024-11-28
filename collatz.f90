program collatz
    integer(kind=16), allocatable :: seq_list(:,:)
    integer ind

    call compare_and_add(10_16, 44_16, seq_list) 
    call compare_and_add(12_16, 45_16, seq_list) 
    call compare_and_add(14_16, 46_16, seq_list) 
    call compare_and_add(18_16, 60_16, seq_list) 
    call compare_and_add(19_16, 70_16, seq_list) 
    call compare_and_add(20_16, 71_16, seq_list) 
    call compare_and_add(21_16, 73_16, seq_list) 
    call compare_and_add(22_16, 74_16, seq_list) 
    call compare_and_add(23_16, 75_16, seq_list) 
    call compare_and_add(24_16, 76_16, seq_list) 
    call compare_and_add(25_16, 77_16, seq_list) 

    do i = 1, size(seq_list, dim=1)
        print *, i, ": ", seq_list(i, 1), " ", seq_list(i, 2)
    end do

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

    subroutine compare_and_add(n, seq_len, seq_list)
        integer(kind=16) :: n, seq_len
        integer(kind=16), intent(inout), allocatable :: seq_list(:,:)
        integer(kind=16), allocatable :: temp(:,:)
        integer(kind=16) :: pair(2)
        integer(kind=16) :: min_pair(2)
        integer i, min_ind

        if (.not. allocated(seq_list)) then
            allocate(seq_list(1, 2))
            seq_list(1, 1) = n
            seq_list(1, 2) = seq_len
            return
        endif

        do i = 1, size(seq_list, 1)
            pair(1) = seq_list(i, 1)
            pair(2) = seq_list(i, 2)

            if (seq_len == pair(2)) then
                return
            end if
        end do

        if (size(seq_list, dim=1) < 10) then
            allocate(temp(size(seq_list, dim=1), 2))

            do i = 1, size(temp, dim=1)
                temp(i, 1) = seq_list(i, 1)
                temp(i, 2) = seq_list(i, 2)
            end do
            deallocate(seq_list)
            allocate(seq_list( size(temp, dim=1) + 1, 2))

            do i = 1, size(temp, dim=1)
                seq_list(i, 1) = temp(i, 1)
                seq_list(i, 2) = temp(i, 2)
            end do

            seq_list(size(seq_list, dim=1), 1) = n
            seq_list(size(seq_list, dim=1), 2) = seq_len
            deallocate(temp)

            return
        end if

        min_ind = get_min_index(seq_list)
        min_pair(1) = seq_list(min_ind, 1)
        min_pair(2) = seq_list(min_ind, 2)

        if (seq_len > min_pair(2)) then
            seq_list(min_ind, 1) = n
            seq_list(min_ind, 2) = seq_len
        end if

    end subroutine

end program collatz
