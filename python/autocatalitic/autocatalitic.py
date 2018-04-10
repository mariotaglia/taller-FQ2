# program autocatalitic
# calcula la evolucion temporal de una reaccion autocatalitica

# A + X --> 2A
# X -> P

import matplotlib.pyplot as plt

tsteps = 1000 # numero de pasos
dt = 20.0 # intervalo de tiempo

k1 = 0.001
k2 = 0.0001

A = 0.001 # concentracion inicial de A
X = 1.0 # concentracion inicial de X
t = 0.0 # tiempo inicial

Alist = []
Xlist = []
tlist = []

for i in range(0, tsteps):
    tlist.append(t)
    Alist.append(A)
    Xlist.append(X)

    t = t + dt
    dA =  2*k1*dt*X*A
    dX = -k1*dt*X*A - k2*dt*X
    A = A + dA
    X = X + dX

    
filename='autocat.txt'
salida.open(filename, 'w')
for i in range(0, tsteps):
    salida.write(str(tlist[i])+"   "+str(Alist[i])+"   \n")

plt.plot(tlist,Alist)
plt.show()
