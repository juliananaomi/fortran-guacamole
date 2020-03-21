Program A

!Média de números aleatórios

Print*, 'Informe a quantidade de números aleatórios a serem gerados'
read*, i

do n=1, 4
	soma = 0.0
	do j=1, i
	r = (rand())**n
	soma = soma + r
	end do
	!Calculando a média
	cmedia = soma/i
	print*, 'Para n =',n, 'e',i,'pontos aleatórios a média é',cmedia
end do

End Program A

