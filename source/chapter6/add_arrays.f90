program add_arrays
    implicit none
    integer::i
    real,dimension(4)::a = [1.,2.,3.,4.]
    real,dimension(4)::b= [5.,6.,7.,8.]
    real,dimension(4)::c,d
    c = a + b
    write(*,100) 'c', c
    100 format(A, ' = ', 4(F6.1, 1x))
end program add_arrays