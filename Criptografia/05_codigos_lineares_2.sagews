︠ae825fbb-66e5-4437-9477-c53e6b3eb808i︠
%md
# Retos da semana anterior
### Descodificación de fonte
Vimos o interesante que é traballarmos con matrices estándar (cando temos un código sistemático) para levar a cabo a descodificación de fonte. No caso xeral, para recuperar a información a partir dunha palabra $c$ do código, temos que resolver o sistema $G\cdot x^t = c^t$.

#### Reto 1:
##### Definir unha función que nos recupere $v \in \mathbb{F}_q^k$ sabendo que $v\ast G == c$.
︡378eb13f-c946-4f5d-b67a-c9dc56e4faf2︡{"done":true,"md":"# Retos da semana anterior\n### Descodificación de fonte\nVimos o interesante que é traballarmos con matrices estándar (cando temos un código sistemático) para levar a cabo a descodificación de fonte. No caso xeral, para recuperar a información a partir dunha palabra $c$ do código, temos que resolver o sistema $G\\cdot x^t = c^t$.\n\n#### Reto 1:\n##### Definir unha función que nos recupere $v \\in \\mathbb{F}_q^k$ sabendo que $v\\ast G == c$."}
︠d276dbb2-b3a1-42cb-805d-bd0736c3c3c0s︠
G = matrix(GF(2),3,5,[1,0,0,1,1,1,0,1,0,1,10,0,1,0,0])
C = G.row_space()
︡8a1226a6-2b1b-492b-bd4d-3848284e651d︡{"done":true}
︠d88e2226-ba98-46c4-86b7-119eee034f3bi︠
%md
O espacio fonte será o espazo vectorial $\mathbb{F}_q^k$, onde $k$ é a dimensión de $C$ $( = rank (G) )$.
︡5e961d01-8c4d-48f7-93ac-058e9c5e733b︡{"done":true,"md":"O espacio fonte será o espazo vectorial $\\mathbb{F}_q^k$, onde $k$ é a dimensión de $C$ $( = rank (G) )$."}
︠575a1f3b-f6d6-4521-89fd-6911aa0fcb60︠

︡adecd9ae-b072-4fcc-a244-feb6e868f77c︡
︠ab730043-d2da-4a85-a392-c5c9d0d875b8s︠
k = dimension(C)
V = VectorSpace(GF(2),k)
︡6724ca33-87a0-43c4-8730-c02df3dc0543︡{"done":true}
︠796a9f45-74ea-4f66-a0f4-39033f355a83so︠
def d_f(c):                                 # c ten que ser unha palabra código
    for v in V:                             # percorremos as palabras da fonte e, se atopamos unha que se codifique en c, paramos
        if v*G == c:
            return v
    return 'non e unha palabra codigo'      # por se nos colamos e c non é un vector do código
︡a1eaabbf-ce23-4aab-b0fd-194598753780︡{"done":true}
︠8b5573bc-e4ef-4174-b785-dd7dd4fcf813o︠
c = C.random_element()                      # collemos unha palabra código ao chou
c
d_f(c)
︡65d4aae3-7913-435b-9814-019681030b1d︡{"stdout":"(1, 0, 1, 1, 1)\n"}︡{"stdout":"(1, 0, 1)\n"}︡{"done":true}
︠412d044f-5c43-4884-bec3-3290f13f965ei︠
%md
Aquí temos a táboa completa de descodificación de fonte

︡ecbf349b-2102-4d9a-b62d-cdc6c47877a0︡{"done":true,"md":"Aquí temos a táboa completa de descodificación de fonte"}
︠9893e0fa-cbaf-4514-8456-1ebd3a89cf2aso︠
for c in C:
    print c, '------>',d_f(c)
︡8633a439-b9a4-455a-9c8e-2af92cf5cb90︡{"stdout":"(0, 0, 0, 0, 0) ------> (0, 0, 0)\n(1, 0, 0, 0, 1) ------> (0, 1, 1)\n(0, 0, 1, 0, 0) ------> (0, 0, 1)\n(1, 0, 1, 0, 1) ------> (0, 1, 0)\n(0, 0, 0, 1, 0) ------> (1, 1, 1)\n(1, 0, 0, 1, 1) ------> (1, 0, 0)\n(0, 0, 1, 1, 0) ------> (1, 1, 0)\n(1, 0, 1, 1, 1) ------> (1, 0, 1)\n"}︡{"done":true}
︠0bb73704-faa5-44c8-8d8a-f3308ebe4d0di︠
%md
### A matriz de control e a distancia mínima

Sendo $C_1,\dots,C_n$ as columnas de $H$ e $X = (x–1,\dots,x_n)$ unha palabra do código, $H\cdot X^t = \displaystyle\sum_{i=1}^nx_iC_i = 0$. Polo tanto, se $w(X) = p$, entón, hai un conxunto de índices $\{i_1,\dots,i_p\}$ de xeito que $x_i=0$, para $i\not\in \{i_1,\dots,i_p\}$, polo que, dado que $\displaystyle\sum_{i=1}^nx_iC_i = \displaystyle\sum_{i\in\{i_1,\dots,i_p\}}x_iC_i = 0$, e as columnas $C_{i_1},\dots,C_{i_p}$ son linealmente dependentes. Polo tanto, a distancia mínima coincide co menor número de columnas que son linearmente dependentes.

#### Reto 2:
##### Dar unha función para calcular a distancia mínima a partir da matriz de control

(Pode se r de axuda saber **H.columns()** danos as columnas de $H$ e que **Combinations**(*r, s*) construe as combinacións de $\{0,1,\dots,r-1\}$ tomados de $s$ en $s$.)


︡2cdcdb43-785b-41ab-8604-6368d3c3985d︡{"done":true,"md":"### A matriz de control e a distancia mínima\n\nSendo $C_1,\\dots,C_n$ as columnas de $H$ e $X = (x–1,\\dots,x_n)$ unha palabra do código, $H\\cdot X^t = \\displaystyle\\sum_{i=1}^nx_iC_i = 0$. Polo tanto, se $w(X) = p$, entón, hai un conxunto de índices $\\{i_1,\\dots,i_p\\}$ de xeito que $x_i=0$, para $i\\not\\in \\{i_1,\\dots,i_p\\}$, polo que, dado que $\\displaystyle\\sum_{i=1}^nx_iC_i = \\displaystyle\\sum_{i\\in\\{i_1,\\dots,i_p\\}}x_iC_i = 0$, e as columnas $C_{i_1},\\dots,C_{i_p}$ son linealmente dependentes. Polo tanto, a distancia mínima coincide co menor número de columnas que son linearmente dependentes.\n\n#### Reto 2:\n##### Dar unha función para calcular a distancia mínima a partir da matriz de control\n\n(Pode se r de axuda saber **H.columns()** danos as columnas de $H$ e que **Combinations**(*r, s*) construe as combinacións de $\\{0,1,\\dots,r-1\\}$ tomados de $s$ en $s$.)"}
︠a38fa521-cdd7-4dfa-a32c-860b03162c6dso︠
M = matrix(3,4,[0,1,2,3,4,5,6,7,8,9,10,11])
M
︡57ec2a17-c552-45ba-bf2d-5ea3d67713db︡{"stdout":"[ 0  1  2  3]\n[ 4  5  6  7]\n[ 8  9 10 11]\n"}︡{"done":true}
︠a3299722-dd71-4f2f-93ad-19b414849df0o︠
M.columns()                                    # unha lista de vectores
︡f3b973f0-3801-4e0f-a13d-3ca4e0408892︡{"stdout":"[(0, 4, 8), (1, 5, 9), (2, 6, 10), (3, 7, 11)]\n"}︡{"done":true}
︠749c51a1-569f-4df8-8cad-126dacafe68do︠
matrix(M.columns()[1:3])                       # matriz formada polas columnas 1 e 2 de M (postas en fila)
︡78388a4d-378f-4975-bd77-36a3fe05909f︡{"stdout":"[ 1  5  9]\n[ 2  6 10]\n"}︡{"done":true}
︠2e61111c-ac84-4a88-aa37-d7d55620d2fbo︠
Combinations(4,2)                              # así construímos o obxecto
Combinations(4,2).list()                       # así podemos ver os seus elementos
︡dced50c1-ea41-442e-99d9-b377239200e1︡{"stdout":"Combinations of [0, 1, 2, 3] of length 2\n"}︡{"stdout":"[[0, 1], [0, 2], [0, 3], [1, 2], [1, 3], [2, 3]]\n"}︡{"done":true}
︠7afa84c4-ecd5-41a7-8071-73a8cf1878cfi︠
%md
Agora que xa vimos como funcionan estes comandos e métodos, estes serán os pasos que seguiremos:
1. A partir da matriz **H** obteremos o número de filas e o de columnas: **H.dimensions()** = $[r,n]$
2. Comezaremos con t = 1 e usaremos **Combinations(n,t)** para ver cantos grupos de $t$ columnas podemos facer
3. Con **H.columns()** facemos a lista de columnas de **H**
4. Para cada unha das combinacións facemos unha lista coas columnas cuxos números están na combinación
5. Con esta lista de vectores fabricamos unha matriz e miramos o seu rango
   - Se algunha destas matrices ten rango menor có numero de columnas que collemos, xa teremos que a distancia mínima será este $t$
   - Se ningunha destas matrices ten rango inferior, aumentamos $t$ en unha unidade, e repetimos
6. Necesariamente, este proceso para, porque non pode haber $r+1$ columnas independentes, sendo $r$ o número de filas da matriz. Polo tanto deterems a análise en $r$ e, se ningún gruo de $r$ columnas resulta dependente, declaramos a distancia mínima igual a $r+1$
︡27ede397-18cc-4dff-adc1-3030ae785d1b︡{"done":true,"md":"Agora que xa vimos como funcionan estes comandos e métodos, estes serán os pasos que seguiremos:\n1. A partir da matriz **H** obteremos o número de filas e o de columnas: **H.dimensions()** = $[r,n]$\n2. Comezaremos con t = 1 e usaremos **Combinations(n,t)** para ver cantos grupos de $t$ columnas podemos facer\n3. Con **H.columns()** facemos a lista de columnas de **H**\n4. Para cada unha das combinacións facemos unha lista coas columnas cuxos números están na combinación\n5. Con esta lista de vectores fabricamos unha matriz e miramos o seu rango\n   - Se algunha destas matrices ten rango menor có numero de columnas que collemos, xa teremos que a distancia mínima será este $t$\n   - Se ningunha destas matrices ten rango inferior, aumentamos $t$ en unha unidade, e repetimos\n6. Necesariamente, este proceso para, porque non pode haber $r+1$ columnas independentes, sendo $r$ o número de filas da matriz. Polo tanto deterems a análise en $r$ e, se ningún gruo de $r$ columnas resulta dependente, declaramos a distancia mínima igual a $r+1$"}
︠639b09a2-06a2-449a-a299-51c86e9986f0s︠
def d_m(M):                                   # M é a matriz de control do código que queremos analizar
    n = M.dimensions()[1]                     # número de columnas
    r = M.dimensions()[0]                     # número de filas
    t = 1                                     # tamaño do grupo de columnas que analizaremos para ver se son linearmente dependentes
    col = M.columns()                         # lista formada coas columnas de M
    while t <= r:                             # non ten sentido analizar grupos de columnas con máis de r columnas, pois serán sempre dependentes
        K = Combinations(n,t)                 # relación de combinación de n elementos tomados de t en t
        for x in K:                           # para cada unha das combinacións
            N = matrix([col[i] for i in x])   # formamos a matriz que ten por filas as columnas consideradas
            if N.rank() < t:                  # se algunha destas matrices ten rango < t, as columnas son dependentes
                return t                      # t é a distancia mínima
        t += 1                                # se todos os grupos de t columnas son independentes, aumentamos o tamaño dos grupos e volvemos empezar
    return r+1                                # se ningún grupo de r columnas é dependente, a distancia mínima é r+1
︡be014efd-47dd-47b0-a357-49b060aebbc4︡{"done":true}
︠265c7471-d908-4676-8d56-5d4e29d7deafso︠
H = matrix(GF(2),3,5,[1,0,0,1,1,1,0,1,0,1,10,0,1,0,0])
H
︡e18d6639-cc6e-4dd5-9140-ed953d5b1a12︡{"stdout":"[1 0 0 1 1]\n[1 0 1 0 1]\n[0 0 1 0 0]\n"}︡{"done":true}
︠939aeb67-5df3-4e0d-97fd-56d12afc5741o︠
d_m(H)                                        # observar que H ten unha columna formada por ceros
︡ce97cee3-cf5e-4cfc-9048-9a19c060fa4a︡{"stdout":"1\n"}︡{"done":true}
︠7f93942a-ed4e-4b07-a830-e54f5f024c5co︠
H2 = matrix(GF(2),3,5,[1,1,0,1,1,1,0,1,0,1,10,0,1,0,0])
H2
︡1c854e7c-1a82-4fb7-b9aa-be653d0ca594︡{"stdout":"[1 1 0 1 1]\n[1 0 1 0 1]\n[0 0 1 0 0]\n"}︡{"done":true}
︠883f0942-d849-4fe2-bef4-bdc65b26b1b4o︠
d_m(H2)                                        # observar que H2 ten dúas columnas iguais
︡6db9d850-87bb-49ea-bbe9-960d47ccae2c︡{"stdout":"2\n"}︡{"done":true}
︠7c481762-6e9c-4ecb-9bc7-f871c321625eso︠
H4 = matrix(GF(2),3,4,[1,0,0,1, 0,1,0,1, 0,0,1,1])
H4
︡30be23a5-fee6-40b7-aefc-a48ff75e6a95︡{"stdout":"[1 0 0 1]\n[0 1 0 1]\n[0 0 1 1]\n"}︡{"done":true}
︠ddf1ead9-a1ef-400c-ac33-98b9d04acc2fso︠
d_m(H4)                                        # observar que H4 NON ten tres columnas dependentes
︡c9147591-4ff7-4d12-9c83-5d6963b8fbca︡{"stdout":"4\n"}︡{"done":true}
︠02f2dd26-5d6a-47e9-9d49-bee5424b74dfi︠
%md
## Táboa estándar dun código linear
Dado $C$, un $[n,k]$ código sobre $\mathbb{F}_q$, definimos en $(\mathbb{F}_q)^n$ a relación de equivalencia $u \sim v :\Leftrightarrow u-v\in C$. Polo tanto, $[u]=u+C$. Naturalmente, se $v\in[u]$, entón existe $c\in C$, tal que $v-c =u$, polo que $d(v,c)=w(v-c)=w(u)$. É dicir, para calquera palabra $v$ da clase de $u$ hai unha palabra do código a unha distancia igual ó peso de $u$. Entón a palabra de menor peso entre todas as da mesma clase determina a menor distancia de calquera das palabras da clase a unha palabra do código.

Con esta idea en mente, chamámoslle **líder** dunha clase a calquera palabra con peso minimal entre todas as da clase. Chámase **táboa estándar** a unha disposición cuxas filas son as diferentes clases de equivalencia, sendo a primeira fila o código $c$ (a clase de **0**) e de xeito que na primeira columna aparecen líderes de cada unha das clases e os elementos da fila $i$ e columna $j$ resulta de sumarll ó lider da clase $i$ o vector do código da posición $j$ na primeira fila.

︡90faa4af-c68b-43d1-b0b2-d6679849e155︡{"done":true,"md":"## Táboa estándar dun código linear\nDado $C$, un $[n,k]$ código sobre $\\mathbb{F}_q$, definimos en $(\\mathbb{F}_q)^n$ a relación de equivalencia $u \\sim v :\\Leftrightarrow u-v\\in C$. Polo tanto, $[u]=u+C$. Naturalmente, se $v\\in[u]$, entón existe $c\\in C$, tal que $v-c =u$, polo que $d(v,c)=w(v-c)=w(u)$. É dicir, para calquera palabra $v$ da clase de $u$ hai unha palabra do código a unha distancia igual ó peso de $u$. Entón a palabra de menor peso entre todas as da mesma clase determina a menor distancia de calquera das palabras da clase a unha palabra do código.\n\nCon esta idea en mente, chamámoslle **líder** dunha clase a calquera palabra con peso minimal entre todas as da clase. Chámase **táboa estándar** a unha disposición cuxas filas son as diferentes clases de equivalencia, sendo a primeira fila o código $c$ (a clase de **0**) e de xeito que na primeira columna aparecen líderes de cada unha das clases e os elementos da fila $i$ e columna $j$ resulta de sumarll ó lider da clase $i$ o vector do código da posición $j$ na primeira fila."}
︠4ab18704-917c-4ff9-ba73-49f3e1a6eefb︠

︡d2f0667e-3337-4f35-9501-ab4c5808e33c︡
︠3fe7aacb-937f-49b3-857e-44943f5f7045i︠
%md
Para costruírmos unha función que, a partir da matriz xeneradora e do corpo base nos devolva a táboa estándar, usaremos os métodos **.row_pace** e **.dimensions** para matrices,  **.hamming_weight** para vectores e **.index**, **.count** e **.append** para listas, e procedemos como segue:

Partindo de todos os vectores do espazo ambiente, eliximos un de peso minimal e facémolo lider da primeira fila (naturalmente, será o vector 0). Fabricamos a fila enteira sumándolle a este lider os vectores de $C$ (entre eles está o cero, en primeira posición). Eliminamos todos este vectores e repetimos o procedemento, ata finalizar.

Para determinar o vector de peso minimal, construímos a lista de todos os pesos, determinamos o mínimo, miramos que posición ocupa na lista de pesos e recuperamos o vector que está nesa posición.
︡54e63207-d425-427d-b78d-2e47478bea95︡{"done":true,"md":"Para costruírmos unha función que, a partir da matriz xeneradora e do corpo base nos devolva a táboa estándar, usaremos os métodos **.row_pace** e **.dimensions** para matrices,  **.hamming_weight** para vectores e **.index**, **.count** e **.append** para listas, e procedemos como segue:\n\nPartindo de todos os vectores do espazo ambiente, eliximos un de peso minimal e facémolo lider da primeira fila (naturalmente, será o vector 0). Fabricamos a fila enteira sumándolle a este lider os vectores de $C$ (entre eles está o cero, en primeira posición). Eliminamos todos este vectores e repetimos o procedemento, ata finalizar.\n\nPara determinar o vector de peso minimal, construímos a lista de todos os pesos, determinamos o mínimo, miramos que posición ocupa na lista de pesos e recuperamos o vector que está nesa posición."}
︠4f58bbf4-576b-41b3-b192-8df89e4c411as︠
def taboa(G, F):                                                      # matriz xeneradora e corpo base
    n = G.dimensions()[1]                                             # o número de columnas da matriz, que coincide coa dimensión do espazo ambiente
    Fn = VectorSpace(F,n)                                             # espazo ambiente
    C = G.row_space()                                                 # o código
    resto = Fn                                                        # onde iremos controlando os vectores que non se usaron
    T = []                                                            # onde iremos engadindo as clases, como listas
    while len(resto) > 0:                                             # pararemos cando non nos queden máis vectores
        pesos = [v.hamming_weight() for v in resto]                   # lista cos pesos dos vectores que quedan para usar
        pm = min(pesos)                                               # o menor dos pesos dos vectores que restan por usar
        pos = pesos.index(pm)                                         # posición na que aparece (por primeira vez) o peso mínimo
        lider = resto[pos]                                            # o vector que ocupa esa posición
        clase = [lider + c for c in C]                                # lista formada polos vectores da clase do lider
        T.append(clase)                                               # engadimos a T esta lista, como elemento
        resto = [x for x in resto if x not in clase]                  # filtramos os vectores que acabamos de usar
    return T
︡8ec3e0a4-1fba-4ff3-b448-447dbde4a2e4︡{"done":true}
︠0417555b-72c8-45c1-ad16-26bc2e3c7190so︠
H
︡2d3f6d19-c12f-434e-bf0f-37d8cbf3e2e7︡{"stdout":"[1 0 0 1 1]\n[1 0 1 0 1]\n[0 0 1 0 0]\n"}︡{"done":true}
︠cba488d7-9138-4f19-a2f5-ff29067ff0b0so︠
taboa(H,GF(2))
︡eaa2bf88-1deb-448a-bfd0-98744247eb0c︡{"stdout":"[[(0, 0, 0, 0, 0), (1, 0, 0, 0, 1), (0, 0, 1, 0, 0), (1, 0, 1, 0, 1), (0, 0, 0, 1, 0), (1, 0, 0, 1, 1), (0, 0, 1, 1, 0), (1, 0, 1, 1, 1)], [(1, 0, 0, 0, 0), (0, 0, 0, 0, 1), (1, 0, 1, 0, 0), (0, 0, 1, 0, 1), (1, 0, 0, 1, 0), (0, 0, 0, 1, 1), (1, 0, 1, 1, 0), (0, 0, 1, 1, 1)], [(0, 1, 0, 0, 0), (1, 1, 0, 0, 1), (0, 1, 1, 0, 0), (1, 1, 1, 0, 1), (0, 1, 0, 1, 0), (1, 1, 0, 1, 1), (0, 1, 1, 1, 0), (1, 1, 1, 1, 1)], [(1, 1, 0, 0, 0), (0, 1, 0, 0, 1), (1, 1, 1, 0, 0), (0, 1, 1, 0, 1), (1, 1, 0, 1, 0), (0, 1, 0, 1, 1), (1, 1, 1, 1, 0), (0, 1, 1, 1, 1)]]\n"}︡{"done":true}
︠fc36eb87-f23c-48ec-afef-a52707cc5f5fso︠
for clase in taboa(H,GF(2)):
    clase
︡fc9c7c43-6529-49df-872d-be3b6ee0c3fc︡{"stdout":"[(0, 0, 0, 0, 0), (1, 0, 0, 0, 1), (0, 0, 1, 0, 0), (1, 0, 1, 0, 1), (0, 0, 0, 1, 0), (1, 0, 0, 1, 1), (0, 0, 1, 1, 0), (1, 0, 1, 1, 1)]\n[(1, 0, 0, 0, 0), (0, 0, 0, 0, 1), (1, 0, 1, 0, 0), (0, 0, 1, 0, 1), (1, 0, 0, 1, 0), (0, 0, 0, 1, 1), (1, 0, 1, 1, 0), (0, 0, 1, 1, 1)]\n[(0, 1, 0, 0, 0), (1, 1, 0, 0, 1), (0, 1, 1, 0, 0), (1, 1, 1, 0, 1), (0, 1, 0, 1, 0), (1, 1, 0, 1, 1), (0, 1, 1, 1, 0), (1, 1, 1, 1, 1)]\n[(1, 1, 0, 0, 0), (0, 1, 0, 0, 1), (1, 1, 1, 0, 0), (0, 1, 1, 0, 1), (1, 1, 0, 1, 0), (0, 1, 0, 1, 1), (1, 1, 1, 1, 0), (0, 1, 1, 1, 1)]\n"}︡{"done":true}
︠304d4704-b3db-45f2-ac0c-11df930a81f5o︠
T = taboa(H,GF(2))
[T[i][0] for i in range(len(T))]          # son os líderes (non necesariamente únicos!)
︡5c701ba0-d6b0-40a3-afa0-635465a9d788︡{"stdout":"[(0, 0, 0, 0, 0), (1, 0, 0, 0, 0), (0, 1, 0, 0, 0), (1, 1, 0, 0, 0)]\n"}︡{"done":true}
︠fc12cbbf-32b4-41f7-a185-1156be8da525o︠
T = taboa(H,GF(2))
for clase in T:
    clase[0]                              # a primeira columna da táboa (os líderes)
︡7ceaf132-c216-4f5f-9bf6-1498c6075f3d︡{"stdout":"(0, 0, 0, 0, 0)\n(1, 0, 0, 0, 0)\n(0, 1, 0, 0, 0)\n(1, 1, 0, 0, 0)\n"}︡{"done":true}
︠fe0477f2-b814-47ea-b97a-700d15044ebb︠
%md
Outra aproximación máis matemática, podería ser 
︡1b4c51b9-1fe2-427b-910f-aee2ac176999︡
︠44b53379-353e-41fc-89e4-f327c271ee80s︠

︡881d5202-19c1-4087-9922-4905ec70f067︡{"done":true}
︠5b10b36c-4e14-40c3-9cbf-6ee7ee87d8c1︠

︡ceb981b8-475e-46fc-aad3-d76245758b08︡{"done":true,"md":"## Síndrome dun vector\nSendo $H$ a matriz de control dun código $C$, sabemos que $vH^t = 0$ equivale a que $v\\in C$. En xeral, chamamos **síndrome** dun vector $v$ ó vector $s(v) = vH^t$. Dous vectores teñen o mesmo síndrome se, e só se, están na mesma clase, é dicir, se a súa diferencia é un vector de $C$.\n### Reto 1:\n##### Definir unha función para calcular a táboa de síndromes dun códigos a partir da matriz de control\n\nLembrar que o código $C$ pódese recuperar de $H$ mediante H.transpose().kernel()"}
︠d4b23e5d-a051-43d0-9765-2b6fe104fc86i︠
%md
A partir da táboa estándar podemos definir unha **función de descodificación completa por lider**

Buscamos en que fila aparece o vector a descodificar, miramos en que columna aparece e devolvemos a palabra código que estéa neas mesma columna.
︡2ba375cc-fe08-431a-904d-615f087420d1︡{"done":true,"md":"A partir da táboa estándar podemos definir unha **función de descodificación completa por lider**\n\nBuscamos en que fila aparece o vector a descodificar, miramos en que columna aparece e devolvemos a palabra código que estéa neas mesma columna."}
︠8de28041-1089-4bfd-a407-a5318328b235s︠
def RDLC(v,G,F):                          # vector a descodificar, matriz xeneradora, corpo base
    T = taboa(G,F)
    r = len(T)                            # número de clases
    i = 0                                 # comezamos a mirar pola primeira fila
    while v not in T[i]:                  # se v non está nesta fila
        i += 1                            # pasamos á fila seguinte
    clase = T[i]                          # será a fila na que aparece v
    pos = clase.index(v)                  # posición na que aparece dentro da fila
    return T[0][pos]                      # recuperamos o elemento da primeira fila que está nesa posición
︡7484de9c-b6bc-4ac8-80ad-76b93e0cda8c︡{"done":true}
︠3499a32f-b3a6-41d6-8864-cc53542a7effso︠
RDLC(vector([0, 0, 0, 0, 1]),H,GF(2))     # ollo que temos que meter un vector!
︡ada80d62-8d80-4b6c-89f5-3937d083db95︡{"stdout":"(1, 0, 0, 0, 1)\n"}︡{"done":true}
︠a542bcb8-87b8-47b1-80af-c1ed464d152fso︠
for v in VectorSpace(GF(2),5):            # así se descodificarían todos os vectores do espazo ambiente
    print v, '--->', RDLC(v,H,GF(2))
︡a4239c06-57d2-427e-a998-4a10e62ab267︡{"stdout":"(0, 0, 0, 0, 0) ---> (0, 0, 0, 0, 0)\n(1, 0, 0, 0, 0) ---> (0, 0, 0, 0, 0)\n(0, 1, 0, 0, 0) ---> (0, 0, 0, 0, 0)\n(1, 1, 0, 0, 0) ---> (0, 0, 0, 0, 0)\n(0, 0, 1, 0, 0) ---> (0, 0, 1, 0, 0)\n(1, 0, 1, 0, 0) ---> (0, 0, 1, 0, 0)\n(0, 1, 1, 0, 0) ---> (0, 0, 1, 0, 0)\n(1, 1, 1, 0, 0) ---> (0, 0, 1, 0, 0)\n(0, 0, 0, 1, 0) ---> "}︡{"stdout":"(0, 0, 0, 1, 0)\n(1, 0, 0, 1, 0) ---> (0, 0, 0, 1, 0)\n(0, 1, 0, 1, 0) ---> (0, 0, 0, 1, 0)\n(1, 1, 0, 1, 0) ---> (0, 0, 0, 1, 0)\n(0, 0, 1, 1, 0) ---> (0, 0, 1, 1, 0)\n(1, 0, 1, 1, 0) ---> (0, 0, 1, 1, 0)\n(0, 1, 1, 1, 0) ---> (0, 0, 1, 1, 0)\n(1, 1, 1, 1, 0) ---> (0, 0, 1, 1, 0)\n(0, 0, 0, 0, 1) ---> "}︡{"stdout":"(1, 0, 0, 0, 1)\n(1, 0, 0, 0, 1) ---> (1, 0, 0, 0, 1)\n(0, 1, 0, 0, 1) ---> (1, 0, 0, 0, 1)\n(1, 1, 0, 0, 1) ---> (1, 0, 0, 0, 1)\n(0, 0, 1, 0, 1) ---> (1, 0, 1, 0, 1)\n(1, 0, 1, 0, 1) ---> (1, 0, 1, 0, 1)\n(0, 1, 1, 0, 1) ---> (1, 0, 1, 0, 1)\n(1, 1, 1, 0, 1) ---> (1, 0, 1, 0, 1)\n(0, 0, 0, 1, 1) ---> (1, 0, 0, 1, 1)\n(1, 0, 0, 1, 1) ---> (1, 0, 0, 1, 1)\n(0, 1, 0, 1, 1) ---> "}︡{"stdout":"(1, 0, 0, 1, 1)\n(1, 1, 0, 1, 1) ---> (1, 0, 0, 1, 1)\n(0, 0, 1, 1, 1) ---> (1, 0, 1, 1, 1)\n(1, 0, 1, 1, 1) ---> (1, 0, 1, 1, 1)\n(0, 1, 1, 1, 1) ---> (1, 0, 1, 1, 1)\n(1, 1, 1, 1, 1) ---> (1, 0, 1, 1, 1)\n"}︡{"done":true}
︠abd21438-cda6-43e8-874e-874837995d90i︠
%md
### Reto 2:
##### Definir a función de descodificación **incompleta** por lider
︡0d88f10a-ecae-4386-9607-c8967c815a09︡{"done":true,"md":"### Reto 2:\n##### Definir a función de descodificación **incompleta** por lider"}
︠3dc2a505-63e2-42db-aeb1-0f67cf8b500fi︠
%md
## Síndrome dun vector
Sendo $H$ a matriz de control dun código $C$, sabemos que $vH^t = 0$ equivale a que $v\in C$. En xeral, chamamos **síndrome** dun vector $v$ ó vector $s(v) = vH^t$. Dous vectores teñen o mesmo síndrome se, e só se, están na mesma clase, é dicir, se a súa diferencia é un vector de $C$.
### Reto 3:
##### Definir unha función para calcular a **táboa de síndromes dun códigos a partir da matriz de control

#
### Reto 4:

##### Definir unha función para descodificar polo método do síndrome

Lembrar que o código $C$ pódese recuperar de $H$ mediante H.transpose().kernel()
︡be5ab76d-4715-4f65-a849-1b384780019c︡{"done":true,"md":"## Síndrome dun vector\nSendo $H$ a matriz de control dun código $C$, sabemos que $vH^t = 0$ equivale a que $v\\in C$. En xeral, chamamos **síndrome** dun vector $v$ ó vector $s(v) = vH^t$. Dous vectores teñen o mesmo síndrome se, e só se, están na mesma clase, é dicir, se a súa diferencia é un vector de $C$.\n### Reto 3:\n##### Definir unha función para calcular a táboa de síndromes dun códigos a partir da matriz de control\n\n#\n### Reto 4:\n\n##### Definir unha función para descodificar polo método do síndrome\n\nLembrar que o código $C$ pódese recuperar de $H$ mediante H.transpose().kernel()"}
︠983b2c00-6642-46e5-b462-3b9b54fd0d09︠









