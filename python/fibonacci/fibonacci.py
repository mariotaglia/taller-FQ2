import matplotlib.pyplot as plt

maxnumero = 20  # numero de elementos a calcular
counter = 0	 # lleva la cuenta del numero de primos encontrados
fibo = []

fibo.append(1)
fibo.append(1)

for i in range(2,maxnumero):
   temp = fibo[i-1]+fibo[i-2]
   fibo.append(temp)

for i in range(0,maxnumero):
    print(fibo[i])

for i in range(maxnumero-1,-1,-1):
    print(fibo[i])

plt.plot(fibo,'ro')
plt.show() 
