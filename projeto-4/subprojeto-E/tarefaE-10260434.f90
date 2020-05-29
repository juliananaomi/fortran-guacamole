Program Subprojeto_E

dimension vel(1:2), alfa(1:3), dxy(1:2)
character(len=70) fn

pi = 4.0*atan(1.0)
vel = (/10.0,20.0/)	!velocidade inicial
alfa = (/pi/4.0,0.0,-pi/4.0/)
dxy = (/0.3,0.5/)

at = 0.001		!avanço temporal
y0 = 100.0		!y inicial
x0 = 0			!x inicial
ac = -10.0		!aceleração	inicial		
ifilenum = 10	!numeração de arquivos
dif  = 0.001
hmax = 1

do i=1, 2
	do k=1, 2
		do j=1, 3
			tv = 0			!tempo inicial
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
				if (tv .eq. (at/2.0)) then	
					vely_old = vely_new + (at/2.0)*ac
				else
					vely_old = vely_new + at*ac
				end if
				ypos = ypos + at*vely_old
				xpos = xpos + at*velx	!eixo x velocidade constante
				
				if (ypos .lt. 0) then
					ypos = 0
				end if
				
				if (((vely_new*vely_old) .lt. 0) .and. (ypos .le. hmax)) then
					exit !a altura é máxima quando velocidade muda de sinal
				end if
				
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
End Program Subprojeto_E
