real function ave_value(func, first_value, last_value, n)
   implicit none
   real, external :: func
   real, intent(in) :: first_value, last_value
   integer, intent(in)::n

   real::delta
   integer::i
   real::sum

   delta = (last_value - first_value)/real(n - 1)
   sum = 0
   do i = 1, n
      sum = sum + func(real(i - 1)*delta)
   end do
   ave_value = sum/real(n)
end function ave_value

program test_ave_value
   implicit none

   real::ave_value
   real, external::my_function
   real::ave

   ave = ave_value(my_function, 0., 1., 101)
   write (*, 1000) 'my_function', ave
1000 format('The average value of ', a, ' between 0. and 1. is ', &
          f16.6, '.')
end program test_ave_value

real function my_function(x)
   implicit none
   real, intent(in) :: x

   my_function = 3.*x

end function my_function
