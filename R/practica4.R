# Ejercicio 1

# estimación e intervalos de confianza para la media de una población normal con varianza conocida
# pivote: (media-mu)/(sigma/sqrt(n)) \in N(0,1)

# a)

sigma=10 
x=c(78, 95, 70, 97, 81, 85, 102, 75, 78, 85, 115, 80, 98, 101, 92)
n=length(x)
alfa=0.1
media=mean(x)
error_tipico=sigma/sqrt(n)
z=qnorm(1-alfa/2)
ext_sup=media+z*error_tipico
ext_inf=media-z*error_tipico
int_conf=c(ext_inf,ext_sup)
int_conf

# b)
install.packages('TeachingDemos')
library(TeachingDemos)

z.test(x,stdev=sigma,conf.level=1-alfa)

# Ejercicio 2

# estimación e intervalos de confianza para la media de una población normal con varianza desconocida

# pivote: (media-mu)/(Sc/sqrt(n)) \in T_(n-1)

# a)

x=c(2750, 3316, 3969,2211,2806,4195,3061,3827,3572,3430)
n=length(x)
alfa=0.05
media=mean(x)
error_tipico=sqrt(var(x))/sqrt(n) # cuasi-desviacion tipica dividido por sqrt(n)
t=qt(1-alfa/2,n-1)
ext_sup=media+t*error_tipico
ext_inf=media-t*error_tipico
int_conf=c(ext_inf,ext_sup)
int_conf

# b)

nivel=0.95
t.test(x,conf.level = nivel)

# Ejercicio 3

# estimación e intervalos de confianza para la varianza de una población normal con media desconocida
 
# pivote: (n-1)*Sc^2/sigma^2 \in Chi^2_(n-1)

# a) 

x=c(15.6, 14.8, 14.4, 16.6, 13.8, 14.0, 17.3, 17.4, 18.6, 16.2, 14.7, 15.7, 16.4, 13.9, 14.8, 17.5)
n=length(x)
alfa=0.05
media=mean(x)
error_tipico=var(x)
t1=qchisq(alfa/2, n-1)
t2=qchisq(1-alfa/2, n-1)
ext_sup=(n-1)*error_tipico/t1
ext_inf=(n-1)*error_tipico/t2
int_conf=c(ext_inf,ext_sup)
int_conf

# b)

library(TeachingDemos)
nivel=0.95
sigma.test(x,conf.level=nivel)

# Ejercicio 4

# estimación e intervalos de confianza para una proporción

# pivote: (p^-p)/sqrt(p^(1-p^)/n) \in N(0,1), siendo p=1-alfa, p^="casos favorables"/"casos posibles"

# a) 

n=200
mal=9
p=mal/n
alfa=0.05
z=qnorm(1-alfa/2)
ext_sup=p+z*sqrt(p*(1-p)/n)
ext_inf=p-z*sqrt(p*(1-p)/n)
int_conf=c(ext_inf,ext_sup)
int_conf

# b)

prop.test(mal,n,p,conf.level = 1-alfa)

# c)

t=z^2/n
ext_sup=(p+t/2)/(1+t)+sqrt(p*(1-p)*t+t^2/4)/(1+t)
ext_inf=(p+t/2)/(1+t)-sqrt(p*(1-p)*t+t^2/4)/(1+t)
int_conf=c(ext_inf,ext_sup)
int_conf 

prop.test(mal,n,conf.level = 0.95, correct = F)

