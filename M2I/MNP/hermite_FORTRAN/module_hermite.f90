module module_hermite
!-----------------------------------------------------------------------
!
!-----------------------------------------------------------------------
use iso_fortran_env, only: real64
implicit none

contains

!-----------------------------------------------------------------------
! hermite: permite obetener los coeficientes del polinomio de interpolación de
! Hermite H(x) en (n+1) nodos distintos x0,...,xn para la función f.
!
! INPUT: x = [x0,...,xn]
!        fx = [f(x0),...,f(xn)]
!        dfx = [df(x0),...,df(xn)]
!        n = último índice del nodo x
!
! OUTPUT: Q = [Q00, Q11,..., Q(2n+1)(2n+1)]
!-----------------------------------------------------------------------
subroutine hermite(x,fx,dfx,q,n)

real(real64), dimension(0:n), intent(in)  :: x    ! nodos de interpolación
real(real64), dimension(0:n), intent(in) :: fx, dfx 	! valores de la función f y su derivada en los nodos x
real(real64), dimension(0:2*n+1), intent(inout) :: q	! coeficientes del polinomio de interpolación de Hermite
integer, intent(in) :: n	! último índice del nodo x

real(real64), dimension(0:2*n+1,0:2*n+1) :: QQ
real(real64), dimension(0:2*n+1) :: z
real(real64) :: tol=1.e-10
integer :: i, j

do i=0,n
	z(2*i) = x(i)
	z(2*i+1) = x(i)
	QQ(2*i,0) = fx(i)
	QQ(2*i+1,0) = fx(i)
	QQ(2*i+1,1) = dfx(i)
	if (i .ne. 0) QQ(2*i,1)=(QQ(2*i,0)-QQ(2*i-1,0))/(z(2*i)-z(2*i-1))
end do

do i=2,2*n+1
	do j=2,i
		QQ(i,j)=(QQ(i,j-1)-QQ(i-1,j-1))/(z(i)-z(i-j))
	end do
end do

do i=0,2*n+1
	q(i)=QQ(i,i)
end do

end subroutine


end module
