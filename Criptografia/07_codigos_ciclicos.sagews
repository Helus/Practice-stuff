︠ffbcd2ae-a1fb-4f0f-89e5-a5ae3660faabi︠
%md
## Códigos cíclicos
Un código linear sobre $\mathbb{F}_q$ de lonxitude $n$ dise que é cíclico se o desprazamento (cíclico) á dereita unha posición das compoñentes de calquera palabra do código resulta noutra palabra do código, é dicir, se $c_0c_2c_3\cdots c_{n-1} \in \mathcal{C}$, entón $c_{n-1}c_0c_1\cdots c_{n-2} \in \mathcal{C}$.

Se identificamos a palabra $c_0c_1\cdots c_n \in \mathcal{C}$ co polinomio $c(x) = c_0+c_1x+\cdots +c_{n-1}x^{n-1} \in \mathbb{F}_q[x]$, entón o desprazamento á dereita toma a forma do polinomio $x\cdot c(x) \mod (x^n -1)$, ou simplemente de $x\cdot c(x)$ se consideramos $c(x) \in \mathbb{F}_q[x]_{\big/(x^n-1)}$.

Pola definición de código linear, se $a(x)$ e $b(x)$ son os polinomios de dúas palabras de $\mathcal{C}$, entón $a(x)+b(x)$ é o polinomio de outra palabra de $\mathcal{C}$. De igual modo, polo ser $\mathcal{C}$ cíclico, se $c(x)$ é o polinomio dunha palabra de $\mathcal{C}$ e $p(x)$ é calquera polinomio de $\mathbb{F}_q[x]$, entón $p(x) \cdot c(x) \mod (x^n -1)$ é unha palabra de $\mathcal{C}$, pois $p(x) \cdot c(x) \mod (x^n -1) = \sum p_ix^i \cdot c(x) \mod(x_n-1)$ é suma  de múltiplos de $x^i \cdot c(x) \mod (x^n-1)$, polo tanto palabras de $\mathcal{C}$.

Podemos entón identificar códigos lineares cíclicos de lonxitude $n$ sobre $\mathbb{F}_q$ con ideais de polinomios en $\mathbb{F}_q[x]_{\big/(x^n-1)}$. O algoritmo da división de polinomios garante que existe un polinomio mónico $g(x)$ de menor grao que xenera o ideal. A este polinomio $g(x)$ chámaselle **polinomio xenerador** de $\mathcal{C}$.


Se $g(x)$ é o polinomio xenerador de $\mathcal{C}$, entón $g(x)$ divide a todos os polinomios de palabras do códido e, se $g(x)$ ten grao $n-k$, a matriz con filas $g(x), x^{}g(x),x^{2} g(x) \dots ,x^{k-1} g(x)$, como polinomios en $\mathbb{F}_q[x]$ con grao < $n$,

$$\left(\begin{array}{c}
g(x) \\
x\ g(x) \\
x^2\ g(x)\\
\vdots \\
x^{k-1}\ g(x)
\end{array}\right)$$
ten rango $k$ e é unha **matriz xeneradora** para $\mathcal{C}$.

Hai dúas matrices de control interesantes. A primeira delas usa o feito de que, dado que $0$ está no código, e $0 = x^n-1$ en $\mathbb{F}[x]_{\big/(x^n-1)}$, entón o polinomio xenerador $g(x)$ divide a $x^n-1$. Se $x^n-1 = g(x)\cdot h(x)$, a $h(x)$ chámaselle **polinomio de control** do código $\mathcal{C}$. O polinomio $h_0^{-1}x^{k}h\left(\displaystyle\frac{1}{x}\right)$ é o polinomio xenerador de $\mathcal{C}^{\perp}$, e a matriz
$$H= \left(\begin{array}{llllllll}
h_k & h_{k-1} & \cdots &  h_0 & 0 & 0 & \cdots & 0\\
0 & h_k & h_{k-1} & \cdots &  h_0 & 0 & \cdots & 0\\
0 & 0 &h_k & h_{k-1} & \cdots &  h_0  & \cdots & 0\\
& & & & \cdots & & & \\
0 & 0& \cdots& 0 &h_k & h_{k-1} & \cdots &  h_0
\end{array}\right)$$

é unha matriz de control para $\mathcal{C}$.
︡921d71db-5161-4eb4-a7af-796970afebe2︡{"done":true,"md":"## Códigos cíclicos\nUn código linear sobre $\\mathbb{F}_q$ de lonxitude $n$ dise que é cíclico se o desprazamento (cíclico) á dereita unha posición das compoñentes de calquera palabra do código resulta noutra palabra do código, é dicir, se $c_0c_2c_3\\cdots c_{n-1} \\in \\mathcal{C}$, entón $c_{n-1}c_0c_1\\cdots c_{n-2} \\in \\mathcal{C}$.\n\nSe identificamos a palabra $c_0c_1\\cdots c_n \\in \\mathcal{C}$ co polinomio $c(x) = c_0+c_1x+\\cdots +c_{n-1}x^{n-1} \\in \\mathbb{F}_q[x]$, entón o desprazamento á dereita toma a forma do polinomio $x\\cdot c(x) \\mod (x^n -1)$, ou simplemente de $x\\cdot c(x)$ se consideramos $c(x) \\in \\mathbb{F}_q[x]_{\\big/(x^n-1)}$.\n\nPola definición de código linear, se $a(x)$ e $b(x)$ son os polinomios de dúas palabras de $\\mathcal{C}$, entón $a(x)+b(x)$ é o polinomio de outra palabra de $\\mathcal{C}$. De igual modo, polo ser $\\mathcal{C}$ cíclico, se $c(x)$ é o polinomio dunha palabra de $\\mathcal{C}$ e $p(x)$ é calquera polinomio de $\\mathbb{F}_q[x]$, entón $p(x) \\cdot c(x) \\mod (x^n -1)$ é unha palabra de $\\mathcal{C}$, pois $p(x) \\cdot c(x) \\mod (x^n -1) = \\sum p_ix^i \\cdot c(x) \\mod(x_n-1)$ é suma  de múltiplos de $x^i \\cdot c(x) \\mod (x^n-1)$, polo tanto palabras de $\\mathcal{C}$.\n\nPodemos entón identificar códigos lineares cíclicos de lonxitude $n$ sobre $\\mathbb{F}_q$ con ideais de polinomios en $\\mathbb{F}_q[x]_{\\big/(x^n-1)}$. O algoritmo da división de polinomios garante que existe un polinomio mónico $g(x)$ de menor grao que xenera o ideal. A este polinomio $g(x)$ chámaselle **polinomio xenerador** de $\\mathcal{C}$.\n\n\nSe $g(x)$ é o polinomio xenerador de $\\mathcal{C}$, entón $g(x)$ divide a todos os polinomios de palabras do códido e, se $g(x)$ ten grao $n-k$, a matriz con filas $g(x), x^{}g(x),x^{2} g(x) \\dots ,x^{k-1} g(x)$, como polinomios en $\\mathbb{F}_q[x]$ con grao < $n$,\n\n$$\\left(\\begin{array}{c}\ng(x) \\\\\nx\\ g(x) \\\\\nx^2\\ g(x)\\\\\n\\vdots \\\\\nx^{k-1}\\ g(x)\n\\end{array}\\right)$$\nten rango $k$ e é unha **matriz xeneradora** para $\\mathcal{C}$.\n\nHai dúas matrices de control interesantes. A primeira delas usa o feito de que, dado que $0$ está no código, e $0 = x^n-1$ en $\\mathbb{F}[x]_{\\big/(x^n-1)}$, entón o polinomio xenerador $g(x)$ divide a $x^n-1$. Se $x^n-1 = g(x)\\cdot h(x)$, a $h(x)$ chámaselle **polinomio de control** do código $\\mathcal{C}$. O polinomio $h_0^{-1}x^{k}h\\left(\\displaystyle\\frac{1}{x}\\right)$ é o polinomio xenerador de $\\mathcal{C}^{\\perp}$, e a matriz\n$$H= \\left(\\begin{array}{llllllll}\nh_k & h_{k-1} & \\cdots &  h_0 & 0 & 0 & \\cdots & 0\\\\\n0 & h_k & h_{k-1} & \\cdots &  h_0 & 0 & \\cdots & 0\\\\\n0 & 0 &h_k & h_{k-1} & \\cdots &  h_0  & \\cdots & 0\\\\\n& & & & \\cdots & & & \\\\\n0 & 0& \\cdots& 0 &h_k & h_{k-1} & \\cdots &  h_0\n\\end{array}\\right)$$\n\né unha matriz de control para $\\mathcal{C}$."}
︠4e65a68f-3a88-49a0-83bd-43ffcd8813cbs︠
def G(pol,q,n):                                           # pol = polinomio xenerador, q = aridade, n = lonxitude
    R = GF(q)[x]                                          # anel de polinomios sobre GF(q)
    mod = R(x^n-1)                                        # convertimos x^n - 1 en polinomio de R
    g = R(pol)                                            # convertimos a expresión simbólica de pol en polinomio de R
    if not g.divides(mod):                                # comprobamos se pol serve como polinomio xenerador
        print (pol, 'non é polinomio xenerador de ningún código ciclico de lonxitude', n, 'sobre GF(',q,')')
        return
    k = n - g.degree()
    G = []
    p = g
    for i in range(k):
        Fi = p.coefficients(sparse=False)+[0]*(k-1-i)     # completamos ata n con 0's   (se poñemos sparse=True, omite os coeficientes nulos)
        #p.padded_list(n)                                 # sería unha alternativa á liña anterior
        G.append(Fi)
        p *= R(x)                                         # multiplicaos f polo polinomio x
    return matrix(GF(q),G)
︡9d89e98e-28fd-4e8f-8970-d27f2e7fedd4︡{"done":true}
︠802ec72d-8b4a-4d4f-be8f-4e44473aeeaes︠
G(1+x^2+x^3,2,7)
︡80644aaa-17f8-481d-9d47-c46cfafd4df4︡{"stdout":"[1 0 1 1 0 0 0]\n[0 1 0 1 1 0 0]\n[0 0 1 0 1 1 0]\n[0 0 0 1 0 1 1]"}︡{"stdout":"\n"}︡{"done":true}
︠fdc7f85c-ecf8-4810-819a-717c0a57c0d4s︠
def H1(pol,q,n):   # pol = polinomio xenerador, q = aridade, n = lonxitude
    R = GF(q)[x]                                          # anel de polinomios sobre GF(q)
    mod = R(x^n-1)                                        # convertimos x^n - 1 en polinomio de R
    g = R(pol)                                            # convertimos a expresión simbólica de pol en polinomio de R
    if not g.divides(mod):                                # comprobamos se pol serve como polinomio xenerador
        print (pol, 'non é polinomio xenerador de ningún código ciclico de lonxitude', n, 'sobre GF(',q,')')
        return
    h = R(mod/g)                                          # convertimos en polinomio de F o cociente m/p. Sen isto, m/p estaría no anel de fraccións
    h0 = h.substitute(x=0)                                # termo independente de h
    hr = h.reverse()/h0                                   # polinomio cos termos invertidos mónico
    k = n - g.degree()
    H = []
    f = hr
    for i in range(n-k):
        di = f.degree()
        Fi = f.coefficients(sparse=False)+[0]*(n-(di+1))  # en vez de f.coefficients(sparse=False), pódese usar f.list(), máis curto!
        H.append(Fi)
        f *= R(x)
    return matrix(GF(q),H)
︡0400450a-780c-4068-949a-6dd741675dc7︡{"done":true}
︠70f9d4b2-ffa1-481c-87cb-85337a5ca1a2s︠
H1(1+x^2+x^4,3,7)
︡f2f4ae3a-ba64-45b7-b297-c28349dcfae8︡{"stdout":"x^4 + x^2 + 1 non é polinomio xenerador de ningún código ciclico de lonxitude 7 sobre GF( 3 )\n"}︡{"done":true}
︠416d9687-9b3d-448a-ad95-54e83179a809s︠
H1(1+x^2+x^4,2,7)
︡1ecad8aa-7786-4a80-ad93-0f371aa3d4e7︡{"stdout":"x^4 + x^2 + 1 non é polinomio xenerador de ningún código ciclico de lonxitude 7 sobre GF( 2 )\n"}︡{"done":true}
︠84ff0fa2-035e-46f3-94a4-fd04735182c5s︠
H1(1+x^2+x^3,2,7)
︡3ba433b3-e92a-4ffd-be10-21c31259cf8d︡{"stdout":"[1 1 1 0 1 0 0]\n[0 1 1 1 0 1 0]\n[0 0 1 1 1 0 1]\n"}︡{"done":true}
︠30b2f08f-2c7e-46c8-bc38-32180bd2517di︠
%md
Podemos comprobar que $G$ e $H_1$ son ortogonais
︡5eb3cb01-f2b5-46b2-bdde-0b18999c312c︡{"done":true,"md":"Podemos comprobar que $G$ e $H_1$ son ortogonais"}
︠97710a76-3b0d-43f4-95a4-4cc5e8643937s︠
G(1+x^2+x^3,2,7)*H1(1+x^2+x^3,2,7).transpose()
︡fc93fa39-6d75-4b51-a37d-75489e3aeb59︡{"stdout":"[0 0 0]\n[0 0 0]\n[0 0 0]\n[0 0 0]\n"}︡{"done":true}
︠273c51c7-3e28-47a5-913b-4ccbad3415c4i︠
%md
Lembremos que había outra matriz xeneradora  do codigo dual en forma estándar, aquela con $n$ columnas formadas por $x^i \mod g(x)$, sendo $g(x)$ o polonomio xenerador do código $\mathcal{C}$

$$H^t = \left(\begin{array}{c}
x^0 \mod g(x) \\
x^1 \mod g(x) \\
x^2 \mod g(x)\\
\vdots \\
x^{n-1} \mod  g(x)
\end{array}\right)$$

con respecto da que o síndrome da palabra $a = a_0a_1a_2\cdots a_{n-1}$, $s = a \cdot H^t$, era a palabra de lonxitude $n-k$ correspondente ó polinomio $s(x) = a(x) \mod g(x)$, que é de grao $< gr (g(x)) = n-k$.
︡c143d0f6-3165-465c-a094-fb6fe28b80ea︡{"done":true,"md":"Lembremos que había outra matriz xeneradora  do codigo dual en forma estándar, aquela con $n$ columnas formadas por $x^i \\mod g(x)$, sendo $g(x)$ o polonomio xenerador do código $\\mathcal{C}$\n\n$$H^t = \\left(\\begin{array}{c}\nx^0 \\mod g(x) \\\\\nx^1 \\mod g(x) \\\\\nx^2 \\mod g(x)\\\\\n\\vdots \\\\\nx^{n-1} \\mod  g(x)\n\\end{array}\\right)$$\n\ncon respecto da que o síndrome da palabra $a = a_0a_1a_2\\cdots a_{n-1}$, $s = a \\cdot H^t$, era a palabra de lonxitude $n-k$ correspondente ó polinomio $s(x) = a(x) \\mod g(x)$, que é de grao $< gr (g(x)) = n-k$."}
︠bc754dfe-fbc6-461e-93c1-ad9a14137e1bs︠
def H(pol,q,n):                                              # pol = polinomio xenerador, q = aridade, n = lonxitude
    R = GF(q)[x]                                             # anel de polinomios sobre GF(q)
    g = R(pol)                                               # convertimos a expresión simbólica en polinomio de R
    if not g.divides(R(x^n-1)):                              # comprobamos se pol serve como polinomio xenerador
        print (pol, 'non é polinomio xenerador de ningún código ciclico de lonxitude', n, 'sobre GF(',q,')')
        return
    k = n - g.degree()
    Ht = []
    for i in range(n):
        fi = R(x^i).mod(g)                                   # convertimos x^i en polinomio de R
        gi = fi.degree()
        Fi = fi.coefficients(sparse=False)+[0]*(n-k-(gi+1))  # completamos ata n-k con ceros
        Ht.append(Fi)
    return matrix(GF(q),Ht).transpose()
︡f81c70f0-8417-4030-9a5c-dfb590333e0e︡{"done":true}
︠5f536522-d965-466e-be26-816245071b0cs︠
H(1+x^2+x^3,2,7)
︡3419e7c0-09f0-4ec5-a95b-f9e5442dc53b︡{"stdout":"[1 0 0 1 1 1 0]\n[0 1 0 0 1 1 1]\n[0 0 1 1 1 0 1]\n"}︡{"done":true}
︠b4a52a91-b11f-4855-8de4-e0680aed6064i︠
%md
#### Exemplo de descodificación
Sexa $\mathcal{C}$ o código cíclico binario $[15,9]$ con polinomio xeneradosr $g(x)=1+x^4+x^6+x^7+x^8$.

- Determinar matrices xeneradoras e de control.
- Determinar a partir da matriz de control que a distancia mínima é $d=5$.
- Se se recibe a palabra $a(x) = 110011101100010 = 1+x+x^4+x^5+x^6+x^8+x^9+x^{13}$, calcular os síndromes $s_i(x)$ das palabras $x^ia(x)$ ata que $w(s_i(x))\le \left \lfloor \displaystyle \frac{d-1}{2}\right \rfloor = 2$

︡a4297f44-be84-47f2-affb-0d8319a21a77︡{"done":true,"md":"#### Exemplo de descodificación\nSexa $\\mathcal{C}$ o código cíclico binario $[15,9]$ con polinomio xeneradosr $g(x)=1+x^4+x^6+x^7+x^8$.\n\n- Determinar matrices xeneradoras e de control.\n- Determinar a partir da matriz de control que a distancia mínima é $d=5$.\n- Se se recibe a palabra $a(x) = 110011101100010 = 1+x+x^4+x^5+x^6+x^8+x^9+x^{13}$, calcular os síndromes $s_i(x)$ das palabras $x^ia(x)$ ata que $w(s_i(x))\\le \\left \\lfloor \\displaystyle \\frac{d-1}{2}\\right \\rfloor = 2$"}
︠6cba6b86-803d-4261-ad27-fd78d1c6190es︠
px = x^8 + x^7 + x^6 + x^4 + 1
palabra = x^13 + x^9 + x^8 + x^6 + x^5 + x^4 + x + 1
lx = 15
dm = 5
q = 2
R = GF(2)[x]
︡2a8ef4ee-a8f7-44fe-a732-33e09d02b49e︡{"done":true}
︠50e38240-8413-438d-a6cb-317c3a17f872s︠
G(px,q,lx)
︡aa7b62d3-243d-41b6-89fe-72c14bd7eea0︡{"stdout":"[1 0 0 0 1 0 1 1 1 0 0 0 0 0 0]\n[0 1 0 0 0 1 0 1 1 1 0 0 0 0 0]\n[0 0 1 0 0 0 1 0 1 1 1 0 0 0 0]\n[0 0 0 1 0 0 0 1 0 1 1 1 0 0 0]\n[0 0 0 0 1 0 0 0 1 0 1 1 1 0 0]\n[0 0 0 0 0 1 0 0 0 1 0 1 1 1 0]\n[0 0 0 0 0 0 1 0 0 0 1 0 1 1 1]\n"}︡{"done":true}
︠9422174b-058f-4715-a999-d70beab2e30as︠
H1(px,q,lx)
︡944fc5db-8936-4b82-9a56-0ef4cd777aaa︡{"stdout":"[1 1 0 1 0 0 0 1 0 0 0 0 0 0 0]\n[0 1 1 0 1 0 0 0 1 0 0 0 0 0 0]\n[0 0 1 1 0 1 0 0 0 1 0 0 0 0 0]\n[0 0 0 1 1 0 1 0 0 0 1 0 0 0 0]\n[0 0 0 0 1 1 0 1 0 0 0 1 0 0 0]\n[0 0 0 0 0 1 1 0 1 0 0 0 1 0 0]\n[0 0 0 0 0 0 1 1 0 1 0 0 0 1 0]\n[0 0 0 0 0 0 0 1 1 0 1 0 0 0 1]\n"}︡{"done":true}
︠e9897f1a-b4e1-46ac-baaf-4fbf4004d9d4i︠
%md
Cos datos de antes, iremos calculando os sucesivos síndromes de $x^i a$ e pararemos cando o seu peso entre dentro da capacidade correctora do código.
︡76fa3df8-20ea-4fe7-8156-c4a346cc03e2︡{"done":true,"md":"Cos datos de antes, iremos calculando os sucesivos síndromes de $x^i a$ e pararemos cando o seu peso entre dentro da capacidade correctora do código."}
︠b8d0669d-2c74-4924-ac12-dccaf1cba6f6s︠
a = R(palabra)
g = R(px)
sa = a.mod(g)
w = sa.hamming_weight()
i = 0
print ('i = ',i, ' :   ',sa)
while w > floor((dm-1)/2):
    a = (R(x)*a).mod(R(x^15-1))
    sa = a.mod(g)
    w = sa.hamming_weight()
    i += 1
    print ('i = ',i, ' :   ',sa)
︡e598f47b-d515-4862-b4ac-f7e4898c91b8︡{"stdout":"i =  0  :    x^7 + x^5 + x^2 + 1\n"}︡{"stdout":"i =  1  :    x^7 + x^4 + x^3 + x + 1\ni =  2  :    x^7 + x^6 + x^5 + x^2 + x + 1\ni =  3  :    x^4 + x^3 + x^2 + x + 1\ni =  4  :    x^5 + x^4 + x^3 + x^2 + x\ni =  5  :    x^6 + x^5 + x^4 + x^3 + x^2\ni =  6  :    x^7 + x^6 + x^5 + x^4 + x^3\ni =  7  :    x^5 + 1\n"}︡{"done":true}
︠7c9f3e1d-3f76-43b2-8fea-06e769044692i︠
%md
- Vemos que sucede pola primeira ven en $i=7$ e que $s_7(x) = x^5 +1$.
- descodificar $a(x)$ como $a(x) - x^{15-7}s_7(x)\mod{(x^{15}-1)} = a(x) - x^8-x^{13} = 1+x+x^4+x^5+x^6+x^9$


Podemos construír o algoritmo para descodificación seguinte:
︡921ec7ca-1877-48bb-b836-32d25a93711f︡{"done":true,"md":"- Vemos que sucede pola primeira ven en $i=7$ e que $s_7(x) = x^5 +1$.\n- descodificar $a(x)$ como $a(x) - x^{15-7}s_7(x)\\mod{(x^{15}-1)} = a(x) - x^8-x^{13} = 1+x+x^4+x^5+x^6+x^9$\n\n\nPodemos construír o algoritmo para descodificación seguinte:"}
︠a1bfeed0-9931-42b8-8712-7f94f17c2878s︠
def des(pal,pol,q,n,d):
    R = GF(q)[x]
    m = R(x^n-1)
    g = R(pol)
    if not g.divides(m):                               # comprobamos se pol serve como polinomio xenerador
        print (pol, 'non xenera un código ciclico de lonxitude', n, 'sobre GF(',q,')')
        return
    a = R(pal)
    for i in range(n):
        ai = R(x^i)*a
        si = ai.mod(g)                                 # observar (p mod m) mod g  = p mod g, porque g divide a m. Por iso, no paso anterior, non é preciso facer x^i*a mod m
        wi = si.hamming_weight()
        if wi <= floor((d-1)/2):                       # imos mirando os pesos dos sucesivos sindromes de x^i*a
            ei = si                                    # se algún cumpre a condición relativa ao número de erros, tomaríamos este síndrome como o erro ei de x^i*a
            e = (ei*R(x^(n-i))).mod(m)                 # desandamos os desprazamentos feitos cara á dereita e temos o erro de a
            return a - e                               # xa teríamos a palabra do código buscada
    print ('Ou hai mais de |_(d-1)/2_| erros ou están moi dispersos')
︡f0b1ad20-c696-4c73-8aa7-ba7dd39da5b3︡{"done":true}
︠753db142-e703-4f02-86b5-18dfb79d3c6bs︠
des(palabra,px,q,lx,dm)
︡cbff61e3-7ae2-424b-8560-6bb2fce3d415︡{"stdout":"x^9 + x^6 + x^5 + x^4 + x + 1\n"}︡{"done":true}
︠c719c190-9f65-49a3-9ed2-99729f05e35ci︠
%md
Vexamos outro exemplo
︡11156193-55d8-4f0c-b1a7-0dd2fa43a08d︡{"done":true,"md":"Vexamos outro exemplo"}
︠093385c4-ef73-4721-9f9d-baf04c45c197s︠
palabra3 = R(x^3*palabra).mod(R(x^15-1))
palabra3
︡57c0a1c3-208b-40c7-a66d-cf337d225738︡{"stdout":"x^12 + x^11 + x^9 + x^8 + x^7 + x^4 + x^3 + x\n"}︡{"done":true}
︠df30e9be-abd8-4cfa-8946-ef2702d25bc5s︠
a = R(palabra3)
g = R(px)
sa = a.mod(g)
w = sa.hamming_weight()
i = 0
print ('i = ',i, ' :   ',sa)
while w > floor((dm-1)/2):
    a = (R(x)*a).mod(R(x^15-1))
    sa = a.mod(g)
    w = sa.hamming_weight()
    i += 1
    print ('i = ',i, ' :   ',sa)
︡6ca8a649-385c-4a03-abf0-67833bf7e21d︡{"stdout":"i =  0  :    x^4 + x^3 + x^2 + x + 1\n"}︡{"stdout":"i =  1  :    x^5 + x^4 + x^3 + x^2 + x\ni =  2  :    x^6 + x^5 + x^4 + x^3 + x^2\ni =  3  :    x^7 + x^6 + x^5 + x^4 + x^3\ni =  4  :    x^5 + 1\n"}︡{"done":true}
︠c5a1d71b-5b64-48d5-befd-d3be4bfbf459i︠
%md
Agora chegamos ata $x^4a$, con $e_4=x^5+1$, co que $e=x^{15-4}e_4 \mod{(x^{15} -1)}= x^{11}+x$
︡5211c304-083a-4f77-9c51-d726d633477d︡{"done":true,"md":"Agora chegamos ata $x^4a$, con $e_4=x^5+1$, co que $e=x^{15-4}e_4 \\mod{(x^{15} -1)}= x^{11}+x$"}
︠e37fe758-1944-4050-8eff-ee7cea463e9as︠
palabra3
des(palabra3,px,q,lx,dm)
︡e5ac6d2e-a582-462d-8962-6cebce6e64f9︡{"stdout":"x^12 + x^11 + x^9 + x^8 + x^7 + x^4 + x^3 + x\n"}︡{"stdout":"x^12 + x^9 + x^8 + x^7 + x^4 + x^3\n"}︡{"done":true}
︠90207a9d-320d-4f0d-a1fc-924297746811i︠
%md
#### Máis exemplos
A continuación, partiremos dunha palabar do código e sumarémoslle certos polinomios para forzar os erros en cantidade e posicións elixidas.
︡d8618962-c45d-4254-b7b7-94be31e1c453︡{"done":true,"md":"#### Máis exemplos\nA continuación, partiremos dunha palabar do código e sumarémoslle certos polinomios para forzar os erros en cantidade e posicións elixidas."}
︠f33bb3f3-d0c8-42a9-a3d0-587d3c0e600bs︠
c = x^9 + x^6 + x^5 + x^4 + x + 1            # palabra do código
pal_9     = c + (x^9)                        # exemplo de palabra recibida con 1 erro (no bit 10)
pal_1_3   = c + (x^1 + x^3)                  # exemplo de palabra recibida con 2 erros (nos bits 2 e 4)
pal_1_3_7 = c + (x^1 + x^3 + x^7)            # exemplo de palabra recibida con 3 erros
pal_1_2_3 = c + (x^1 + x^2 + x^3)            # exemplo de palabra recibida con 3 erros
︡e7473773-c010-403d-bd51-5a3f7dc67e45︡{"done":true}
︠9379280f-e254-4661-af24-ca9f24850747s︠
des(pal_9,px,2,15,5)                         # descodificación correcta
︡f5b92f8b-5905-4f95-bd54-07aed06e0a98︡{"stdout":"x^9 + x^6 + x^5 + x^4 + x + 1\n"}︡{"done":true}
︠f87fa5cd-1519-49a2-8446-9d9013b5a5d3s︠
des(pal_1_3,px,2,15,5)                       # descodificación correcta
︡b57ac2ad-48ea-47ed-9d3d-bb1b91cb589c︡{"stdout":"x^9 + x^6 + x^5 + x^4 + x + 1\n"}︡{"done":true}
︠310edd25-3df3-4835-a9c4-dd1b3d7b5638s︠
des(pal_1_3_7,px,2,15,5)                     # descodificación incompleta
︡d0cc0245-61bb-40cf-8873-40c0ffe5d38f︡{"stdout":"Ou hai mais de |_(d-1)/2_| erros ou están moi dispersos\n"}︡{"done":true}
︠826fcc0b-fb3a-489b-883b-759344455665s︠
des(pal_1_2_3,px,2,15,5)                     # descodificación INCORRECTA
︡4bf0376a-e209-4319-892a-b7a562f4363f︡{"stdout":"x^14 + x^10 + x^9 + x^6 + x^5 + x^4 + x^3 + x^2 + 1\n"}︡{"done":true}
︠69987514-8204-4ac0-8a05-09ea9a3f1d9fi︠
%md
No código do exemplo, calquera patrón de erro con 2 ou menos erros contén unha pila cíclica de 0's de lonxitude $\ge k = 15-8$. Por iso podemos afirmar que se descodifica correctamente calquera palabra con 2 ou menos erros.
︡98a6cb80-ac2c-4f8b-b4bc-d8d3569e4361︡{"done":true,"md":"No código do exemplo, calquera patrón de erro con 2 ou menos erros contén unha pila cíclica de 0's de lonxitude $\\ge k = 15-8$. Por iso podemos afirmar que se descodifica correctamente calquera palabra con 2 ou menos erros."}
︠5db6ded6-1272-471a-bf36-32a50a7bd8bds︠
C = R.ideal(px)                              # ideal xenerado por px en R, é dicir, o código cíclico
c = C.random_element()
a = R.random_element()
a

︡355808c5-0d25-41e7-a6d3-17de40452341︡{"stdout":"1\n"}︡{"done":true}
︠e14dca88-4f02-4e85-8881-bd03a808d2ae︠









