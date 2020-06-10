Program Tarefa_C

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
parameter (nmax = 2000)
dimension omega(nmax), theta(nmax), tempo(nmax), omega1(nmax), theta1(nmax), dtheta(nmax)
!Inclusão do segundo pêndulo, diferentes condições iniciais
!porém mesmo contador de tempo

pi = 4.d0*datan(1.d0)
dt = 0.03	!s
a_l = 9.8	!m
g = 9.8		!m/s
m = 1.d0	!kg
F_0 = 0.5
res = 0.5
freq = 2.0/3.0
tempo(0) = 0.d0	!s
omega(0) = 0.d0	!m/s
theta(0) = (30.d0/180.d0)*pi	!30° graus
omega1(0) = 0.d0	!m/s
theta1(0) = theta(0) - 0.001	

open(10, file = 'saida-tarefaC-10260434.dat')
do i=0, nmax
	tempo(i+1) = tempo(i) + dt
	omega(i+1) = omega(i) - (g/a_l)*dsin(theta(i))*dt - res*omega(i)*dt + F_0*dsin(freq*tempo(i))*dt
	theta(i+1) = theta(i) + omega(i+1)*dt
	omega1(i+1) = omega1(i) - (g/a_l)*dsin(theta1(i))*dt - res*omega1(i)*dt + F_0*dsin(freq*tempo(i))*dt
	theta1(i+1) = theta1(i) + omega1(i+1)*dt
	dtheta(i) = abs( theta1(i)-theta(i) )
	write(10,*) tempo(i), dlog(dtheta(i))	!dados já em logarítmo natural
end do
close(10)
End Program Tarefa_C
