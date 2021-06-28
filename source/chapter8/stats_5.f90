program stats_5
   implicit none
! allocate
   real, allocatable, dimension(:)::a
   character(len=20)::filename
   integer::i
   integer::iptr ! pointer to the minimum
   integer::j
   real::median
   character(len=80)::msg
   integer::nvals = 0
   integer::status
   real::std_dev
   real::sum_x = 0.
   real::sum_x2 = 0.
   real::temp
   real::x_bar
!Get the file with input data
   write (*, 1000)
1000 format('Enter the file name with the data to the sorted:')
   read (*, '(A20)') filename
   ! open the input data file
   open (UNIT=9, file=filename, status='OLD', action='READ', &
         iostat=status, iomsg=msg)
   fileopen: if (status == 0) then
      do
         read (9, *, iostat=status) temp
         if (status /= 0) exit
         nvals = nvals + 1
      end do
      write (*, *) 'Allocating a: size = ', nvals
      allocate (a(nvals), stat=status)
      allocate_ok: if (status == 0) then
         rewind (unit=9)
         read (9, *) a
         outer: do i = 1, nvals - 1
            iptr = i
            inner: do j = i + 1, nvals
               minval: if (a(j) < a(iptr)) then
                  iptr = j
               end if minval
            end do inner
            swap: if (i /= iptr) then
               temp = a(i)
               a(i) = a(iptr)
               a(iptr) = temp
            end if swap
         end do outer
! Now the data is in order, sum up
         sums: do i = 1, nvals
            sum_x = sum_x + a(i)
            sum_x2 = sum_x2 + a(i)**2
         end do sums
         enough: if (nvals < 2) then
! not enough data
            write (*, *) 'At least 2 values must be entered'
         else
            ! Calculted the average, median and stv
            x_bar = sum_x/real(nvals)
            std_dev = sqrt((real(nvals)*sum_x2 - sum_x**2) &
                           /(real(nvals)*real(nvals - 1)))
            even: if (mod(nvals, 2) == 0) then
               median = (a(nvals/2) + a(nvals/2 + 1))/2.
            else
               median = a(nvals/2 + 1)
            end if even
            ! wirte the output
            write (*, *) 'The mean of this data set is : ', x_bar
            write (*, *) 'The median of this data set is : ', median
            write (*, *) 'The standard of this data set is : ', std_dev
            write (*, *) 'The number of this data set is : ', nvals
         end if enough
         deallocate (a, stat=status)
      end if allocate_ok
      else fileopen
      write (*, 1050) trim(msg)
1050  format('File open failed --atatus = ', A)
   end if fileopen
end program stats_5
