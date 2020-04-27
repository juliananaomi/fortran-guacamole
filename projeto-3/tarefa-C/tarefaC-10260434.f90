Program Tarefa_C

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
dimension raiz(1:3)
f(x) = x**3 - 21*x - 20
df(x)= 3*x**2 - 21
a = -10.d0
b = 10.d0
h = 0.3
erro = 10d-6
nmax = 30

do d = a, b, h
	xleft = d
	xright = xleft + h
	desvio = 2*erro
	!print*, d
	!Método direto
	p = f(xright)*f(xleft)
	if (f(xright)*f(xleft) .lt. 0) then
		i = 0
		do while ((desvio**2 .gt. erro**2))
			c = (xright+xleft)/2.d0
			if (f(xright)*f(c) .gt. 0) then
				xright = c
			else
				xleft = c
			end if
			i = i + 1
			desvio = abs(f(xright)-f(xleft))
			!print*, c, desvio, i, d
		end do
		print*, c , i
	end if
	!Método de Newton
	!do while ((i .lt. itmax))
	!end do
end do

End Program Tarefa_C
