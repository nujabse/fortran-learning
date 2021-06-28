subroutine simu1(a, b, ndim, n, error)
   implicit none
   integer, intent(in)::ndim
   real, intent(inout), dimension(ndim, ndim)::a
   real, intent(inout), dimension(ndim)::b
   integer, intent(in)::n
   integer, intent(out)::error
   real, parameter::epsilon = 1.0e-6
   real::factor
   integer::irow
   integer::ipeak
   integer::jrow
   integer::kcol
   real::temp
   mainloop: do irow = 1, n
      ipeak = irow
      max_pivot: do jrow = irow + 1, n
         if (abs(a(jrow, irow)) > abs(a(ipeak, irow))) then
            ipeak = jrow
         end if
      end do max_pivot
      singular: if (abs(a(ipeak, irow)) < epsilon) then
         error = 1
         return
      end if singular
      swap_eqn: if (ipeak /= irow) then
         do kcol = 1, n
            temp = a(ipeak, kcol)
            a(ipeak, kcol) = a(irow, kcol)
            a(irow, kcol) = temp
         end do
         temp = b(ipeak)
         b(irow) = temp
      end if swap_eqn
      eliminate: do jrow = 1, n
         if (jrow /= irow) then
            factor = -a(jrow, irow)/a(irow, irow)
            do kcol = 1, n
               a(jrow, kcol) = a(irow, kcol)*factor + a(jrow, kcol)
            end do
            b(jrow) = b(irow)*factor + b(jrow)
         end if
      end do eliminate
   end do mainloop
   divide: do irow = 1, n
      b(irow) = b(irow)/a(irow, irow)
      a(irow, irow) = 1.
   end do divide
end subroutine simu1
