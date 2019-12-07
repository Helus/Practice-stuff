# Ejercicio 1

# contraste de dos medias en muestras emparejadas

# estadistico: (media(x)-media(y))/(Sc/sqrt(n))

# x: tiempo de reaccion visual
# y: tiempo de reaccion auditiva

# H_0: media_x <= meadia_y
# H_a: meadia_x > media_y

# a)

x=c(166,208,240,181,206,193,233,216,196,183,164,233,198,197,216)
y=c(162,212,203,166,239,202,185,170,207,198,178,142,187,164,161)
n=length(x)
media_x=mean(x)
media_y=mean(y)
d=x-y   # mean(d)=mean(x)-mean(y)
estadistico=mean(d)/(sqrt(var(d))/sqrt(n)) 
nivel_critico=1-pt(estadistico,df=n-1) # por ser mayor o igual, 1-P()
nivel_critico

# b)

t.test(x,y,alternative = 'greater',paired=T)

# c)

# La diferencia de medias es positiva, lo cual aporta indicios a favor de la hipotesis alternativa.
# El nivel critico es pequeño, pero no muy pequeño. Seria significativo al 5% pero no al 1% 

# Ejercicio 2

# contraste de dos medias en muestras independientes

# x: peces lago A
# y: peces lago B

# H_0: meadia_x <= meadia_y
# H_a: meadia_x > media_y

x=c(12,17,8,13,16,14,18,15,16,15)
y=c(12,11,15,14,16,13,15)

t.test(x,y,alternative = 'greater',paired=F, var.equal = T) #varianzas iguales
t.test(x,y,alternative = 'greater',paired=F, var.equal = F) #varianzas distintas

# c)

# El p-valor es mayor que el 1%, 5%, 10% y no podemos rechazar la hipotesis nula. 
# Entonces los peces del lago A son más pequeños que los del lago B.

# Ejercicio 3

# contraste de dos varianzas

# estadistico: Sc1^2/Sc2^2 \in F_(n1-1,n2-1)

# x: sodio en A
# y: sodio en B

# H_0: (sigma_x)^2 = (sigma_y)^2
# H_a: (sigma_x)^2 != (sigma_y)^2

# a) NO funciona: hacer por b)

x1= c(45.2,48.3,50.6,43.3,49.7,46.6,44.9,42.0,52.1,48.3)
x2= c(44.3,46.9,51.0,47.5,48.6,47.2,49.1)
n1=length(x1)
n2=length(x2)
alfa=0.05
estadistico=var(x1)/var(x2)
nivel_critico=1-pf(estadistico, n1-1, n2-1)
nivel_critico

# b)

library(TeachingDemos)
var.test(x1,x2)

# c)

# Para ese p-valor no tenemos pruebas significativas al 5% para rechazar la hipotesis nula.
# Entonces las varianzas son iguales.

# Ejercicio 4

# contraste de proporciones

# estadistico: (p1^-p2^)/sqrt(p^*(1-p^)*(1/n1+1/n2)) \in N(0,1), siendo p^=(n1*p1^+n2*p2^)/(n1+n2)

# x1:A aves jovenes
# x2: aves adultas

# H_0: p1>=p2   pi: porcentaje de aves muertas
# H_a: p1<p2

# a) NO funciona, hacer por b)

x=c(58,36)
n=c(200,150)
p=x/n
p_hat=(n1*p[1]+n2*p[2])/(n1+n2)
estadistico=(p[1]-p[2])/sqrt(p_hat*(1-p_hat)*(1/n1+1/n2))
nivel_critico=1-pchisq(estadistico,1) 
nivel_critico

# b)

prop.test(x,n,alternative = 'less',correct = F)

#c)

# Para ese p-valor no tenemos pruebas significativas dentro de los valores usuales
# para rechazar la hipotesis nula.
