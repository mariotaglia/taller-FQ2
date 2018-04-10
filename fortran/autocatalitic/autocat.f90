program kinetics
implicit none

integer, parameter :: tsteps = 100000
real, parameter :: dt = 2.0
real :: A, dA,X, dX
real :: k1,k2
integer :: j
real :: time


A = 1.0
X = 0.1

k1 = 1e-3
k2 = 1e-4

time = 0.0

do j = 1, tsteps
time = time + dt

dA = -k1*dt*A*X
dX = k1*dt*A*X - k2*dt*X

A = A + dA
X = X + dX

if(mod(j-1,tsteps/100).eq.0) then
write(100,*)time,A
write(101,*)time,X
endif

enddo








end

















