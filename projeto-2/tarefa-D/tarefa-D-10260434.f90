Program Entropia

parameter (nmax= 100000)
dimension ix(nmax), iy(nmax)

iandarilhos = 1000
N = 30000

do i=1, iandarilhos
	ix(i) = 0
	iy(i) = 0
end do

!simulação do andarilho por vetores
p = 0.25		!probabilidade

do i = 1, N !cada passo será contado como um instante de tempo
	do j = 1, iandarilhos 	!todos os andarilho dão um passo ao mesmo tempo
		r = rand()
		if (r .lt. 0.25) then
		ix(j) = ix(j) + 1 
		elseif(r .gt. 0.25 .and. r .lt. 0.5) then
		ix(j) = ix(j) - 1 
		elseif (r .gt. 0.5 .and. r .lt. 0.75) then
		iy(j) = iy(j) + 1 
		else
		iy(j) = iy(j) -1 
		end if
	end do
	
!'do' inicial não é fechado

!contagem de andarilhos em subdivisões do espaço 2D p/ calcular
!a probabilidade de encontrá-los naquele microestado

open(20, file = 'saida-D-entrop-10260434.dat')

stotal = 0.0	!somatório da entropia p/ cada microestado
lado = 30		!tamanho do quadrante
pmax = 1200		!tamanho do espaço analisado

!divisão do espaço 2D em quadrantes ladoxlado
!percorre um quadrante de tamanho= 'lado' em x e todas as possibilidade em y

	do k=-pmax,pmax-lado,lado	!eixo x
		do l=-pmax,pmax-lado,lado	!eixo y	
			cont = 0.0		!contador de andarilhos dentro do quadrante
			do m=1, iandarilhos		!condição para estar dentro do quadrante
				if ((ix(m) .le. k+lado) .and. (ix(m) .ge. k) .and. &
				& (iy(m) .le. l+lado ) .and. (iy(m) .ge. l)) then  
				cont= cont+1								
			end if	
			end do
		if (cont .ne. 0) then	!evitar log(0)
			prob = cont/iandarilhos
			s = prob*log(prob)	!entropia
			stotal = stotal - s
		end if
		end do
	end do
	write(20,*) i, stotal
end do
close(20)

End Program Entropia
