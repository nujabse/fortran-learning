real function quadf(x, a, b, c)
   implicit none
   real, intent(in) :: x, a, b, c
   quadf = a*x + x**2 + b*x + c
end function quadf

program test_quadf
   implicit none

   real::quadf
   real::a, b, c, x
   write (*, *) 'Enter quadratic coefficients a,b,and c'
   read (*, *) a, b, c
   write (*, *) 'Enter location at which to evaluate equation: '
   read (*, *) x
   write (*, 100) 'quadf ( ', x, ' ) = ', quadf(x, a, b, c)
100 format(A, f10.4, a, f12.4)
end program test_quadf
