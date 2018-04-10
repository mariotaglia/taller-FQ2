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

program primos     
implicit none      

integer, parameter :: maxnumero = 1000  
integer :: i, j             
real :: numerador, divisor, resto    
integer :: flagprimo            
integer :: counter          
integer :: primo(maxnumero)      

open(file='primos.dat', unit=100)     
counter = 0         

do i = 2, maxnumero   

flagprimo = 1     

  do j = 2, i-1    

  numerador = float(i)     
  divisor = float(j)                    
  resto = numerador/divisor - int(numerador/divisor)  

  if(resto.eq.0.0) then   
    flagprimo = 0 
  endif

 enddo

  if(flagprimo.eq.1) then
    counter = counter + 1 
    primo(counter) = i
    print*, 'El numero ', i, ' es el ', counter, 'numero primo'
    write(100,*)counter, i 
  endif
 
enddo

print*, 'Ahora, al reves!'

do j = counter,1,-1 
    print*, 'El numero ', primo(j), ' es primo'
enddo

end
