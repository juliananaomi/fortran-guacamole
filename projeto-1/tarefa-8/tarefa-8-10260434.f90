Program Dimensoesesfera

print*, 'Informe o raio da esfera'
read*, R

print*, 'Informe a dimensão da esfera'
read*, j

!Calculando pi

pi=4e0*ATAN(1e0)

!Expressão de vd

open(10, file='saida-8-10260434.dat')
open(11,file='saida-8a-10260434.dat')
open(12, file='saida-8b-10260434.dat')

do i=2, j
	fgamma = gamma(i/2e0+1e0)
	vd = (((pi)**(float(i)/2e0))*(R**i))/fgamma
	write(10,*) i,vd
	
	!Gráficos 1/v para melhor visualização dos dados
	
	!8A Comparação cubo/esfera (1/Vd)
	v8a= 1e0/vd
	write(11,*) i,v8a
	
	!8A Comparação proteína/atomo (1/Vd)
	v8b= 1e0/(vd*10e-4**i)
	write(12,*) i,v8b

end do

close(10)
close(11)
close(12)

End Program Dimensoesesfera
