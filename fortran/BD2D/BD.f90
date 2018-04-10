program BD
implicit none

integer, parameter :: Npart = 1000
real :: D, xpos(Npart), ypos(Npart)
real :: mean, sd
integer :: i, j
real :: rand1
real :: dt
integer, parameter :: tsteps = 1000
integer :: seed

open(unit=200, file='traj.xyz')

seed = 33232
D = 1  ! units of dx*2/dt

dt = 0.1

mean = 0.0
sd = 1.0

xpos = 0.0 ! posicion inicial
ypos = 0.0 ! posicion inicial
do i = 1, tsteps
write(200,*)Npart
write(200,*)i
do j = 1, Npart
        call randomgauss(mean, sd, seed, rand1)
        xpos(j) = xpos(j) + dt*sqrt(2*D)*rand1

        call randomgauss(mean, sd, seed, rand1)
        ypos(j) = ypos(j) + dt*sqrt(2*D)*rand1

write(200,*)' C ', xpos(j), ypos(j), 0.0, 1.0 
enddo
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
