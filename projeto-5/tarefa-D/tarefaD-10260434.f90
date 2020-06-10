Program Tarefa_D

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
parameter (nmax = 8000)
dimension omega(nmax), theta(nmax), tempo(nmax)

!Confecção do gráfico omega vs theta
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
theta(0) = (30.d0/180.d0)*pi 	!30° graus

open(10, file = 'saida-tarefaD1.2-10260434.dat')
do i=0, nmax

	if (theta(i) .ge. 2.d0*pi) then
		theta(i) = theta(i) - 2.d0*pi
	else if (theta(i) .le. -2.d0*pi) then
		theta(i) = theta(i) + 2.d0*pi
	end if	!limitação do ângulo 0 < theta < 2*pi
	
	tempo(i+1) = tempo(i) + dt
	omega(i+1) = omega(i) - (g/a_l)*dsin(theta(i))*dt - res*omega(i)*dt + F_0*dsin(freq*tempo(i))*dt
	theta(i+1) = theta(i) + omega(i+1)*dt
	write(10,*) omega(i) , theta(i)
end do
close(10)
End Program Tarefa_D
