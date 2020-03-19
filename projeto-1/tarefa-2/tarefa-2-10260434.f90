!Encontrar área do triângulo formado por dois vetores

Program Triangulo

Print *, 'Informe as coordenadas do primeiro vetor'
read *, x1, y1, z1
Print *, 'Informe as coordenadas do segundo vetor'
read *, x2, y2, z2

!Cada componente
x = y1*z2 - y2*z1
y = z1*x2 - x1*z2
z = x1*y2 - x2*y1

!Módulo do vetor 

M = sqrt((x)**2.0+(y)**2.0+(z)**2.0)
Area = M/2e0

Print *, 'Área = ',Area
END Program Triangulo
