# Ejercicio 1

# contrastes de hipótesis sobre la media de una población normal con varianza conocida

# estadistico: (media-mu)/(sigma/sqrt(n)) \in N(0,1)

# H0: media >= 17
# Ha: media < 17

mu0=17
sigma=7
x=c(3,5,12,7,22,6,2,18,9,8,20,15,3,36,38,43)

# a)

n=length(x)
med_x=mean(x)
error_tipico=sigma/sqrt(n)
estadistico=(med_x-mu0)/error_tipico
nivel_critrico=pnorm(estadistico)
nivel_critrico

# b)

library(TeachingDemos)
z.test(x,mu=mu0,stdev=sigma,alternative='less')

# c)

# La media muestral es inferior a 17, lo cual aporta indicios a favor de la hipotesis alternativa 
# (el protocolo es efectivo).
# Sin embargo, el nivel critico es muy grande, casi del 20%. 
# Por tanto, las pruebas son no significativas a ningun nivel de los usuales (1%, 5%, 10%).

# Ejercicio 2

# contrastes de hipótesis para la media de una población normal con varianza desconocida

# estadistico: (media-mu)/(Sc/sqrt(n)) \in T_(n-1)

# H0: mu<=24
# Ha: mu>24

mu0=24
x=c(23.5, 24.6, 26.5, 23.0, 28.3, 27.9, 22.4, 22.8, 21.8, 24.7, 23.4, 23.7, 25.3,
    24.8, 26.0, 22.9, 25.7, 24.2, 22.1, 25.3)

# a) 

n=length(x)
med_x=mean(x)
error_tipico=sqrt(var(x))/sqrt(n)
estadistico=(med_x-mu0)/error_tipico
nivel_critrico=1-pt(estadistico,df=n-1) # estamos con mayor o igual, por eso 1-P()
nivel_critrico

# b)

t.test(x,mu=mu0,stdev=var(x),alternative='greater')

# c)

# Los resultados son favorables a la hipótesis alternativa, Ha : mu > 24; pues la media muestral
# es mayor de 24 mm. Sin embargo, el nivel crítico es grande, mayor del 5% y del 10 %, por lo
# que las pruebas no son significativas

# Ejercicio 3

# contrastes de hipótesis sobre la varianza de una población normal con media desconocida

# (n-1)*Sc^2/sigma^2 \in Chi^2_(n-1)

# H0: sigma^2 <= 0.045
# Ha: sigma > 0.045 (lo que queremos probar)

sigma02=0.045
alfa=0.05
x=c(0.69, 1.04, 0.39, 0.37, 0.64, 0.73, 0.69, 1.04, 0.83, 1.00, 0.19, 0.61, 0.42, 0.20, 0.79)

# a)

n=length(x)
med_x=mean(x)
sigma2=var(x)
estadistico=(n-1)*sigma2/sigma02
nivel_critrico=1-pchisq(estadistico,df=n-1)  # estamos con mayor o igual, por eso 1-P()
nivel_critrico

# b)

sigma.test(x,sigmasq=sigma02,alternative='greater')

# c)

# Sí podemos afirmar, al nivel del 5%, que la varianza es mayor que 0'045, pues el estadístico es mayor
# que el valor de corte (23'68), o también porque el nivel crítico (0.04) es menor del 5%.
# Pero si consideramos el nivel de significación del 1% la respuesta sería diferente:
# Aceptaríamos H0 al nivel del 1%, pues el nivel crítico (0.04) es mayor del 1%. Y observando la región
# crítica, el punto de corte ahora sería:
#   Chi^2_(0.01)=29.14
# con lo cual, llegamos a la misma conclusión, el estadístico sería menor que dicho punto de corte y no
# rechazaríamos H0.
# Por tanto, se trata de un caso dudoso. Hay pruebas significativas, pero no demasiado significativas.

# Ejercicio 4

# contrastes sobre una proporción

# estadistico: (p^-p)/sqrt(p*(1-p)/n)

# H0: p <= 0.4
# Ha: p > 0.4 (el medicamento es eficaz)

n=100
curado=50
p=curado/n
p0=0.4
alfa=0.05
estadistico=(p-p0)/sqrt(p0*(1-p0)/n)
nivel_critico=1-pnorm(estadistico)
nivel_critico

prop.test(curado,n,p0,alternative='greater',correct=T) # True para que realice una correcion por continuidad

# Entonces las pruebas son significativas al 5% pero no lo son al 1%. Es un resultado algo dudoso. Hay
# pruebas de que la proporción de curaciones es mayor del 40%, pues además de que la proporción muestral
# es mayor del 40 %, el nivel crítico es bastante pequeño. Sin embargo, tampoco es excesivamente pequeño.
