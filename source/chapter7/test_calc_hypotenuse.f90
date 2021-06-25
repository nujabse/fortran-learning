program test_calc_hypotenuse
   implicit none
   real:: s1
   real:: s2
   real:: hypot
   write (*, *) 'Program to test subroutine calc_hypotenuse'
   write (*, *) 'This can be run using quickrun-eshell command in emacs'
   write (*, *) 'Enter the length of side 1:'
   read (*, *) s1
   write (*, *) 'Enter the length of side 2:'
   read (*, *) s2
   ! call the subroutine
   call calc_hypotenuse(s1, s2, hypot)
   write (*, 1000) hypot
1000 format('The length of the hypotenuse is:', F10.4)
end program test_calc_hypotenuse

subroutine calc_hypotenuse(side_1, side_2, hypotenuse)
   implicit none
   real, intent(in)::side_1
   real, intent(in)::side_2
   real, intent(out):: hypotenuse
   real::temp
   temp = side_1**2 + side_2**2
   hypotenuse = SQRT(temp)
end subroutine calc_hypotenuse
