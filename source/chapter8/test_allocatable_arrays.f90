program test_allocatable_arrays
   implicit none
   real, dimension(:), allocatable::arr1
   real, dimension(8):: arr2 = [1., 2., 3., 4., 5., 6., 7., 8.]
   real, dimension(3)::arr3 = [1., -2., 3.]
   arr1 = 2.*arr3
   arr1 = arr2(1:8:2)
   write (*, *) arr1
   arr1 = 2.*arr2(1:4)
   write (*, *) arr1
end program test_allocatable_arrays
