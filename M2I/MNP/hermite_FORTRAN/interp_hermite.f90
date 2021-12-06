program interp_hermite
!-----------------------------------------------------------------------
!
! Programa principal que permite interpolar un valor x_interp mediante
! la interpolación de Hermite.
!
!-----------------------------------------------------------------------
use module_hermite

implicit none
real(real64), dimension(:), allocatable :: x, fx, dfx, q
real(real64) :: x_interp
integer :: n, n_nodos

real(real64), dimension(:), allocatable :: dif, h
real(real64) :: valor, prod
integer :: i, j

print*, 'Interpolación de Hermite'
print*, 'Número total de nodos:'
read*, n_nodos; print*, n_nodos

n=n_nodos-1
allocate(x(0:n), fx(0:n), dfx(0:n), q(0:2*n+1))
allocate(dif(2*n+1), h(2*n+2))

print*, 'Vector de nodos conocidos:'
read*, x; print*, x
print*, 'Valor de la función f en los nodos:'
read*, fx; print*, fx
print*, 'Valor de la derivada f'' en los nodos:'
read*, dfx; print*, dfx
print*, 'Nodo a interpolar:'
read*, x_interp; print*, x_interp

call hermite(x,fx,dfx,q,n)

do i=1,n
	dif(2*i-1) = x_interp-x(i-1)
	dif(2*i) = x_interp-x(i-1)
end do
dif(2*n+1)=x_interp-x(n)

h=1
do i=1,2*n+1
	prod=1
	do j=1,i
		prod=prod*dif(j);
	end do
	
	h(i+1)=prod
end do


valor=dot_product(q,h)
print*, 'f(x_interp)= ', valor










end program