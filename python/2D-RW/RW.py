# camino al azar en 2D

import random

Nwalker = 10000 # numero de particulas
tsteps = 1000 # numero de pasos 

xpos = [0]*Nwalker # posicion inicial x
ypos = [0]*Nwalker # posicion inicial y

filename='tray.xyz'

for i in range(1,tsteps):
    for j in range(0, Nwalker):
        xpos[j] = xpos[j] + random.randint(-1,1)
        ypos[j] = ypos[j] + random.randint(-1,1)

    salida.open(filename, 'a')
    salida.write(str(Nwalker)+"\n")
    salida.write(str(i)+"\n")
    for j in range(0, Nwalker):
        salida.write(" C  "+str(xpos[j]) + "     "+str(ypos[j])+"     0.0     1.0   \n  ")
