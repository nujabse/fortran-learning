program bounds
   implicit none
   integer::i
   real, dimension(5)::a = (/1., 2., 3., 4., 5./)
   real, dimension(5)::b = (/10., 20., 30., 40., 50./)
   do i = 1, 6
      write (*, 100) i, a(i)
100   format('a(', i1, ') =  ', f6.2)
   end do
end program bounds
