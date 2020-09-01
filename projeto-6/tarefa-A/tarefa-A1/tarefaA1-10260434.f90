Program Tarefa_A1

IMPLICIT REAL*8 (a-h,o-z)
parameter (nmax=2500000, nplan=8)	!tempo total e número de planetas
character(10) planeta
dimension y(nmax), x(nmax), planeta(0:nplan), r(0:nplan), t(nmax)

planeta = (/'Mercurio','Vênus  ','Terra   ','Marte   ','Júpiter', &
			& 'Saturno ','Urano   ','Netuno  ','Plutão '/)
			
r = (/0.39,0.72,1.0,1.52,5.20,9.24,19.19,30.06,39.53/)	!raios

pi = 4.d0*datan(1.d0)
dt = 0.0001

do j = 0, nplan

	v_0 = 2.0*pi / sqrt(r(j))	!velocidade inicial
	y(0) = 0.0
	x(0) = r(j)	!posição inicial
	t(0) = 0.0

	x(1) = x(0)
	y(1) = y(0) + v_0*dt
	t(1) = dt
	
	do i=1, nmax
	raio = sqrt(x(i)**2 + y(i)**2)
	y(i+1) = 2.0*y(i) - y(i-1) - ((4.0*pi**2 *y(i))/raio**3) * dt**2
	x(i+1) = 2.0*x(i) - x(i-1) - ((4.0*pi**2 *x(i))/raio**3) * dt**2
	t(i+1) = t(i) + dt	!contagem do tempo
	end do
	
	!Cálculo do período
	do k=0, nmax
		!Condição em que o planeta da meia volta
		if (y(k) .lt. 0.0) then
			periodo = abs(t(k)*2.0)	!Obtenção do período completo
			exit
		end if
	end do
	
	razao = (periodo**2)/raio**3	!razão T^2/R^3
	print*, planeta(j), periodo, razao

end do
End Program Tarefa_A1
