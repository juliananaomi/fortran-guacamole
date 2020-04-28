Program Tarefa_A

IMPLICIT REAL*8 (a-h,o-z) !dupla precisão
dimension vh(1:14)	!vetor que armazena os valores de h

f(x) = dsinh(2.d0*x)*dsin(x/4.d0)!função
df(x) = 2.d0*dcosh(2.d0*x)*dsin(x/4.d0)+(1.d0/4.d0)*dcos(x/4.d0)*dsinh(2.d0*x)!derivada 1
df2(x) = dcosh(2.d0*x)*dcos(x/4.d0)+(63.d0/16.d0)*dsin(x/4.d0)*dsinh(2.d0*x) !derivada 2
df3(x) = (61.d0/8.d0)*dsin(x/4.d0)*dcosh(2.d0*x)+(191.d0/64.d0)*dsinh(2.d0*x)*dcos(x/4.d0) !derivada 3
ds3f(y,h) = ( f(y+h) - f(y-h) ) /(2*h)!derivada simétrica 3 pts
ds5f(y,h) = ( f(y-2.d0*h)-8.d0*f(y-h)+8.d0*f(y+h)-f(y+2.d0*h) )/(12.d0*h) !derivada simétrica 5 pts
d2sf(y,h) = ( -f(y-2.d0*h)+16.d0*f(y-h)-30.d0*f(y)+16.d0*f(y+h)-f(y+2.d0*h) )/(12.d0*h**2.d0)  !derivada segunda simétrica 5 pts
d3asf(y,h) = ( -f(y-2.d0*h)+2.d0*f(y-h)-2.d0*f(y+h)+f(y+2.d0*h) )/(2.d0*h**3) !derivada terceira a-simétrica 5 pts
df2f(y,h) = ( f(y+h) - f(y) )/h !derivada p/ frente 2 pts
dt2f(y,h) = ( f(y)- f(y-h) )/h !derivada p/ trás 2 pontos

vh = (/0.5,0.2,0.1,0.05,0.01,0.005,0.001,0.0005,0.0001,0.00005,0.00001,0.000001,0.0000001,0.00000001/)

xp=1.d0 !definir o ponto da derivada

open(20, file = 'saida-tarefaA-10260434.txt')
do i=1, 14
     erro1 = abs(df(xp) - ds3f(xp,vh(i)))	!diferença entre o valor exato
     erro2 = abs(df(xp) - df2f(xp,vh(i)))
     erro3 = abs(df(xp) - dt2f(xp,vh(i)))
     erro4 = abs(df(xp) - ds5f(xp,vh(i)))
     erro5 = abs(df2(xp) - d2sf(xp,vh(i)))
     erro6 = abs(df3(xp) - d3asf(xp,vh(i)))

     3 format(6f16.11)
     write(20,3) erro1, erro2, erro3, erro4, erro5, erro6
end do
close(20)
End Program Tarefa_A
