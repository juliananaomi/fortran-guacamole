Program Tarefa_A

IMPLICIT REAL*8 (a-h,o-z)
parameter (nmax=500)	!tempo total
dimension y(nmax), x(nmax)

r =	0.39 !raio do planeta (semieixo maior)
pi = 4.d0*datan(1.d0)
v_0 =  4.0*pi	!velocidade inicial


dt = 0.01	!passo temporal

!Condições iniciais
y(0) = 0.d0
y(1) = y(0) + v_0*dt

x(0) = r
x(1) = x(0)

open(10, file= 'saídaAMe_0.01-10260434.dat')
do i=1, nmax
	r = sqrt(x(i)**2 + y(i)**2)
	y(i+1) = 2.0*y(i) - y(i-1) - ((4.0*pi**2 *y(i))/r**3) * dt**2
	x(i+1) = 2.0*x(i) - x(i-1) - ((4.0*pi**2 *x(i))/r**3) * dt**2
	write(10,*) x(i+1), y(i+1)
end do

close(10)

End Program Tarefa_A
