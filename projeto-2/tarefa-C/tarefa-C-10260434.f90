Program C

!Random walk, gerando coordenada final de cada andarilho
open(10, file = 'saida-C(10.1)-10260434.dat')

!Número de andarilhos
iandarilhos = 10000

!Passos
N = 10

xsoma = 0.0
ysoma = 0.0
x2soma = 0.0
y2soma = 0.0

!simulação do andarilho
do i=1, iandarilhos
	!Posição inicial do andarilho i
	x = 0
	y = 0
	do j=1, N
		r = rand()		!numero aleatório
		if(r .lt. 0.25 ) then		!Distribuição uniforme de probabilidade
		x = x - 1
		elseif((r .gt. 0.25) .and. (r .lt. 0.5)) then
		x = x + 1
		elseif ((r .gt. 0.5) .and. (r .lt. 0.75)) then
		y = y + 1
		elseif ((r .gt. 0.75) .and. (r .lt. 1)) then
		y = y - 1
		end if
		end do
	write(10,*) x,y
	!calculando desvio e médias
	xsoma = xsoma + x
	x2soma = x2soma + x**2	
	ysoma = ysoma + y
	y2soma = y2soma + y**2
end do

!medias de cada componente
vxmedia = xsoma/iandarilhos
vymedia = ysoma/iandarilhos
print*, '<r> = (',vxmedia,vymedia,')'

!r*r
vr2 = x2soma/iandarilhos + y2soma/iandarilhos

!produto escalar de <r>*<r>
pescalar = vxmedia*vxmedia + vymedia*vymedia

!dispersão**2
disp =  vr2 - pescalar
print*, 'disp**2 = ', disp

close(10)
End Program C
