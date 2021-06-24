program square_2
    implicit none
    integer :: i
    integer, dimension(-5: 5)::number, square
    do i = -5, 5
        number(i) = i
        square(i) = number(i) ** 2
    end do
    ! output number and its square
    do i = -5, 5
        write(*, 100) number(i),square(i)
        100 format('Number = ', i6, ' Square = ', i6)
    end do
end program square_2