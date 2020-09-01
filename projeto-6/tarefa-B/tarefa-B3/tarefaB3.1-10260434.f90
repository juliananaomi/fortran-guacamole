Program Tarefa_B3

IMPLICIT REAL*8 (a-h,o-z)
parameter (nmax=2000)
dimension yj(0:nmax), xj(0:nmax), y1(0:nmax), x1(0:nmax), &
		& y2(0:nmax), x2(0:nmax), y3(0:nmax), x3(0:nmax)

pi = 4.d0*datan(1.d0)
dt = 0.0001		 !ano

!raios
rj = 5.20		 !AU
rI = 3.0
rII = 3.276
rIII = 3.7

!massas
aMS = 2.0*10.d0**30 !kg
aMJ = 1.9*10.d0**27 !kg

!Condições iniciais
vj_0 = 2.755 !UA/ano
vI_0 = 3.628
vII_0 = 3.471
vIII_0 = 3.267

!Júpiter
yj(0) = 0.d0
yj(1) = yj(0) + vj_0*dt

xj(0) = rj
xj(1) = rj

!Asteroide I
y1(0) = 0.d0
y1(1) = y1(0) + vI_0*dt

x1(0) = rI
x1(1) = rI

!Asteroide II
y2(0) = 0.d0
y2(1) = y2(0) + vII_0*dt

x2(0) = rII
x2(1) = rII

!Asteroide III
y3(0) = 0.d0
y3(1) = y3(0) + vIII_0*dt

x3(0) = rIII
x3(1) = rIII

open(10, file= 'saidaB3.1-10260434.dat')
do i=1, nmax

	!Raio Júpiter-Sol
	rj_s = sqrt( xj(i)**2 + yj(i)**2)
	
	!Equações Movimento Júpiter
	yj(i+1) = 2.0*yj(i) - yj(i-1) - ((4.0*pi**2 *yj(i))/rj_s**3) * dt**2
	xj(i+1) = 2.0*xj(i) - xj(i-1) - ((4.0*pi**2 *xj(i))/rj_s**3) * dt**2
	
	!Raio Asteróide I-Sol
	r1_s = sqrt( x1(i)**2 + y1(i)**2)
	!Raio Asteróide I-Júpiter
	r1_j = sqrt( ( x1(i) - xj(i) )**2 + ( y1(i) - yj(i) )**2)
	
	y1(i+1) = 2.0 * y1(i) - y1(i-1) - &
	& 4.0*pi**2.0 * ( y1(i)/r1_s**3 + (aMJ/aMS)*( y1(i)-yj(i))/ r1_j**3 ) * dt**2	
	
	!Equações Movimento Asteróide I
	x1(i+1) = 2.0 * x1(i) - x1(i-1) - &
	& 4.0*pi**2.0 * ( x1(i)/r1_s**3 + (aMJ/aMS)*( x1(i)-xj(i) )/ r1_j**3) * dt**2
	
	!Raio Asteróide II-Sol
	r2_s = sqrt( x2(i)**2 + y2(i)**2)
	!Raio Asteróide II-Júpiter
	r2_j = sqrt( ( x2(i) - xj(i) )**2 + ( y2(i) - yj(i) )**2)
	
	y2(i+1) = 2.0 * y2(i) - y2(i-1) - &
	& 4.0*pi**2.0 * ( y2(i)/r2_s**3 + (aMJ/aMS)*( y2(i)-yj(i))/ r2_j**3 ) * dt**2	
	
	!Equações Movimento Asteróide II
	x2(i+1) = 2.0 * x2(i) - x2(i-1) - &
	& 4.0*pi**2.0 * ( x2(i)/r2_s**3 + (aMJ/aMS)*( x2(i)-xj(i) )/ r2_j**3) * dt**2
	
	!Raio Asteróide III-Sol
	r3_s = sqrt( x3(i)**2 + y3(i)**2)
	!Raio Asteróide III-Júpiter
	r3_j = sqrt( ( x3(i) - xj(i) )**2 + ( y3(i) - yj(i) )**2)
	
	y3(i+1) = 2.0 * y3(i) - y3(i-1) - &
	& 4.0*pi**2.0 * ( y3(i)/r3_s**3 + (aMJ/aMS)*( y3(i)-yj(i))/ r3_j**3 ) * dt**2	
	
	!Equações Movimento Asteróide III
	x3(i+1) = 2.0 * x3(i) - x3(i-1) - &
	& 4.0*pi**2.0 * ( x3(i)/r3_s**3 + (aMJ/aMS)*( x3(i)-xj(i) )/ r3_j**3) * dt**2
	
	write(10,*) yj(i), xj(i), x1(i+1), y1(i+1), x2(i+1), y2(i+1), x3(i+1), y3(i+1)
end do
close(10)

End Program Tarefa_B3
