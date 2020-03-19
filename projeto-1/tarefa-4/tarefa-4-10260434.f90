!Calcular números primos menores ou iguais a N
Program Primos

Print *, 'Informe o número N para encontrar todos os números primos menores ou iguais a ele'
read *, j

!Verificar se é primo e depois escrever no arquivo

open (10, file = 'saida-4-10260434.txt')

do i=2, j
	cont=0
	do k=1, i
		if (mod(i,k)==0) then
			cont = cont +1
		end if
	end do
	if (cont==2) then
			write (10,*) i
	end if
end do

close (10)
END Program Primos
