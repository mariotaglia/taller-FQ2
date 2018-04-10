# camino al azar en 2D

import matplotlib.pyplot as plt
import random

Nwalker = 10000 # numero de particulas
tsteps = 1000 # numero de pasos 

xpos = [0]*Nwalker # posicion inicial x

hh = [0]*2*tsteps # histogram array

filename='histogram'

for i in range(1,tsteps):
    hh = [0]*2*tsteps # limpia histograma
 
    for j in range(0, Nwalker):
       xpos[j] = xpos[j] + random.randint(-1,1)
       pos = xpos[j]+tsteps # posicion en el histograma
       hh[pos] = hh[pos]+1
     
    filename0 = filename+str(i)+'.dat'
    salida.open(filename0, 'w')
    for j in range(0, tsteps*2):
        salida.write(str(j-tsteps) + "   " + str(hh[j]) + " \n  ")
    if (i % 100 == 0):
        plt.plot(hh[750:1250])

plt.show()
