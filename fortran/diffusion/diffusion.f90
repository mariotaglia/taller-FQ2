program diffusion
implicit none

real, parameter :: D = 0.1
integer, parameter :: tsteps = 1000
integer, parameter :: xsize = int(sqrt(tsteps*D)) * 10
real :: c(xsize), dc(xsize)
integer :: i, j

! initialize variables
c = 0.0
dc = 0.0


!c(int(xsize/2)) = 1.0
!c(1:xsize/2) = 1.0

do j = 2, xsize-1
 c(j) = 1.0
enddo

! loop over time
do i = 1, tsteps

! loop over size
  do j = 2, xsize-1
    dc(j) = D*(c(j+1)-2.0*c(j)+c(j-1))/4.0
  enddo
  do j = 1, xsize
    c(j) = c(j) + dc(j)
    if(mod(i-1,tsteps/int(tsteps/10)).eq.0.0)write(100+i,*)j,c(j)
  enddo
enddo
end
