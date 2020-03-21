Program B

!Random walk

!Número de andarilhos
print*, 'Informe o número de andarilhos'
read*, iandarilhos

!Passos
N = 1000

!Distribuição uniforme de probabilidade
p=0.5		!probabilidade passo para direita

!arquivo para colocar n(x) e x
open(10, file = 'saida-B-10260434.dat')

soma1 = 0.0
soma2 = 0.0

do i=1, iandarilhos
	!Posição inicial do andarilho i
	x = 0.0
	do j=1, N
		r = rand()		!numero aleatório
		if(r < p) then
		x = x - 1e0
		else
		x = x + 1e0
		end if
	end do
	soma1 = soma1 + x
	soma2 = soma2 + x**2
	write(10,*) i,x
end do

xmedia = soma1/iandarilhos		!media de <x>
x2media = soma2/iandarilhos 		!media de <x**2>

print*, '<x>=',xmedia
print*, '<x**2>=',x2media

close(10)
End Program B
