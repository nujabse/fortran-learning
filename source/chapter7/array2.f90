program array2
   implicit none

   ! demonstration of array overbound
   integer::i
   real, dimension(5)::a = 0.
   ! call subroutine
   call sub1(a, 5, 6)
   do i = 1, 6
      write (*, 100) i, a(i)
100   format('A(', I1, ')= ', f6.2)
   end do
end program array2

subroutine sub1(a, ndim, n)
   implicit none
   integer, intent(in)::ndim
   real, intent(out), dimension(ndim)::a
   integer, intent(in)::n
   integer::i
   do i = 1, n
      a(i) = i
   end do
end subroutine sub1
