program BD
implicit none

real :: D, xpos
real :: mean, sd
integer :: i, j
real :: rand1
real :: dt
integer, parameter :: tsteps = 1000
integer, parameter :: repeats = 100000
integer, parameter :: bins = 1000
real :: dx
integer :: seed
real :: x(bins), c(bins)
real :: rms(tsteps), avpos(tsteps)


seed = 33232
D = 1  ! units of dx*2/dt
dx = sqrt(D*float(tsteps))/float(bins)
rms = 0.0
avpos = 0.0

do i = 1, bins
 x(i) = (float(i) - float(bins)/2)*dx
 c(i) = 0.0
enddo

dt = 0.1

mean = 0.0
sd = 1.0

do j = 1, repeats
xpos = 0.0 ! posicion inicial
do i = 1, tsteps
	call randomgauss(mean, sd, seed, rand1)
	xpos = xpos + dt*sqrt(2*D)*rand1
        rms(i) = rms(i) + xpos**2
        avpos(i) = avpos(i) + xpos
enddo

do i = 1, bins-1
  if((xpos.gt.x(i)).and.(xpos.le.x(i+1)))c(i)=c(i)+1
enddo

enddo ! j

do i = 1, bins-1
 write(100,*)x(i), c(i)
enddo

do i = 1, tsteps
 write(101,*)i,rms(i)/float(repeats)
enddo

do i = 1, tsteps
 write(102,*)i,avpos(i)/float(repeats)
enddo

end


subroutine randomgauss(mean, sd, seed, rand1)
implicit none

REAL :: mean, sd
real, external :: ran2
real :: rand1
real :: r1, r2
real :: pi
integer :: seed

pi = acos(-1.0)

r1 = 0.0
r2 = 0.0

do while (r1.eq.0.0) 
r1 = ran2(seed)
enddo
do while (r2.eq.0.0)
r2 = ran2(seed)
enddo

! Now convert to normal distribution
rand1 = sd * SQRT(-2.0*LOG(r1)) * COS(2*pi*r2) + mean
end

real FUNCTION ran2(idum)
  INTEGER idum,idum2
  INTEGER IM1,IM2,IMM1,IA1,IA2,IQ1,IQ2,IR1,IR2,NTAB,NDIV
  REAL AM,EPS,RNMX
  PARAMETER (IM1=2147483563,IM2=2147483399,AM=1./IM1,IMM1=IM1-1)
  PARAMETER (IA1=40014,IA2=40692,IQ1=53668,IQ2=52774,IR1=12211,IR2=3791)
  PARAMETER (NTAB=32,NDIV=1+IMM1/NTAB,EPS=1.2e-7,RNMX=1.-EPS)
  INTEGER j,k,iv(NTAB),iy
  SAVE iv,iy,idum2
  DATA idum2/123456789/, iv/NTAB*0/, iy/0/
  if (idum.le.0) then
     idum=max(-idum,1)
     idum2=idum
     do j=NTAB+8,1,-1
        k=idum/IQ1
        idum=IA1*(idum-k*IQ1)-k*IR1
        if (idum.lt.0) idum=idum+IM1
        if (j.le.NTAB) iv(j)=idum
     enddo
     iy=iv(1)
  endif
  k=idum/IQ1
  idum=IA1*(idum-k*IQ1)-k*IR1
  if (idum.lt.0) idum=idum+IM1
  k=idum2/IQ2
  idum2=IA2*(idum2-k*IQ2)-k*IR2
  if (idum2.lt.0) idum2=idum2+IM2
  j=1+iy/NDIV
  iy=iv(j)-idum2
  iv(j)=idum
  if(iy.lt.1)iy=iy+IMM1
  ran2=min(AM*iy,RNMX)
  return
END FUNCTION ran2
