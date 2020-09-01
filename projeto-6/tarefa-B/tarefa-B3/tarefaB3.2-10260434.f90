Program Tarefa_B3

IMPLICIT REAL*8 (a-h,o-z)
parameter (nmax=1500)
dimension yt(0:nmax), xt(0:nmax), yj(0:nmax), xj(0:nmax), xs(0:nmax), ys(0:nmax)

pi = 4.d0*datan(1.d0)
dt = 0.0001		 !ano
rt = 1.00		 !AU
rj = 5.20		 !AU
aMT = 6.0*10.d0**24 !kg
aMS = 2.0*10.d0**30 !kg
aMJ = 1.9*10.d0**27 *1000!kg

aM = aMT+ aMS + aMJ

theta = pi		!angulo inicial Júpiter
theta2 = pi/2	!angulo inicial Terra

!Condições iniciais

vt_0 = (2.0*pi)/(sqrt(rt))*sin(theta2)
vj_0 = (2.0*pi)/(sqrt(rj))*sin(theta)
vs_0 = - (aMT/aMS) * vt_0  - (aMJ/aMS) * vj_0

yt_0 = rt*sin(theta2)
xt_0  = -rt*sin(theta2)

yj_0  = -rj*sin(theta)
xj_0  = -rj*cos(theta)

xs_0  = 0.0	
ys_0  = 0.0

!Centro de massa
xcm = (xt_0  + xj_0  + xs_0 )/ aM 
ycm = (yt_0  + yj_0  + ys_0 )/ aM 

!Condições iniciais em relação ao centro de massa

yt(0) = xt_0  - ycm
xt(0) = yt_0  - xcm
yt(1) = yt(0) + vt_0*dt
xt(1) = xt(0)

yj(0) = yj_0  - ycm
xj(0) = xj_0  - xcm
yj(1) = yj(0) + vj_0*dt
xj(1) = xj(0)

ys(0) = xs_0 - ycm	
xs(0) = ys_0 - xcm
xs(1) = xs(0)
ys(1) = ys(0) + vs_0*dt

open(10, file= 'saidaB3.2-10260434.dat')
do i=1, nmax

	!Raio Terra-Sol
	rt_s = sqrt( ( xt(i) - xs(i) )**2 + ( yt(i) - ys(i) )**2)
	!Raio Terra-Júpiter
	rt_j = sqrt( ( xt(i) - xj(i) )**2 + ( yt(i) - yj(i) )**2)
	
	!Equações Movimento Terra
	xt(i+1) = 2.0*xt(i) - xt(i-1) - &
	& 4.0*pi**2 *( ( xt(i) - xs(i) )/rt_s**3 + (aMJ/aMS)*( xt(i)-xj(i) )/ rt_j**3 ) * dt**2
	
	yt(i+1) = 2.0* yt(i) - yt(i-1) - &
	& 4.0*pi**2 *(( yt(i) - ys(i) )/rt_s**3 + (aMJ/aMS)*( yt(i)-yj(i) )/rt_j**3 ) * dt**2

	!Raio Júpiter-Sol
	rj_s = sqrt( ( xj(i) - xs(i) )**2 + ( yj(i) - ys(i) )**2)
	!Raio Júpiter-Terra
	rj_t = sqrt( ( xj(i) - xt(i) )**2 + ( yj(i) - yt(i) )**2)
	
	!Equações Movimento Júpiter
	xj(i+1) = 2.0 * xj(i) - xj(i-1) - &
	& 4.0*pi**2.0 * ( ( xj(i) - xs(i) )/rj_s**3 + (aMT/aMS)*( xj(i)-xt(i) )/ rj_t**3 ) * dt**2
	
	yj(i+1) = 2.0 * yj(i) - yj(i-1) - &
	& 4.0*pi**2.0 * ( ( yj(i) - ys(i) )/rj_s**3 + (aMT/aMS)*( yj(i)-yt(i))/  rj_t**3 ) * dt**2	
	
	!Equações Movimento Sol
	xs(i+1) = 2.0 * xs(i) - xs(i-1) - &
	& 4.0*pi**2.0 * (aMT/aMS)*( (xs(i) - xt(i) )/rt_s**3 + (aMJ/aMS)*( xs(i)-xj(i) )/ rj_s**3) * dt**2
	
	ys(i+1) = 2.0 * ys(i) - ys(i-1) - &
	& 4.0*pi**2.0 * (aMT/aMS)*( (ys(i)- yt(i))/rt_s**3 + (aMJ/aMS)*( ys(i)-yj(i))/  rj_s**3 ) * dt**2
	
	write(10,*) xt(i+1), yt(i+1), xj(i+1), yj(i+1), xs(i+1), ys(i+1)

end do
close(10)

End Program Tarefa_B3
