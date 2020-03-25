Program R_walk 

!Random walk
parameter (nmax= 10000)
dimension c(nmax), a(nmax)

!Número de andarilhos
iandarilhos = 10000

!Número de passos
Np = 1000

!Distribuição uniforme de probabilidade
p=1e0/5e0		!probabilidade passo para direita

!arquivo para colocar x
open(10, file = 'saida-B2(1.5)-10260434.dat')

soma1 = 0.0
soma2 = 0.0

!simulação do andarilho
do i=1, iandarilhos
	!Posição inicial do andarilho i
	x = 0
	do j=1, Np
		r = rand()		!numero aleatório
		if(r < p) then
		x = x - 1
		else
		x = x + 1
		end if
	end do
	soma1 = soma1 + x		!soma das posições para calcular a média
	soma2 = soma2 + x**2
	write(10,*) i,x		!posição final de cada andarilho
end do
close(10)

open(10, file = 'saida-B2(1.5)-10260434.dat')
open(20, file = 'histogramaB2(1.5)-10260434.dat')

do n=1, nmax
	read(10, *,end=1) c(n), a(n)	!lendo o arquivo
end do
1 continue

do b= -Np, Np	!contagem de andarilhos em cada posição
	cont=0
	do n=1, iandarilhos-1
		if (a(n)==b) then
		cont=cont+1
		end if
	end do
	if (cont /=0) then
	write(20,*) b,cont
	end if
end do

!estatística
xmedia = soma1/iandarilhos		!media de <x>
x2media = soma2/iandarilhos 		!media de <x**2>

!forma analítica
q = 1 - p
xm = abs((p-q))*Np
x2m= (Np*(p-q))**2 + 4*p*q*Np

print*, 'Resultado estatístico <x>=',xmedia,'e analítico <x>=', xm
print*, 'Resultado estatístico <x**2>=',x2media,'e analítico <x**2>=', x2m

close(10)
close(20)
End Program R_walk 
