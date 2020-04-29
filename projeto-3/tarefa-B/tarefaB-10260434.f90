Program Tarefa_B

IMPLICIT real*8 (a-h,o-z)
dimension N(1:11)	!armazena valores de N

f(x) = dexp(x/2)*dcos(pi*x)	!função
!integral (p/ comparar com o valor exato)
fi(x) = (dexp(x/2)/(pi**2 + 1.d0/4))*(pi*dsin(pi*x) + dcos(pi*x)/2)	

a= 0.d0		!limites de integração
b= 1.d0
pi = 4.d0*datan(1.d0)

rfi = fi(b)-fi(a) !valor exato

N = (/4,8,16,32,64,128,256,512,1024,2048,4096/)

open(10, file='saida-tarefaB-10260434.txt')
do j=1, 11
	soma = 0.d0
	soma1 = 0.d0
	soma2 = 0.d0
	h = (b-a)/N(j)	!valores de h p/ cada N
	
	!regra do trapézio
	do i=0, N(j)-1
	xi = a + i*h
	soma = soma + (f(xi)+f(xi+h))*(h/2)
	end do
	
	!regra de Simpson
	do i=1, N(j)-1, 2
	xi1 = a + i*h
	soma1 = soma1 + (h/3)*(f(xi1+h)+4*f(xi1)+f(xi1-h))
	end do
	
	!regra de Bode
	do i=0, N(j)-1, 4
	xi2 = a + i*h
	soma2 = soma2 +  ((2*h)/45)*(7*f(xi2)+32*f(xi2+h)+12*f(xi2+2*h)+32*f(xi2+3*h)+7*f(xi2+4*h))
	end do
	
	soma= abs(soma-rfi)
	soma1 = abs(soma1-rfi)
	soma2 = abs(soma2 -rfi)

	write(10,*) N(j),soma, soma1, soma2
end do
close(10)
End Program Tarefa_B
