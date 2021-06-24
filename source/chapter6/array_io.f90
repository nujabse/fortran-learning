program array_io
    implicit none
    real, dimension(5)::a = [1.,2.,3.,20.,10.]
    integer, dimension(4)::vec = [4,3,4,5]
    ! output the whole array
    write(*,100) a
    100 format(6F8.3)
    write(*,100) a(2::2)
    write(*,100) a(vec)
end program array_io