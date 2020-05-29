Program Subprojeto_F

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
dimension vel(1:2), alfa(1:3), dxy(1:2)
character(len=70) fn

pi = 4.0*datan(1.d0)
vel = (/10.0,20.0/)	!velocidade inicial
alfa = (/pi/4.d0,0.d0,-pi/4.d0/) !angulo inicial
dxy = (/0.0,0.3/)

at = 0.001		!avanço temporal
y0 = 100.0		!y inicial
x0 = 0			!x inicial
acely = -10.0		!aceleração	inicial	
acelx =  0.0			
ifilenum = 10	!numeração de arquivos
dif  = 0.1
res = 0.1
hmax = 5

do i=1, 2
	do k=1, 2
		do j=1, 3
			tv = 0		!tempo inicial
			tp = 0
			ypos = y0	!posição inicial
			xpos = x0
			velx = vel(i)*cos(alfa(j))
			vely_new = vel(i)*sin(alfa(j))
			ifilenum = ifilenum + 1
			print*, ifilenum, 'v=', vel(i), 'alfa=',alfa(j), 'dxy=', dxy(k)
			write(fn,fmt='(i0,a)') ifilenum,'.dat'
			open(unit=ifilenum,file=fn)
			do while (ypos .ge. 0)
				write(ifilenum,*) tp, ypos, xpos, tv, vely_old, velx
				tp = tp + at				!tempo posição
				tv = tv + at/2.0			!tempo velocidade
				acx = acelx - res*velx		!aceeração variável devido a res do ar
				acy = acely - res*vely_new
				if (tv .eq. (at/2.0)) then	
					vely_old = vely_new + (at/2.0)*acy
					velx = velx+ (at/2.0)*acx
				else	!variável p/ armazenamento da velocidade anterior
					vely_old = vely_new + at*acy
					velx= velx + at*acx
				end if
				ypos = ypos + at*vely_old
				xpos = xpos + at*velx	!eixo x velocidade constante
				
				if (ypos .lt. 0) then
					ypos = 0
				end if
				
				if (((vely_new*vely_old) .lt. 0) .and. (ypos .le. hmax)) then
					exit !a altura é máxima quando velocidade muda de sinal
						 !programa para dada uma altura máxima determinada
				end if
				
				!mudança do sentido da velocidade em y e perda de velocidade em x
				!devido a perda de energia
				if (ypos .lt. dif) then
					vely_old = -vely_old + dxy(k)*vely_old
					velx = velx - velx*dxy(k)
					ypos =  ypos + at*vely_old
					xpos = xpos + at*velx
				end if 

				vely_new = vely_old
			end do
			close(ifilenum)
		end do
	end do
end do
End Program Subprojeto_F
