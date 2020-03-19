!Ordenar M primeiros números de N números inteiros através de vetores

Program Bubble

!definir número máximo de arquivos de entrada e o vetor

parameter (nmax= 10000)
dimension a(nmax)

Print*, 'Ordenar quantos números reais?'
read*, M

!atribuindo valor do arquivo aos vetores
open (10,file= 'entrada-3-10260434.txt')

k=0
do n=1, nmax
	read(10, *, end=1) a(n)
	k=k+1
end do
1 continue

!ordenando vetores

do while (k>1)
	maior=0
	do i=1, (k-1) !tamanho do array
		if (a(i)>a(i+1)) then
			aux = a(i)
			a(i) = a(i+1)
			a(i+1)= aux
			maior = i
		end if
	end do
	k=maior
end do

open (20,file='saida-3-10260434.txt')

do i=1, M
	write(20,'(F0.8)') a(i)
end do

close(10)
close(20)

END Program Bubble
