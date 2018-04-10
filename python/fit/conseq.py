
# calcula la evolucion temporal de una reaccion consecutiva

# R --> I
# I --> P

tsteps = 200 # numero de pasos
dt = 20.0 # intervalo de tiempo

k1 = 0.004
k2 = 0.002
ki1 = 0.004

R = 0.54 # concentracion inicial de A
I = 0.129 # concentracion inicial de X
t = 0.0

Rlist = []
Ilist = []
tlist = []

for i in range(0, tsteps):
    tlist.append(t)
    Rlist.append(R)
    Ilist.append(I)

    t = t + dt
    dR =  -k1*dt*R + ki1*dt*I
    dI = k1*dt*R - k2*dt*I - ki1*dt*I
    R = R + dR
    I = I + dI

    
filename='Rfit.dat'
with open(filename, 'w') as salida:
    for i in range(0, tsteps-1):
        salida.write(str(tlist[i])+"   "+str(Rlist[i])+"   \n")

filename='Ifit.dat'
with open(filename, 'w') as salida:
    for i in range(0, tsteps-1):
        salida.write(str(tlist[i])+"   "+str(Ilist[i])+"   \n")

        
