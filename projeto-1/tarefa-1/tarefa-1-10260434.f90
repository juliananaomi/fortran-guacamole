!Resolver equação de segundo grau

Program Raizes

Print *, 'Informe os coeficientes a,b e c'
read *, a,b,c

delta = b**2-4*a*c

IF (delta==0) THEN
    x = -b/(2*a)
    Print *, 'A raíz é x= ',x ,'e o número de raizes reais é 1'
ELSE IF (delta>0) THEN
    x1 = (-b+sqrt(delta))/(2*a)
    x2 = (-b-sqrt(delta))/(2*a)
    Print *, 'As raízes são x1= ',x1 , 'e x2=',x2 ,'e  o número de raizes reais são 2'
ELSE IF (delta<0) THEN
    Print *, 'Não há raízes reais'
END IF

END Program Raizes
