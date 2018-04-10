# program diffusion

import matplotlib.pyplot as plt

tsteps = 10000 # numero de pasos de difusion

xsize = 1000 # numero de sitios 

D = 0.1 # coefciente de difusion

c = [0]*xsize

c[500] = 1.0

cnew = c

filename = "diffusion"

for i in range(1, tsteps):
    for j in range(1, xsize-1): 
        cnew[j] = c[j] + D*(c[j+1]-2*c[j]+c[j-1])
    c = cnew
    if (i%200 == 0): # grabar cada 10
        plt.plot(c[250:750])
        filename0 = filename+str(i/20)+'.dat' 
        with open(filename0,'a') as salida:
            for j in range(0, xsize):
                salida.write(str(j)+"   "+str(c[j])+"   \n")

plt.show()
