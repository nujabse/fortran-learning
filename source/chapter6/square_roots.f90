program square_roots
    implicit none
    integer:: i
    real, dimension(10)::value = [(i, i=1,10)]
    real, dimension(10)::square_root
    do i = 1, 10
        square_root(i) = SQRT(value(i))
    end do
    do i = 1, 10
        write(*,100) value(i), square_root(i)
        100 format('Value = ', F5.1, ' Square Root = ', F10.4)
    end do
end program square_roots