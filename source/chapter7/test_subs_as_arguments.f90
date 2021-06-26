subroutine subs_as_arguments(x, y, sub, result)
   implicit none
   real, intent(in) :: x, y, result
   external::sub
   call sub(x, y, result)
end subroutine subs_as_arguments

program test_subs_as_arguments
   implicit none
   external::sum, prod
   real::x, y, result
   write (*, *) 'Enter x:'
   read (*, *) x
   write (*, *) 'Enter y:'
   read (*, *) y
! calculate the product
   call subs_as_arguments(x, y, prod, result)
   write (*, *) 'The product is ', result
   call subs_as_arguments(x, y, sum, result)
   write (*, *) 'The sum is ', result
end program test_subs_as_arguments

subroutine prod(x, y, result)
   implicit none
   real, intent(in) :: x, y
   real, intent(out):: result
! Calculate the product
   result = x*y
end subroutine prod

subroutine sum(x, y, result)
   implicit none
   real, intent(in) :: x, y
   real, intent(out)::result
   ! calcultate the result
   result = x + y
end subroutine sum
