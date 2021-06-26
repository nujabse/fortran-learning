! Demonstrates the false use of subroutine call
program bad_call
   implicit none
   real::x = 1
   call bad_argument(x)
end program bad_call

subroutine bad_argument(i)
   implicit none
   integer::i
   write (*, *) ' i = ', i
end subroutine bad_argument
