
#  Programa para encontrar numeros primos, lo vamos a usar como ejemplo para mostrar la estructura
#  basica de un programa, incluyendo el uso de variables y estructuras de control.
# 
#  Para correr este programa hacer:
#
#  python3 primos.py
#
# MT 28/3/18
#

# Todo lo que empieza con "#" son comentarios para python

import matplotlib.pyplot as plt

maxnumero = 100  # maximo numero a explorar
counter = 0	 # lleva la cuenta del numero de primos encontrados
primo = []

for i in range(2, maxnumero+1): 		# este comando nos permite ejecutar un loop
                                                # range(ini, end) va a listar todos los numeros desde ini hasta end-1

    flagprimo = True 			# supongamos que tenemos un primo, ahora lo vamos a comprobar

    for j in range (2, i): 	# este es un loop anidado, vamos a ver si i es div. por j
                                # importante: notar que este comando va a ir de 2 a i-1

        if (i%j == 0): 	        # es divisible?
            flagprimo = False       # si lo es, apagamos el flag

    if flagprimo == True:            # el numero es primo? notar identacion	
        counter = counter + 1       # encontramos un primo!!! vamos a incrementar el contador en 1
        primo.append(i)             # lo guardamos en la lista
        print ('El numero ', i, ' es el ', counter, 'numero primo')  # lo imprimimos a pantallar

print ('Ahora, al reves!')                             
                                                       
 
for j in range(counter,0,-1):       # esta lista va ir de counter a 1, incrementando en -1                                  
    print ('El numero ', primo[j-1], ' es primo')   

# save to disk
filename='primos.txt'
salida = open (filename, 'w')
for i in range(0, counter):
    salida.write(str(i) + "   " +  str(primo[i]) + " \n")

plt.plot(primo,'ro')
plt.show() 
