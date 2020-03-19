Program Hiperesfera

!Método de Monte Carlo
print*, 'Informe a dimensão da esfera'
read*, j

print*, 'Informe o número de pontos M aleatórios'
read*, M

!Cálculo de pi
pi=4e0*ATAN(1e0)

n = 0

!Gerando pontos aleatórios
do k=1, M
	raio = 0
	do i=1, j
		ri = rand()
		coord = ri**2
		raio = raio + coord
	end do
!Verificando quantos desses pontos estão dentro da esfera de raio 1
	if(raio<=1e0) then
		n = n + 1
	end if
end do

!Volume da hiperesfera por Monte Carlo

vh = (float(n)/float(M))*(2e0**j)

print*, 'Método de Monte Carlo: V=',vh

!Comparação

!Calculando gama

fgamma = gamma(j/2e0+1)

!Expressão de Vd, sendo R=1

vd = ((pi)**(j/2e0))/fgamma
	
print*, 'Expressão do volume: V= ',vd

End Program Hiperesfera
