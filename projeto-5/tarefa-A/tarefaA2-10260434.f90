Program Tarefa_A2

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
parameter (nmax = 5000)
dimension omega(nmax), theta(nmax), tempo(nmax), energia(nmax)

pi = 4.d0*datan(1.d0)
dt = 0.01	!s
a_l = 9.8	!m
g = 9.8		!m/s
m = 1.d0	!kg
tempo(0) = 0.d0		!s
omega(0) = 0.d0		!rad/s
theta(0) = (10.d0/180.d0)*pi	!10° graus

open(10, file = 'saida-tarefaA2.2-10260434.dat')
do i=0, nmax	!Método de Euler-Cromer
	tempo(i+1) = tempo(i) + dt
	omega(i+1) = omega(i) - (g/a_l)*theta(i)*dt
	theta(i+1) = theta(i) + omega(i+1)*dt
	energia(i) = (1.d0/2.d0)*m*omega(i)**2 + ((m*g)/(2.d0*a_l))*theta(i)**2
	write(10,*) tempo(i), omega(i), theta(i), energia(i)
end do
close(10)
End Program Tarefa_A2
