Program Tarefa_B

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
parameter (nmax = 3000)
dimension omega(nmax), theta(nmax), tempo(nmax), time(5)

f(x) = 1.d0/sqrt( dcos(x)-dcos(theta(0) ))	!integral

pi = 4.d0*datan(1.d0)
dt = 0.03	!s
a_l = 9.8	!m
g = 9.8		!m/s
m = 1.d0	!kg
F_0 = 0.0
res = 0.5
freq = 2.0/3.0
tempo(0) = 0.d0	!s
omega(0) = 0.d0	!m/s
theta(0) = (30.d0/180.d0)*pi	

open(10, file = 'saida-tarefaB4-10260434.dat')
do i=0, nmax	!Inclusão das forças

	if (theta(i) .ge. 2.d0*pi) then
		theta(i) = theta(i) - 2.d0*pi
	else if (theta(i) .le. -2.d0*pi) then
		theta(i) = theta(i) + 2.d0*pi
	end if	!limitação do ângulo 0 < theta < 2*pi
	
	tempo(i+1) = tempo(i) + dt
	omega(i+1) = omega(i) - (g/a_l)*sin(theta(i))*dt - res*omega(i)*dt + F_0*sin(freq*tempo(i))*dt
	theta(i+1) = theta(i) + omega(i+1)*dt
	write(10,*) tempo(i), omega(i), theta(i)
end do

!regra de Bode p/ o cálculo da integral
N = 3000
a = -abs(theta(0)) + 0.001
b = abs(theta(0)) - 0.001
h = (b-a)/N
soma = 0.d0

do i=0, N-4, 4
    soma = soma + (2.d0/45.d0)*h*(   7*f(a + i*h) + 32*f(a + (i+1)*h) + 12*f(a + (i+2)*h) &
                                & + 32*f(a + (i+3)*h) +7*f(a + (i+4)*h) )
end do
soma = sqrt((2.d0*a_l)/g)*(soma + 4.d0*sqrt(0.001/dsin(theta(0) ) ) ) 
!inclusão do termo analítico

j=0
i=0
do while (j .lt. 5)		!cálculo do período numericamente
	if (theta(i)*theta(i+1) .lt. 0.0) then
		time(j) = tempo(i)	!encontra duas raízes consecutivas
		j = j +1
	end if
	i = i + 1
end do

ang_peq = 2.d0*pi*sqrt(a_l/g)*(1.d0+theta(0)**2/16.d0)	!aproximação
periodo = (time(4)-time(3))*2.d0	!período

print*, 'Numérico = ',periodo
print*, 'Analítico = ',soma
print*, 'Aproximação  = ', ang_peq

close(10)
End Program Tarefa_B
