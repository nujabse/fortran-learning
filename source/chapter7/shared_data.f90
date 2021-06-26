module shared_data
   implicit none
   save ! Use save to ensure that the contents in the module are unchanged.
   integer, parameter::num_vals = 5
   real, dimension(num_vals)::values
end module shared_data

program test_module
   use shared_data
   implicit none

   real, parameter::PI = 3.141592
   values = PI*[1., 2., 3., 4., 5.]
   call sub1
end program test_module

subroutine sub1
   use shared_data
   implicit none
   write (*, *) values
end subroutine sub1
