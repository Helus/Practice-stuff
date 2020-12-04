︠6eb17a1d-16d8-4a6a-a1b3-d312e3b8fad1i︠
%md
### Códigos de Reed-Müller

Trátase dunha familia de códigos. Os de primeira especie, dos que nos ocuparemos nesta práctica, $\mathcal{R}(1,m)$, son $[2^m,m+1,2^{m-1}]$ códigos binarios, que se definen recursivamente mediante:

1. $\mathcal{R}(1,0) = \{0,1\}$, é dicir, $\mathcal{R}(1,0) =\mathbb{Z}_2$.
2. $\mathcal{R}(1,m+1) = \{(u,u)\mid u \in \mathcal{R}(1,m)\}\cup \{(u,u+\bar{1})\mid u \in \mathcal{R}(1,m), \bar{1}=(1,\dots,1)\in(\mathbb{Z}_2)^{2^{m-1}}\}$.

Se $RM_m$ é a matriz xeneradora de $\mathcal{R}(1,m)$, entón
\[
RM_m = \left(\begin{array}{c|c}0\cdots 0 &1\cdots 1\\\hline RM_{m-1}&RM_{m-1} \end{array}\right)
\]

︡584c1bb4-fb98-4a71-a0bf-522aa1bba8a4︡{"done":true,"md":"### Códigos de Reed-Müller\n\nTrátase dunha familia de códigos. Os de primeira especie, dos que nos ocuparemos nesta práctica, $\\mathcal{R}(1,m)$, son $[2^m,m+1,2^{m-1}]$ códigos binarios, que se definen recursivamente mediante:\n\n1. $\\mathcal{R}(1,0) = \\{0,1\\}$, é dicir, $\\mathcal{R}(1,0) =\\mathbb{Z}_2$.\n2. $\\mathcal{R}(1,m+1) = \\{(u,u)\\mid u \\in \\mathcal{R}(1,m)\\}\\cup \\{(u,u+\\bar{1})\\mid u \\in \\mathcal{R}(1,m), \\bar{1}=(1,\\dots,1)\\in(\\mathbb{Z}_2)^{2^{m-1}}\\}$.\n\nSe $RM_m$ é a matriz xeneradora de $\\mathcal{R}(1,m)$, entón\n\\[\nRM_m = \\left(\\begin{array}{c|c}0\\cdots 0 &1\\cdots 1\\\\\\hline RM_{m-1}&RM_{m-1} \\end{array}\\right)\n\\]"}
︠404135ee-852f-4455-8b8d-07efbba860bd︠
def RM(m):                # usando o patrón fácilmente observable nas filas: bloques de 2^m-i 0's e de 1's, facer 2^m elementos (i = 0,…,m-1)
    A = []
    for i in range(m):
        Fi = ([0]*2^(m-1-i)+[1]*2^(m-1-i))*2^i
        A.append(Fi)
    A.append([1]*(2^m))   # a última fila son 2^m 1's
    return matrix(GF(2),A)
︡200dd010-e842-4eed-82bd-87fa2782e067︡{"done":true}
︠a2cb168c-faf3-4657-a29f-f6a9e5f643fds︠
RM(5)
︡f1d3145e-4942-49f1-ab25-15baa93a71f8︡{"stdout":"[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]\n[0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]\n[0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1]\n[0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1]\n[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]\n[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]\n"}︡{"done":true}
︠8e199310-59f9-4b22-9639-844cdf05adb7i︠
%html
<p>
    Tamén por inspección, as columnas (eliminada a entrada da última fila) son os números $0,\dots,2^{m-1}$ escritos en binario e completados con 0's á esquerda ata $r$ cifras.
</p>
<p>
    Comezamos cunha función para determinar estas cifras, en vez de usar <strong>.digits(2)</strong>, que dá as cifras en orde inverso a como se escribe o número, fabricamos nós as cifras unha a unha.
</p>
<p>
    <font color='red'>Precaución:</font> Hai que ter conta de que $n<2^m$, pois, noutro caso, $n$ tería máis de $m$ cifras en base $2$.
</p>
︡6efd0572-aefe-426f-83f8-e53d35fd412a︡{"done":true,"html":"<p>\n    Tamén por inspección, as columnas (eliminada a entrada da última fila) son os números $0,\\dots,2^{m-1}$ escritos en binario e completados con 0's á esquerda ata $r$ cifras.\n</p>\n<p>\n    Comezamos cunha función para determinar estas cifras, en vez de usar <strong>.digits(2)</strong>, que dá as cifras en orde inverso a como se escribe o número, fabricamos nós as cifras unha a unha.\n</p>\n<p>\n    <font color='red'>Precaución:</font> Hai que ter conta de que $n<2^m$, pois, noutro caso, $n$ tería máis de $m$ cifras en base $2$.\n</p>"}
︠f37ea115-f7fb-4b90-800b-bc1bece571bas︠
def c_b(n,m):           # devolve as m cifras en binario do número n (completando con ceros)
    L = []
    num = n
    for i in range(m):
        if num >= 2^(m-1-i):
            L.append(1)
            num -= 2^(m-1-i)
        else:
            L.append(0)
    return L
︡d11eec8e-a821-42ab-a05d-3a31b11127ff︡{"done":true}
︠974035f5-03b5-42e8-9ce4-860312e1dfa3s︠
c_b(1,5)
︡d48a2c7f-1838-4ae7-b63d-71948fdb446d︡{"stdout":"[0, 0, 0, 0, 1]\n"}︡{"done":true}
︠2caea655-696d-4ebb-8fd9-1f1d8e8350ba︠
c_b(1+2^2+2^3,6)
bin(1+2^2+2^3)             # conversión a binario para comparar resultados
︡28df175f-43c0-49c7-96a7-ec1da6ff4ed8︡{"stdout":"[0, 0, 1, 1, 0, 1]\n"}︡{"stdout":"'0b1101'\n"}︡{"done":true}
︠8b266135-16c5-404a-945d-6b8d82d83f92s︠
def rm(m):
    C = []
    for i in range(2^m):
        Ci = c_b(i,m)+[1]  # agregámoslle 1 na última posición ás m cifras
        C.append(Ci)
    M = matrix(GF(2),C)
    return M.transpose()
︡9c912614-d362-497f-a5ed-5ebcd7c0f459︡{"done":true}
︠29ad0f3d-2a79-4e42-9551-dfa249a369a4s︠
rm(4)
︡7c46fd8e-6dde-4757-b976-723e05b28fd8︡{"stdout":"[0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]\n[0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1]\n[0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1]\n[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]\n[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]\n"}︡{"done":true}
︠b1d6d585-c045-498d-8760-b78bc6f3a51di︠
%md
Alternativamente, podemos usar este algoritmo recursivo que mimetiza a definición de $\mathcal{R}(1,m)$
︡0deb9716-1742-4de5-b471-e2777ff7d9a0︡{"done":true,"md":"Alternativamente, podemos usar este algoritmo recursivo que mimetiza a definición de $\\mathcal{R}(1,m)$"}
︠75e11f25-eb4c-41d1-b8af-6c7cc3eafab3s︠
def r_m(n):
    if n == 0:
        return matrix(GF(2),[[1]])
    else:
        return block_matrix(2,2,[matrix([[0]*2^(n-1)]), matrix([[1]*2^(n-1)]),r_m(n-1),r_m(n-1)])
︡aa115322-2f7d-46fc-b2b8-daf6fa109de2︡{"done":true}
︠ce0d1948-7de4-44f2-baaa-ea373c47fb6cs︠
r_m(0)
︡e756dd7c-716c-4ba7-8059-f4565b47e346︡{"stdout":"[1]\n"}︡{"done":true}
︠9d8ac348-7f88-4af5-a4cd-fdddd92652cds︠
r_m(2)
︡3cf39d33-024a-48e3-bebf-5d51c1056a90︡{"stdout":"[0 0|1 1]\n[---+---]\n[0 1|0 1]\n[1 1|1 1]\n"}︡{"done":true}
︠513e962b-400d-499b-a8af-857374483ca6s︠
r_m(4)
︡d34984ff-2ccc-4b85-b6c0-6746681a7c68︡{"stdout":"[0 0 0 0 0 0 0 0|1 1 1 1 1 1 1 1]\n[---------------+---------------]\n[0 0 0 0 1 1 1 1|0 0 0 0 1 1 1 1]\n[0 0 1 1 0 0 1 1|0 0 1 1 0 0 1 1]\n[0 1 0 1 0 1 0 1|0 1 0 1 0 1 0 1]\n[1 1 1 1 1 1 1 1|1 1 1 1 1 1 1 1]\n"}︡{"done":true}
︠87cc5b32-acae-4417-ba65-d6f1644ee9f3s︠
show(r_m(4))
︡cbf2cb8f-4a45-4eb0-a949-cb6c31f7fdd5︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrrrrrr|rrrrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 \\\\\n\\hline\n 0 &amp; 0 &amp; 0 &amp; 0 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 1 &amp; 1 &amp; 1 &amp; 1 \\\\\n0 &amp; 0 &amp; 1 &amp; 1 &amp; 0 &amp; 0 &amp; 1 &amp; 1 &amp; 0 &amp; 0 &amp; 1 &amp; 1 &amp; 0 &amp; 0 &amp; 1 &amp; 1 \\\\\n0 &amp; 1 &amp; 0 &amp; 1 &amp; 0 &amp; 1 &amp; 0 &amp; 1 &amp; 0 &amp; 1 &amp; 0 &amp; 1 &amp; 0 &amp; 1 &amp; 0 &amp; 1 \\\\\n1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1 &amp; 1\n\\end{array}\\right)$</div>"}︡{"done":true}
︠30bd76ed-08f7-4e8f-af1d-4bd218e94163i︠
%md
## Lóxica das maiorías
Sendo $F_1,\dots,F_{m}$ as filas de $RM(1,m)$, se recibimos un vector $(x_1,\dots,x_{2^m})$ e queremos atopar o *máis parecido* no código $\langle F_1,\dots,F_{n}\rangle$ que será da forma $(c_1,\dots,c_{2^m})=\sum_{k=0}^{n}\alpha_kF_k$.

A idea é establecer todas as ecuacións que relacionan os $\alpha_k$'s cos $c_i$'s, e substituír os $c_i$'s polos $x_i$'s. Se $(x_i)_i$ non pertence ao código, algunhas destas ecuacións non serán certas e non poderemos determinar os $\alpha_k$'s. O que se fai e mirar todas as ecuacións para cada $k$ e dar por válido o valor de $\alpha_k$ que cumpre a maior cantidade delas.

Na linguaxe de álxebra linear, cando se fala do espacio dual sábese que é posible atopar unha base dual $\{F^1,\dots,F^n\}$, coa propiedade de que $F^i(F_j)=\delta_{ij}$. En realidade, trátase de buscar vectores $v_i$ tales que $v_i\cdot F_j=\delta_{ij}$, e farémolo de xeito que teñan peso de Hamming = 2, é dicir que $v_i$ sexan suma de dous vectores da base canónica de $(\mathbb{Z}_2)^{2^m}$, $v_i = e_a+e_b$. 

Dado que $e_a\cdot F_j=F_{ja}$ (a compoñente $a$-ésima de $F_j$), temos que $(e_a+e_b)\cdot F_j= F_{ja}+F_{jb}$, e que sexa $0$ quere dicir que $F_{ja}=F_{jb}$, e que sexa $1$ significa que $F_{ja}\ne F_{jb}$. Noutras palabras, as columnas $a$ e $b$ de $RM(m)$ coincidirán en todas as entradas, salvo as de posición $i$ que serán distintas. Un par $(a,b)$ que cumpre esta condición para $i$ diremos que é unha **boa parella** para $i$, e cada parella boa para $i$ danos unha ecuación que relaciona $\alpha_i$ con $c_a$ e $c_b$, pois, se $c=\sum_{k=0}^{n}\alpha_kF_k$, entón $c_a+c_b=(e_a+e_b)\cdot c = (e_a+e_b)\cdot\sum_{k=0}^{n}\alpha_kF_k = \alpha_i$. 

En xeral, teremos $2^{m-1}$ boas parellas para cada $i=0,1,\dots,m-1$, que nos proporcionan $2^{m-1}$ ecuacións para cada $\alpha_i$, con $i=0,1,\dots,m-1$. Para $\alpha_m$ non teremos ecuacións, pero podemos facer $x-\sum_{i=0}^{m-1}\alpha_iF_i = e + \alpha_mF_m$, sendo $e$ o erro cometido na transmisión. Sempre que o peso do $\omega(e)\le 2^{m-2}-1$, temos só dúas posibilidades: $\alpha_m = 0$ ou $\alpha_m=1$, polo que elixiremos un ou outro valor se $\omega(x-\sum_{i=0}^{m-1}\alpha_iF_i) < 2^{m-2}$ ou  $\omega(x-\sum_{i=0}^{m-1}\alpha_iF_i-F_m) < 2^{m-2}$, dado que $2^{m-2} -1$ é a capacidade correctora do código.

Agora, dado que as columnas de $RM(m)$, sen a última fila, son as representación binarias dos números $0,\dots,2^{m-1}$, para localizar unha boa parella $(a,b)$, con $a < b$, na fila $i$-ésima, para cada columna con $0$ na posición $i$, hai outra, á súa dereita, con $1$ na posición $i$. De feito, se a primeira columna é a $a$-ésima, a segunda será a $(a+2^{m-(i+1)})$-ésima, naturalmente, sempre que $i < m$.

Por exemplo, para $m=3$, teríamos as boas parellas seguintes:
- para $i=0$:  $(0,4),(1,5),(2,6),(3,7)$
- para $i=1$:  $(0,2),(1,3),(4,6),(5,7)$
- para $i=2$:  $(0,1),(2,3),(4,5),(6,7)$



︡dcf9f12c-958b-4e97-960a-73162def562c︡{"done":true,"md":"## Lóxica das maiorías\nSendo $F_1,\\dots,F_{m}$ as filas de $RM(1,m)$, se recibimos un vector $(x_1,\\dots,x_{2^m})$ e queremos atopar o *máis parecido* no código $\\langle F_1,\\dots,F_{n}\\rangle$ que será da forma $(c_1,\\dots,c_{2^m})=\\sum_{k=0}^{n}\\alpha_kF_k$.\n\nA idea é establecer todas as ecuacións que relacionan os $\\alpha_k$'s cos $c_i$'s, e substituír os $c_i$'s polos $x_i$'s. Se $(x_i)_i$ non pertence ao código, algunhas destas ecuacións non serán certas e non poderemos determinar os $\\alpha_k$'s. O que se fai e mirar todas as ecuacións para cada $k$ e dar por válido o valor de $\\alpha_k$ que cumpre a maior cantidade delas.\n\nNa linguaxe de álxebra linear, cando se fala do espacio dual sábese que é posible atopar unha base dual $\\{F^1,\\dots,F^n\\}$, coa propiedade de que $F^i(F_j)=\\delta_{ij}$. En realidade, trátase de buscar vectores $v_i$ tales que $v_i\\cdot F_j=\\delta_{ij}$, e farémolo de xeito que teñan peso de Hamming = 2, é dicir que $v_i$ sexan suma de dous vectores da base canónica de $(\\mathbb{Z}_2)^{2^m}$, $v_i = e_a+e_b$. \n\nDado que $e_a\\cdot F_j=F_{ja}$ (a compoñente $a$-ésima de $F_j$), temos que $(e_a+e_b)\\cdot F_j= F_{ja}+F_{jb}$, e que sexa $0$ quere dicir que $F_{ja}=F_{jb}$, e que sexa $1$ significa que $F_{ja}\\ne F_{jb}$. Noutras palabras, as columnas $a$ e $b$ de $RM(m)$ coincidirán en todas as entradas, salvo as de posición $i$ que serán distintas. Un par $(a,b)$ que cumpre esta condición para $i$ diremos que é unha **boa parella** para $i$, e cada parella boa para $i$ danos unha ecuación que relaciona $\\alpha_i$ con $c_a$ e $c_b$, pois, se $c=\\sum_{k=0}^{n}\\alpha_kF_k$, entón $c_a+c_b=(e_a+e_b)\\cdot c = (e_a+e_b)\\cdot\\sum_{k=0}^{n}\\alpha_kF_k = \\alpha_i$. \n\nEn xeral, teremos $2^{m-1}$ boas parellas para cada $i=0,1,\\dots,m-1$, que nos proporcionan $2^{m-1}$ ecuacións para cada $\\alpha_i$, con $i=0,1,\\dots,m-1$. Para $\\alpha_m$ non teremos ecuacións, pero podemos facer $x-\\sum_{i=0}^{m-1}\\alpha_iF_i = e + \\alpha_mF_m$, sendo $e$ o erro cometido na transmisión. Sempre que o peso do $\\omega(e)\\le 2^{m-2}-1$, temos só dúas posibilidades: $\\alpha_m = 0$ ou $\\alpha_m=1$, polo que elixiremos un ou outro valor se $\\omega(x-\\sum_{i=0}^{m-1}\\alpha_iF_i) < 2^{m-2}$ ou  $\\omega(x-\\sum_{i=0}^{m-1}\\alpha_iF_i-F_m) < 2^{m-2}$, dado que $2^{m-2} -1$ é a capacidade correctora do código.\n\nAgora, dado que as columnas de $RM(m)$, sen a última fila, son as representación binarias dos números $0,\\dots,2^{m-1}$, para localizar unha boa parella $(a,b)$, con $a < b$, na fila $i$-ésima, para cada columna con $0$ na posición $i$, hai outra, á súa dereita, con $1$ na posición $i$. De feito, se a primeira columna é a $a$-ésima, a segunda será a $(a+2^{m-(i+1)})$-ésima, naturalmente, sempre que $i < m$.\n\nPor exemplo, para $m=3$, teríamos as boas parellas seguintes:\n- para $i=0$:  $(0,4),(1,5),(2,6),(3,7)$\n- para $i=1$:  $(0,2),(1,3),(4,6),(5,7)$\n- para $i=2$:  $(0,1),(2,3),(4,5),(6,7)$"}
︠979d5991-6a5c-4565-b127-ba0da42f8008i︠
%md
Esta podería ser unha función para determinar as boas parellas para cada $\alpha_i$
︡42566ece-3e68-43d7-822b-f00312ecd4b0︡{"done":true,"md":"Esta podería ser unha función para determinar as boas parellas para cada $\\alpha_i$"}
︠35410348-3ea4-48e1-8fe7-7a98ed93731a︠
def bp(i,m):
    Fi = RM(m)[i]                    
    return [[a,a+2^(m-(i+1))] for a in range(2^m) if Fi[a] == 0]
︡bd0d394e-9dbb-4a4d-b197-38080ec34056︡{"done":true}
︠4f0fb526-00ae-470f-9956-4b94778cda4as︠
bp(0,3)           
︡3f75c1ab-a416-4577-877e-9fcbf67e86df︡{"stdout":"[[0, 4], [1, 5], [2, 6], [3, 7]]\n"}︡{"done":true}
︠331b226c-4f28-4155-a202-9f79ddd7c5b0s︠
bp(1,3)
︡b4fd3176-84d2-4131-ab7a-a32301eeba35︡{"stdout":"[[0, 2], [1, 3], [4, 6], [5, 7]]\n"}︡{"done":true}
︠90efbe23-7a00-462e-a2ab-9dd9ef891c5d︠
bp(0,5)
︡954c02e9-2dea-4988-8fa2-33eaacc43445︡{"stdout":"[[0, 16], [1, 17], [2, 18], [3, 19], [4, 20], [5, 21], [6, 22], [7, 23], [8, 24], [9, 25], [10, 26], [11, 27], [12, 28], [13, 29], [14, 30], [15, 31]]\n"}︡{"done":true}︡
︠a602d752-217e-412a-b9a7-771b5a152fcdi︠
%md
##### Exemplo de función para descodificar usando a lóxica das maiorías
︡7219c466-5858-4973-ba8f-4e95dc658ca9︡{"done":true,"md":"##### Exemplo de función para descodificar usando a lóxica das maiorías"}
︠6eef13f7-3a5c-4448-9387-cef3ebba2a44︠
def dlm(x,m):
    alfa = []                                            # para ir gardando as alfas (salvo a última)
    for i in range(m):
        par = bp(i,m)                                    # boas parellas para alfa_i
        pos = [x[p[0]]+x[p[1]] for p in par]             # sumas dos x_a e x_b para alpha_i
        if pos.count(0) >= pos.count(1):                 # se hai máis 0's 
            alfa.append(0)                               # facemos alfa = 0
        else:
            alfa.append(1)
                                                         # imos decidir s tomamos o último alfa como 0 ou como 1
    F = RM(m)                                            # matriz xeneradora de R(1,m)
    e = x - sum([alfa[i]*F[i] for i in range(m-1)])      # erro cometido se se tivese enviado a nosa combinación de alpha's e alpha_m = 0
    if vector(e).hamming_weight() < 2^(m-2):             # se o peso deste erro non supera a capacidade corectora
        return x - e                                     # equivale a alfa_m-1 = 0
    elif vector(e-F[m-1]).hamming_weight() < 2^(m-2):    # erro cometido se se tivese enviado a nosa combinación de alpha's e alpha_m = 1
        alfa.append(1)
        return sum([alfa[i]*F[i] for i in range(m)])
    else:                                                # se nen 0 nen 1 nos valen como alpha_m
        return 'demasiados erros'                     
︡f91368b2-bfe9-4fba-b45d-32b6880ee191︡{"done":true}
︠fecefc1b-96a7-440c-8840-9799f7122b18s︠
vector([0,1,1,1,0,0,1,1,0,0,1,1,0,0,1,1]).hamming_weight()
︡b6ae7cec-758c-416e-80b2-e968f7ebb161︡{"stdout":"9\n"}︡{"done":true}
︠5917d4c6-ada8-4872-bc77-695d363fb46f︠

︡c9ac34fa-569a-462b-9b62-441e46098c15︡{"done":true}︡
︠af9a9bc7-609d-4cb3-b82d-4474d0d6ee93s︠
RM(4)
︡bd9707a4-7bb2-47aa-b4f6-88b7ee2a403d︡{"stdout":"[0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]\n[0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1]\n[0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1]\n[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]\n[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]\n"}︡{"done":true}
︠c9a3f5d3-d097-4e8a-91cf-4535a08e4770s︠
m = vector(GF(2),RM(4)[2])
erro = vector(GF(2),[0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0])

︡c4a60025-65b4-4684-a747-9af537fe38d7︡{"done":true}
︠2ca2fe38-6c9f-4d43-810b-efc0aecb5a77s︠
m+erro
dlm(m+erro,4)
︡538ee902-ec85-48bd-8403-81ab933ce2e5︡{"stdout":"(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1)\n"}︡{"stdout":"(0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1)\n"}︡{"done":true}
︠13b372c4-5fee-4b9d-b24a-74e983e3b058s︠
dlm(m+erro,4) == m
︡bad45c90-aa36-40e2-989a-ad254351f184︡{"stdout":"True\n"}︡{"done":true}
︠87f8707b-a9a2-4434-9c1b-4dda5f26cc37s︠
drm(vector(GF(2),[0,1,1,1,0,1,1,1,0,0,1,1,0,0,1,1]),4)
︡7ab1db33-40c6-4d2b-a047-64f0226da293︡{"stdout":"(0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1)\n"}︡{"done":true}
︠f000750f-a423-4bf4-9d8f-e222e0c01345︠









