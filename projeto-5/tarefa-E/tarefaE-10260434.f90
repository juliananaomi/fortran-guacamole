Program Tarefa_E

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
parameter (nmax = 100000)
dimension omega(nmax), theta(nmax), tempo(nmax)

pi = 4.d0*datan(1.d0)
dt = 0.03	!s
a_l = 9.8	!m
g = 9.8		!m/s
m = 1.d0	!kg
F_0 = 1.2
res = 0.5
tempo(0) = 0.d0	!s
freq = 2.0/3.0
omega(0) = 0.d0	!m/s
theta(0) = (30.d0/180.d0)*pi - 0.001	!30° graus

open(10, file = 'saida-tarefaE3.2-10260434.dat')

i_n = 1
do i = 0, nmax

	if (theta(i) .ge. 2.d0*pi) then
		theta(i) = theta(i) - 2.d0*pi
	else if (theta(i) .le. -2.d0*pi) then
		theta(i) = theta(i) + 2.d0*pi
	end if	!limitação do ângulo 0 < theta < 2*pi
	
	tempo(i+1) = tempo(i) + dt
	omega(i+1) = omega(i) - (g/a_l)*dsin(theta(i))*dt - res*omega(i)*dt + F_0*dsin(freq*tempo(i))*dt
	theta(i+1) = theta(i) + omega(i+1)*dt
	!seções de Poincaré - condição
	if (abs((tempo(i+1)-(pi*i_n)/freq)) .lt. dt/2.0) then
		write(10,*) omega(i) , theta(i)
		i_n = i_n + 1
	end if 
end do

close(10)
End Program Tarefa_E
