Program C1

!Random walk, gerando coordenadas para o diagrama

!Número de andarilhos
iandarilhos = 100

!Passos
N = 1000

!Distribuição uniforme de probabilidade

open(10, file = 'saida-C-diagrama-10260434.dat')

!simulação do andarilho

do i=1, iandarilhos
	!Posição inicial do andarilho i
	x = 0.0
	y = 0.0
	do j=1, N
		r = rand()
		if(r < 0.25 ) then
			x = x + 1
			write(10,*) i,x,y
		elseif(r > 0.25 .and. r < 0.5) then
			x = x - 1
			write(10,*) i,x,y
		elseif (r > 0.5 .and. r < 0.75) then
			y = y - 1
			write(10,*) i,x,y
		elseif (r> 0.75 .and. r<1) then
			y = y + 1
			write(10,*) i,x,y
		end if
		end do
end do
close(10)
End Program C1
