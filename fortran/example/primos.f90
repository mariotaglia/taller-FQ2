!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!  Programa para encontrar numeros primos, lo vamos a usar como ejemplo para mostrar la estructura
!  basica de un programa en Fortran, incluyendo el uso de variables y estructuras de control.
! 
!  Para correr este programa hacer:
!
!  gfortran primos.f90 -o primos
!  ./primos
!
! MT 11/2/18
!
!

! Todo lo que empieza con "!" son comentarios para Fortran

program primos     ! esta linea define el nombre el programa   
implicit none      ! "implicit none" obliga al programador a definir el tipo de cada variable
                   ! usar "implicit none" es una buena practica de programacion
 
! Ahora empieza la declaracion de variables, hay que declarar todas las variables antes de comenzar con 
! las intrucciones propiamente dichas 

integer, parameter :: maxnumero = 1000  ! "integer" declara que la variable es un entero, "parameter"
                                        ! indica que su valor no puede ser cambiado en tiempo de ejecucion
                                        ! maxnumero es el numero maximo que sera estudiado para ver si es primo

integer :: i, j                         ! i, j son variables auxiliares que se emplearan

real :: numerador, divisor, resto       ! "real" declara que la variable es un real, tambien llamado "punto flotante"
                                        ! estos reales se usaran para chequear si un numero es primo o no

integer :: flagprimo                    ! flagprimo es un 'flag' (bandera), veremos su uso mas adelante

integer :: counter                      ! counter es un contador, que incrementaremos en uno cada vez que encontremos un primo

integer :: primo(maxnumero)             ! primo(maxnumero) es un array (vector), en el cual guardaremos los primos que encontremos
                                        ! como todavia no sabemos cuantos primos vamos a encontrar, lo declaramos con un tamanio
                                        ! "maxnumero"... seguro nos alcanza

! Ahora comienza el codigo en si, es decir las instrucciones que queremos ejecutar
! A partir de aca no podemos definir mas variables

open(file='primos.dat', unit=100)       ! esta linea sirve para crear el archivo 'primos.dat' y asignarle el numero 100
                                        ! en este archivo vamos a guardar los primos que encontremos 

counter = 0                             ! inicializamos el contador a cero... todavia no encontramos ningun primo

do i = 2, maxnumero                     ! la construccion "do ... enddo" nos permite repetir un conjunto de intrucciones 
                                        ! con un contador (en este caso "i") que se incrementa en cada ciclo
                                        ! en este caso, la variable i es el numero que vamos a ver si es primo o no

flagprimo = 1                           ! suponemos que el numero i es primo, entonces hacemos que el flag sea igual a uno
                                        ! si luego descubrimos un divisor para i, apagamos el flag, es decir lo hacemos igual a cero

  do j = 2, i-1                         ! esta ciclo do...enddo esta adentro del primero. vamos a ver todos los numero de 2 a i-1 y
                                        ! ver si "i" es divisible por "j"

  numerador = float(i)                  ! el numerador es "i", aca float transforma el tipo de variable de i (entero) a un real
                                        ! esto parace innecesario... pero es muy importante para lo que vamos a hacer!!!
  divisor = float(j)                    

  resto = numerador/divisor - int(numerador/divisor)   ! en esta linea "int" toma la parte entera. Entonces "resto" es el resto
                                                       ! decimal de dividir i por j 

  if(resto.eq.0.0) then                                ! la construccion "if...endif" permite evaluar una condicion y ejecutar
                                                       ! codigo solo si la condicion es verdadera
                                                       ! en este caso usamos ".eq." para ver si el resto es igual a cero
                                                       ! otras posibilidades son ".le." y ".ge." para menor o igual y mayor o igual
                                                       ! ".lt." y ".gt." para menor y mayor estricto
                                                       ! ".ne." para distinto
                                                       ! en este caso, si el resto es cero, el numero no es primo

    flagprimo = 0                                      ! si el numero no es primo, entonces apagamos el flag

  endif                                                ! aca termina el if sobre resto

 enddo                                                 ! aca termina el ciclo sobre j

  if(flagprimo.eq.1) then                              ! si el flag sigue siendo uno, entonces el numero es primo
   
    counter = counter + 1                              ! incrementamos el contador en uno

    primo(counter) = i                                 ! guardamos el primo en el array, por si lo queremos usar luego

    print*, 'El numero ', i, ' es el ', counter, 'numero primo' ! imprimimos un mensaje a pantalla

    write(100,*)counter, i                             ! guardar al archivo 'primos.dat', luego lo vamos a graficar

  endif                                                ! termina el if sobre el flag
 
enddo                                                  ! termina el ciclo sobre i

print*, 'Ahora, al reves!'                             ! ahora vamos a aprovechar que guardamos los primos en un array para
                                                       ! imprimirlos en orden inverso

do j = counter,1,-1                                    ! notar el "-1" que nos dice que incrementemos j en -1 en cada ciclo
    print*, 'El numero ', primo(j), ' es primo'
enddo

end                                                    ! esta linea termina el programa
