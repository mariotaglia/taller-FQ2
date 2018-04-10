program kinetics
implicit none

integer, parameter :: tsteps = 100000
real, parameter :: dt = 10.0
real :: A, dA, B, dB, X, dX, Y, dY
real :: k1,k2,k3,k4
integer :: j
real :: time


A = 1.0
B = 3.0
X = 0.0
Y = 0.0

k1 = 1e-4
k2 = 1e-4
k3 = 1e-4
k4 = 1e-4

time = 0.0

do j = 1, tsteps
time = time + dt

dA = -k1*dt*A
dX = k1*dt*A + k2*dt*X*X*Y - k3*dt*X*B - k4*dt*X
dY = -k2*dt*X*X*Y + k3*dt*X*B
dB = -k3*dt*X*B

A = A + dA
B = B + dB
X = X + dX
Y = Y + dY


!if(mod(j-1,tsteps/100).eq.0) then
write(100,*)time,A
write(101,*)time,B
write(102,*)time,X
write(103,*)time,Y
!endif

enddo








end

















