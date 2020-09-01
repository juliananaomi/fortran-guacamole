Program Tarefa_B1B2

IMPLICIT REAL*8 (a-h,o-z)
parameter (nmax=150000)
dimension yt(0:nmax), xt(0:nmax), yj(0:nmax), xj(0:nmax), t(0:nmax)

pi = 4.d0*datan(1.d0)
dt = 0.0001		 !ano
rt = 1.00		 !AU
rj = 5.20		 !AU
aMT = 6.0*10.d0**24 !kg
aMS = 2.0*10.d0**30 !kg
aMJ = 1.9*10.d0**27 !kg
xs = 0.0	!Sol fixo no centro
ys = 0.0

!Condições iniciais

vt_0 = (2.0*pi)/(sqrt(rt))
vj_0 = (2.0*pi)/(sqrt(rj))

yt(0) = 0.d0
yt(1) = yt(0) + vt_0*dt

xt(0) = rt
xt(1) = rt

yj(0) = 0.d0
yj(1) = yj(0) + vj_0*dt

xj(0) = rj
xj(1) = rj

open(10, file= 'saidaB1_15anos-10260434.dat')
do i=1, nmax

	!Raio Terra-Sol
	rt_s = sqrt( ( xt(i) - xs )**2 + ( yt(i) - ys )**2)
	!Raio Terra-Júpiter
	rt_j = sqrt( ( xt(i) - xj(i) )**2 + ( yt(i) - yj(i) )**2)
	
	!Equações Movimento Terra
	xt(i+1) = 2.0*xt(i) - xt(i-1) - &
	& 4.0*pi**2 *( xt(i)/rt_s**3 + (aMJ/aMS)*( xt(i)-xj(i) )/ rt_j**3 ) * dt**2
	
	yt(i+1) = 2.0* yt(i) - yt(i-1) - &
	& 4.0*pi**2 *( yt(i)/rt_s**3 + (aMJ/aMS)*( yt(i)-yj(i) )/rt_j**3 ) * dt**2

	!Raio Júpiter-Sol
	rj_s = sqrt( ( xj(i) - xs )**2 + ( yj(i) - ys )**2)
	!Raio Júpiter-Terra
	rj_t = sqrt( ( xj(i) - xt(i) )**2 + ( yj(i) - yt(i) )**2)
	
	!Equações Movimento Júpiter
	xj(i+1) = 2.0 * xj(i) - xj(i-1) - &
	& 4.0*pi**2.0 * ( xj(i)/rj_s**3 + (aMT/aMS)*( xj(i)-xt(i) )/ rj_t**3) * dt**2
	
	yj(i+1) = 2.0 * yj(i) - yj(i-1) - &
	& 4.0*pi**2.0 * ( yj(i)/rj_s**3 + (aMT/aMS)*( yj(i)-yt(i))/  rj_t**3 ) * dt**2	
	
	t(i) = i*dt 
	write(10,*) xt(i+1), yt(i+1), xj(i+1), yj(i+1)

end do
close(10)

End Program Tarefa_B1B2
