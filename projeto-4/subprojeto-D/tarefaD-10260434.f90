Program Subprojeto_D

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
dimension vel(1:2), alfa(1:3) !vetores das variáveis
character(len=70) fn

pi = 4.0*datan(1.d0)
vel = (/10.0,20.0/)	!velocidade inicial
alfa = (/pi/4.d0,0.d0,-pi/4.d0/) !angulo inicial

at = 0.001		!avanço temporal
y0 = 100.0		!y inicial
x0 = 0			!x inicial
acely = -10.0	!aceleração	inicial	
res =  0.1		!resistência do ar	
ifilenum = 10	!numeração de arquivos

do i=1, 2
	do j=1, 3
		tv = 0			!tempo inicial
		tp = 0
		ypos = y0	!posição inicial
		xpos = x0
		velx = vel(i)*cos(alfa(j))	!componente x da velocidade
		vely = vel(i)*sin(alfa(j))	!componente y da velocidade
		ifilenum = ifilenum + 1
		print*, ifilenum, 'v=', vel(i), 'alfa=',alfa(j)
		write(fn,fmt='(i0,a)') ifilenum,'.dat'
		open(unit=ifilenum,file=fn)
		do while (ypos .ge. 0)
			write(ifilenum,*) tp, ypos, xpos, tv
			tp = tp + at			!tempo posição
			tv = tp - at/2.0		!tempo velocidade
			acx = -res*velx		!aceleração variável devido a resistência do ar
			acy = acely - res*vely
			if (tv .eq. (at/2.0)) then	!ajuste da primeira iteração
				vely = vely + (at/2.0)*acy
				velx = velx + (at/2.0)*acx
			else 
				vely = vely + at*acy
				velx = velx + at*acx
			end if
			ypos = ypos + at*vely	!eixo y
			xpos = xpos + at*velx	!eixo x
		end do
		close(ifilenum)
	end do
end do
End Program Subprojeto_D
