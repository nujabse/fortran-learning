! Demonstrates the false use of subroutine call
program bad_call
   implicit none
   real::x = 1
   call bad_argument(x)
end program bad_call

subroutine bad_argument(i)
