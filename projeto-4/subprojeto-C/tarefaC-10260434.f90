Program Subprojeto_C

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
dimension vel(1:2), alfa(1:3)	!vetores das variáveis
character(len=70) fn

pi = 4.d0*datan(1.d0)
vel = (/10.0,20.0/)	!velocidade inicial
alfa = (/pi/4.d0,0.d0,-pi/4.d0/)	!angulo inicial

at = 0.001		!avanço temporal
y0 = 100.d0		!y inicial
x0 = 0.d0			!x inicial
ac = -10.d0		!aceleração	inicial				
ifilenum = 10	!numeração de arquivos

do i=1, 2
	do j=1, 3
		tv = 0			!tempo inicial
		tp = 0
		ypos = y0	!posição inicial
		xpos = x0
		velx = vel(i)*dcos(alfa(j))	!componente x da velocidade
		vely = vel(i)*dsin(alfa(j))	!componente y da velocidade
		ifilenum = ifilenum + 1
		print*,  'v=', vel(i), 'alfa=', alfa(j), ifilenum
		write(fn,fmt='(i0,a)') ifilenum,'.dat'
		open(unit=ifilenum,file=fn)
		do while (ypos .ge. 0.d0)
			write(ifilenum,*) tp, ypos, xpos, tv
			tp = tp + at				!tempo posição
			tv = tp - at/2.d0			!tempo velocidade
			if (tv .eq. (at/2.d0)) then	!ajuste da primeira iteração
				vely = vely + (at/2.d0)*ac
			else 
				vely = vely + at*ac
			end if
			ypos = ypos + at*vely
			xpos = xpos + at*velx	!eixo x velocidade constante
		end do
		close(ifilenum)
	end do
end do
End Program Subprojeto_C
