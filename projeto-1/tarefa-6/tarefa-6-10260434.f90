!Encontrar raízes do número complexo por deMoivre

Program Complexo

complex*8  z
Print*, 'Informe N'
read*, N

!Como não há parte complexa, o ângulo theta é zero

pi=4D0*DATAN(1.D0)

do k=1, N
	pr = 3e0**(1e0/N)*cos((2*pi*k)/N)+2
	pii = 3e0**(1e0/N)*sin((2*pi*k)/N)
	z=  pr*(1,0) + pii*(0,1)
	print*, k,': z =', z
end do
STOP
End Program Complexo
