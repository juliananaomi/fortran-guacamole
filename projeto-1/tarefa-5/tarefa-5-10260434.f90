!Calcular ln(x) por dois métodos e verificar precisão
Program Precisao

!Dupla precisão
real*8 :: dresult1, dresult2, deprec, derro, dsoma, dx

Print *, 'Informe x, sendo 0<x<2'
read *, x

eprec = 1e-5
erro = 2*eprec !Definição do erro inicial

!Cálculo direto
result1=  log(x)
Print*, 'Valor da função intrínseca',result1

!Cálculo por aproximação

result2 = 0
i=1

do while (eprec<=erro)
	soma = -((1-x)**i)/i
	result2 = soma + result2
	erro = abs(result2-result1)
	i = i+1
end do

Print*, 'Valor da aproximação',result2

!Dupla precisão

deprec = epsilon(dresult2) !Dá o menor erro que o meu resultado pode ter
derro = 2*deprec !Definição do erro inicial

!Cálculo direto

dx = x
dresult1=  dlog(dx)
Print*, '(Dupla precisão) Valor da função intrínseca',dresult1

!Cálculo por aproximação

dresult2 = 0
i=1
do while (deprec<=derro)
	dsoma = -((1-dx)**i)/i
	dresult2 = dsoma + dresult2
	derro = abs(dresult2-dresult1)
	i = i+1
end do

Print*, '(Dupla precisão) Valor da aproximação',dresult2, 'com erro',derro

END Program Precisao
