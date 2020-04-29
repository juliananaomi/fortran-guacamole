Program Tarefa_C

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão

f(x) = x**3 - 21.d0*x - 20.d0	!função
df(x)= 3.d0*x**2 - 21.d0	!derivada da função
a = -10.d0	!xinicial
b = 10.d0	!xfinal
h = 0.55	!espaçamento
erro = 10d-6	!tolerância

print*,'-------------------Método Direto-------------------'
do d = a, b-h, h	!procura raíz em cada intervalo
	xleft = d
	xright = xleft + h
	desvio = 2.d0*erro	!desvio inicial
	if (f(xright)*f(xleft) .lt. 0) then	!verifica se há raíz neste intervalo
		i = 0
		do while (desvio .gt. erro)
			c = (xright+xleft)/2.d0	!ponto médio do intervalo
			if (f(xright)*f(c) .gt. 0) then		!se a raíz não está a direita
				xright = c	!então está a esquerda (redefine intervalo)
			else	
				xleft = c
			end if
			desvio = abs(f(xleft)-f(xright))
			i = i + 1
			print'(f16.11, i5)', c, i
		end do
	end if	
end do

print*,'-----------------Método de Newton------------------'
do d = a, b-h, h
	xleft = d
	xright = xleft + h
	desvio = 2.d0*erro
	if (f(xright)*f(xleft) .lt. 0) then	!verifica se há raíz, então aplica o método
		j = 0
		do while (desvio .gt. erro)
			xleft = xright - f(xright)/df(xright)	!aplicação do método
			desvio = abs(f(xleft)-f(xright))
			xright= xleft 
			j = j + 1
			print'(f16.11, i5)', xleft, j
		end do
	end if
end do

print*,'----------------Método das Secantes----------------'
do d = a, (b-2.d0*h), h	!raciocínio análogo
	xleft = d
	xright = xleft + h
	desvio = 2.d0*erro
	k = 0
	if (f(xright)*f(xleft) .lt. 0) then
		do while (desvio .gt. erro)
			xleft = xright - f(xright)*((xright-(xright-h))/(f(xright)-f(xright-h)))
			desvio = abs(f(xleft)-f(xright))
			xright= xleft 
			k = k + 1
			print'(f16.11, i5)', xleft, k
		end do
	end if 
end do
End Program Tarefa_C
