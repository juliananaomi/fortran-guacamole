Program Tarefa_A2

IMPLICIT REAL*8 (a-h,o-z)
parameter (nmax=125000, nplan=8) !tempo total e número de planetas
character(10) planeta, fn
dimension y(0:nmax), x(0:nmax), planeta(0:nplan), r(0:nplan), t(0:nmax)


planeta = (/'Mercurio','Vênus  ','Terra   ','Marte   ','Júpiter', &
			& 'Saturno ','Urano   ','Netuno  ','Plutão '/)
			
r = (/0.39,0.72,1.0,1.52,5.20,9.24,19.19,30.06,39.53/)

pi = 4.d0*datan(1.d0)
dt = 0.0001
ifilenum = 10

do j = 0, nplan
	
	!Condições iniciais determinadas de acordo com o planeta
	v_0 = sqrt(5*pi/r(j))	
	y(0) = 0.0
	x(0) = r(j)	
	t(0) = 0.0

	x(1) = x(0)
	y(1) = y(0) + v_0*dt
	t(1) = dt

	ifilenum = ifilenum + 1	!numeração dos arquivos
	write(fn,fmt='(i0,a)') ifilenum,'.dat'
	open(unit=ifilenum,file=fn)
	
	do i=1, nmax
	
	raio = sqrt(x(i)**2 + y(i)**2)
	y(i+1) = 2.0*y(i) - y(i-1) - ((4.0*pi**2 *y(i))/raio**3) * dt**2
	x(i+1) = 2.0*x(i) - x(i-1) - ((4.0*pi**2 *x(i))/raio**3) * dt**2
	t(i+1) = t(i) + dt
	
	write(ifilenum,*) x(i+1), y(i+1)	
	end do
	
	close(ifilenum)
	
	do k=0, nmax
		if (y(k) .lt. 0.0 ) then
			periodo = abs(t(k)*2.0)
			exit
		end if	
	end do
	
	i=0
	m=0
	do while (i .lt. 2)	!Calcular semieixo maior apenas da primeira órbita
	!para calcular razão T^2/R^3
		if ((y(m)*y(m+1) .lt. 0.0) .and. (x(m) .gt. 0.0)) then
			!encontra posição em que há cruzamento no eixo x, mas
			!no quadrante positivo
			amaximo = x(m)
			i = i + 1
		else if ((y(m)*y(m+1) .lt. 0.0) .and. (x(m) .lt. 0.0)) then
			aminimo = x(m)
			!encontra posição em que há cruzamento no eixo x, mas
			!no quadrante negativo
			i = i + 1
		end if
		m = m + 1
	end do
	
	semimaior = (amaximo-aminimo)/2.0
	razao = (periodo**2.d0)/semimaior**3	!T^2/R^3
	
	print*, ifilenum, planeta(j), periodo, razao, semimaior

end do
End Program Tarefa_A2
