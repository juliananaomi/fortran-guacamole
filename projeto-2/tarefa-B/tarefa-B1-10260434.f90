Program R_walk 

!Random walk
parameter (nmax= 100000)
dimension a(nmax), c(nmax)

!Número de andarilhos
iandarilhos = 10000

!Passos
N = 1000

!Distribuição uniforme de probabilidade
p=1e0/2e0		!probabilidade passo para direita

!arquivo para colocar x
open(10, file = 'saida-B1-10260434.dat')

soma1 = 0.0
soma2 = 0.0

!simulação do andarilho
do i=1, iandarilhos
	!Posição inicial do andarilho i
	x = 0
	do j=1, N
		r = rand()		!numero aleatório
		if(r < p) then
		x = x - 1
		else
		x = x + 1
		end if
	end do
	soma1 = soma1 + x
	soma2 = soma2 + x**2
	write(10,*) i,x		!posição final de cada andarilho
end do

do t=1, nmax
	read(10, *, end=1) c(t), a(t)
end do
1 continue 

!contando andarilhos

open(20, file = 'histograma-B1-10260434.dat')

do b=-N, N 
	cont=0
	do t=1, jandarilhos-1
		if (a(t)==b) then
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
xm = abs((p-q))*N
x2m= (N*(p-q))**2 + 4*p*q*N

print*, 'Resultado estatístico <x>=',xmedia,'e analítico <x>=', xm
print*, 'Resultado estatístico <x**2>=',x2media,'e analítico <x**2>=', x2m

close(10)
close(20)

End Program R_walk 
