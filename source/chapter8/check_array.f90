program check_array
   implicit none
   real, dimension(-5:5, 0:3)::a = 0.
   write (*, 100) shape(a)
100 format('The shape of the array is : ', 7i6)
   write (*, 110) size(a)
110 format('The size of the array is: ', i6)
   write (*, 120) lbound(a)
120 format('The lower bounds of the array are: ', 7i6)
   write (*, 130) ubound(a)
130 format('The upper bounds of the array are: ', 7i6)
end program check_array
