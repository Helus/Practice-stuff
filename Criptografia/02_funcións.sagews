︠9c6bfebe-28f3-4636-90cc-4379560c07eci︠
%html
<h2>
  Función para calcular a letra do NIF
</h2>


<p>Lembremos que é a letra que corresponde ao resto de dividir o número do DNI entre 23, segundo a lista seguinte:</p>

<table>
    <tr>
    <th>0</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th><th>10</th><th>11</th><th>12</th><th>13</th><th>14</th><th>15</th><th>16</th><th>17</th><th>18</th><th>19</th><th>20</th><th>21</th><th>22</th><tr>
    <tr>
    <td>T</td><td>R</td><td>W</td><td>A</td><td>G</td><td>M</td><td>Y</td><td>F</td><td>P</td><td>D</td><td>X</td><td>B</td><td>N</td><td>J</td><td>Z</td><td>S</td><td>Q</td><td>V</td><td>H</td><td>L</td><td>C</td><td>K</td><td>E</td><tr>
</table>
<p>
    Simplemente teclearemos a lista das letras e asociarémola á variable <b>letras</b> e recuperaremos a a posición correspondente ao módulo.
</p>

<p>
    Dado que as cadeas de caracteres (*strings*) se comportan prácticamente coma listas, usaremos a cadea <b>'TRWAGMYFPDXBNJZSQVHLCKE'</b>
</p>
︡911d70dc-7c22-4c0b-a61f-1483a4a2ddc4︡{"done":true,"html":"<h2>\n  Función para calcular a letra do NIF  \n</h2>\n\n\n<p>Lembremos que é a letra que corresponde ao resto de dividir o número do DNI entre 23, segundo a lista seguinte:</p>\n\n<table>\n    <tr>\n    <th>0</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th><th>10</th><th>11</th><th>12</th><th>13</th><th>14</th><th>15</th><th>16</th><th>17</th><th>18</th><th>19</th><th>20</th><th>21</th><th>22</th><tr>\n    <tr>\n    <td>T</td><td>R</td><td>W</td><td>A</td><td>G</td><td>M</td><td>Y</td><td>F</td><td>P</td><td>D</td><td>X</td><td>B</td><td>N</td><td>J</td><td>Z</td><td>S</td><td>Q</td><td>V</td><td>H</td><td>L</td><td>C</td><td>K</td><td>E</td><tr>\n</table>\n<p>\n    Simplemente teclearemos a lista das letras e asociarémola á variable <b>letras</b> e recuperaremos a a posición correspondente ao módulo.\n</p>\n\n<p>\n    Dado que as cadeas de caracteres (*strings*) se comportan prácticamente coma listas, usaremos a cadea <b>'TRWAGMYFPDXBNJZSQVHLCKE'</b>\n</p>"}
︠dcdefa5a-f5ac-4637-a3f8-16f9362da716s︠
letras = 'TRWAGMYFPDXBNJZSQVHLCKE'
letras[4]                            # a 5ª letra (lembremos que a 1ª é a de posición 0)
︡3dee7937-c889-49bb-bf9b-6f9207626f18︡{"stdout":"'G'\n"}︡{"done":true}
︠ea9969e8-bcec-44e8-87a8-5a2e545c4bdcs︠
def lnif(n):                        # ver menú > Program para un exemplo xenérico de función en Sagemath
    return letras[n%23]             # n%23 é o resto de dividir n entre 23
︡5564b31f-efdf-4f7d-be10-0a4b8973d1da︡{"done":true}
︠78fdb065-dcbf-4f04-9ba6-8de999d3fae3︠
%md
## Función para corrixir un erro 
no código $\{(x_1,\dots,x_{10})\in \mathbb{Z}^{10}\mid (x_1,\dots,x_{10})\cdot(1,\dots,1)\equiv 0 \pmod {11} \ \ {\rm e}\ \ (x_1,\dots,x_{10})\cdot(1,2,\dots,10)\equiv 0 \pmod {11}\}$

Recibida unha lista $[x_1,\dots,x_{10}]$ e supoñendo que se cometeu un erro simple, fabricaremos a lista que corresponde ao número correcto de identificación.

︡8fbd602c-647f-45b4-9d42-d0e6f4485c87︡{"done":true,"md":"## Función para corrixir un erro \nno código $\\{(x_1,\\dots,x_{10})\\in \\mathbb{Z}^{10}\\mid (x_1,\\dots,x_{10})\\cdot(1,\\dots,1)\\equiv 0 \\pmod {11} \\ \\ {\\rm e}\\ \\ (x_1,\\dots,x_{10})\\cdot(1,2,\\dots,10)\\equiv 0 \\pmod {11}\\}$\n\nRecibida unha lista $[x_1,\\dots,x_{10}]$ e supoñendo que se cometeu un erro simple, fabricaremos a lista que corresponde ao número correcto de identificación."}
︠ee949fc4-83b2-4b14-a36e-3b50321a161fi︠
%md
Primeiro vermos como determinar os díxitos de control e fabricarmos un número de identificación correcto.

︡4ee166af-afa4-4981-a25d-1a4299930c27︡{"done":true,"md":"Primeiro vermos como determinar os díxitos de control e fabricarmos un número de identificación correcto."}
︠1a2051ea-f7e7-4996-8fa7-94de85cc284ds︠
def DC(L):
    v = vector(L)
    w1 = vector([mod(1,11) for i in range (8)])           # w1 é un vector en (Z_11)^8
    w2 = vector([mod(i+1,11) for i in range (8)])         # w2 é un vector en (Z_11)^8
    suma_1_1 = - v.dot_product(w1)                        # o resultado sae en Z_11
    suma_9_10 = - v.dot_product(w2)                       # o resultado sae en Z_11 
    x_10 = suma_9_10 - 9*suma_1_1
    x_9 = suma_1_1 - x_10
    return L + [x_9,x_10]
︡fe137610-5925-4168-aba4-64b825b87511︡{"done":true}
︠861b61f9-0048-4262-b63c-2a4afe77bb07s︠
DC([1,2,3,4,5,6,7,8])
︡b1747472-94ae-4b9f-ba77-5f008bbb35c4︡{"stdout":"[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]\n"}︡{"done":true}
︠93d6d505-9c9e-45c7-a806-1f17294a9f6ai︠
%md

Na práctica, **non** se usan números de idntificación pra os que resulten *díxitos de control* con dúas cifras, é dicir, 10. Pero non prestaremos atención a este feito, xa que damos os datos enforma de lista.
︡8bca221e-22a2-4d9d-8d69-d1fcc6c9b63d︡{"done":true,"md":"\nNa práctica, **non** se usan números de idntificación pra os que resulten *díxitos de control* con dúas cifras, é dicir, 10. Pero non prestaremos atención a este feito, xa que damos os datos enforma de lista."}
︠96b77e7d-0ee4-4d97-8da4-8e7c8cd98284i︠
%md
Agora construiremos un test para verificar un número de identificación é correcto
︡bd66debb-fd87-47f0-a872-1e372792ea21︡{"done":true,"md":"Agora construiremos un test para verificar un número de identificación é correcto"}
︠ffc1f622-ece4-4b80-9660-ae7e63a7f1c4s︠
def test(L):
    v = vector(L)
    w1 = vector([mod(1,11) for i in range (10)])           # w1 é un vector en (Z_11)^10
    w2 = vector([mod(i+1,11) for i in range (10)])         # w2 é un vector en (Z_11)^10
    t1 = v.dot_product(w1) == 0                            # a == o en Z_11 é o mesmo que a \equiv 0 \pmod {11}
    t2 = v.dot_product(w2) == 0
    return t1 and t2
︡34a7783c-cada-4eae-b897-3d117a30f120︡{"done":true}
︠298f1188-6c5d-488f-9ede-8b83293ac126s︠
test([1,2,3,4,5,6,7,8,9,10])
︡8b89dff8-3424-46a9-aef5-21d3d9e5742e︡{"stdout":"True\n"}︡{"done":true}
︠fa82733c-dc86-4b3e-ad36-200df5ace255i︠
%md
Pasamos agora á correción do número de identiciación, supoñendo que se cometeu un erro simple na súa transmisión.

Lembramos que se $(x_1,\dots,x_{10})\cdot(1,\dots,1)\equiv a \pmod {11}$ e $(x_1,\dots,x_{10})\cdot(1,2,\dots,10)\equiv b \pmod {11}$, entón $a$ é o valor do eero cometido nunha determinada posición $i$  (contadas de 1 a 10 !!!), polo que $i\cdot a \equiv b \pmod{11}$, e así $i = b\cdot a^{-1}$ en $\mathbb{Z}_{11}$.

Vai sen dicir, pero é obvio que tanto $a$ coma $b$ teñen que ser distintos de 0 se se cometeu un erro simple.
︡19c21508-0694-4601-9a14-2d6e192845f6︡{"done":true,"md":"Pasamos agora á correción do número de identiciación, supoñendo que se cometeu un erro simple na súa transmisión.\n\nLembramos que se $(x_1,\\dots,x_{10})\\cdot(1,\\dots,1)\\equiv a \\pmod {11}$ e $(x_1,\\dots,x_{10})\\cdot(1,2,\\dots,10)\\equiv b \\pmod {11}$, entón $a$ é o valor do eero cometido nunha determinada posición $i$  (contadas de 1 a 10 !!!), polo que $i\\cdot a \\equiv b \\pmod{11}$, e así $i = b\\cdot a^{-1}$ en $\\mathbb{Z}_{11}$.\n\nVai sen dicir, pero é obvio que tanto $a$ coma $b$ teñen que ser distintos de 0 se se cometeu un erro simple."}
︠35940aa7-0f25-46c2-bf5d-f817ae88d145s︠
def NIC(L):
    v = vector(L)
    w1 = vector([mod(1,11) for i in range (10)])    # vector de pesos en Z_11
    w2 = vector([mod(i+1,11) for i in range (10)])  # vector de pesos en Z_11
    a = v.dot_product(w1)
    b = v.dot_product(w2)
    if a*b == 0:                                    # test para sabermos se se cometeron erros
        if a+b == 0:                                # pasa os dous tests
            print (L,' é correcto')
            return
        else:                                       # só pasa un dos tests
            print ('Cometeuse máis dun erro')
            return
    i = b/a
    L[i-1] -= a
    return L 
    
︡cdf24595-b916-4e95-8f82-521a7010ee44︡{"done":true}
︠b6392a5a-66b1-4919-b58f-3287ffe56fbcs︠
NIC([0,1,2,3,8,5,6,7,8,9])
︡817bc361-2577-418e-8c92-280401e997ff︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'NIC' is not defined\n"}︡{"done":true}︡
︠3c8eb483-3fe8-4bba-8483-2b3e88fa091ds︠
NIC([0,1,0,3,8,5,6,7,8,9])
︡94b0c9d9-2aad-4dfa-81eb-34d8a7e0e766︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'NIC' is not defined\n"}︡{"done":true}︡
︠e5830cdc-5a1e-44bc-be43-6c3474cd6b45s︠
NIC([0,1,0,3,0,5,0,7,0,9])
︡a60271e0-2e45-4a83-8451-75aae73ab68f︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'NIC' is not defined\n"}︡{"done":true}︡
︠68d4f100-b105-4176-97d9-0ca1fc6f4b80s︠
NIC([7 for i in range(10)])
︡00a3e3ff-da11-4622-a89c-d63370258054︡{"stdout":"Cometeuse máis dun erro\n"}︡{"done":true}
︠cc0a5e00-4478-4474-8f1d-4d550890f8ees︠
DC([8 for i in range(8)])
︡a458c971-8757-4645-a800-c4a9e768cf5d︡{"stdout":"[8, 8, 8, 8, 8, 8, 8, 8, 0, 2]\n"}︡{"done":true}
︠f5b8d1a7-3bd2-4960-904c-ae4874f9ed69s︠

︡2660891e-2798-45f3-a63c-8485d7239028︡{"done":true}
︠1268fb66-b861-4757-b133-91e2d16138a5i︠
%md
### Algúns exemplos máis de códigos usados na clase

As cadeas de 5 e 4 bits que acabamos de constrír, definen ambas dúas códigos de tamaño 10, e foron usadas na clase para codificar os números do 0 ao 9.

Veremos outros exemplos de códigos, tamén da clase.
︡0c88e416-2fba-446d-bc3a-c601d85c095a︡{"done":true,"md":"### Algúns exemplos máis de códigos usados na clase\n\nAs cadeas de 5 e 4 bits que acabamos de constrír, definen ambas dúas códigos de tamaño 10, e foron usadas na clase para codificar os números do 0 ao 9.\n\nVeremos outros exemplos de códigos, tamén da clase."}
︠7a274607-c3c7-486d-967d-911bec3ab7d2i︠
%md
Definiremos unha función para determinar a paridade. Para elo contaremos cantas veces aparece '1' na cadea e faremos o módiulo
︡6c7b850a-6d86-4597-ae5e-84b9f405d688︡{"done":true,"md":"Definiremos unha función para determinar a paridade. Para elo contaremos cantas veces aparece '1' na cadea e faremos o módiulo"}
︠75cb8e71-e89b-4f83-94fb-66ade87fcdd7s︠
('001'.count('1')) % 2
('011'.count('1')) % 2
('00111'.count('1')) % 2

︡01e2ceff-ee70-4b42-82ab-0746635deb4c︡{"stdout":"1\n"}︡{"stdout":"0\n"}︡{"stdout":"1\n"}︡{"done":true}
︠d9262184-626a-4d7d-9001-c91183fc46ads︠
def bp(s):
    n = (s.count('1')) % 2
    return str(n)                    # usamos str(n) para convertir en cadea o número n
︡0b669836-b2f5-4c88-9ce9-f96caefccd51︡{"done":true}
︠e1b12821-93ae-466c-9e83-43296b065a64s︠
bp('0111')
bp('0101')
︡6962d9eb-249c-4ef4-89f2-17e97142cbbc︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'bp' is not defined\n"}︡{"done":true}︡
︠17d45776-0929-47a0-a6d9-72e6f40b72c8i︠
%md
Construimos agora o código binario (3,4), **C2**,  engadíndolle a cada palabra de **C1** o seu bit de paridade.
︡c939c4a5-602c-44da-8b31-68250d9bd461︡{"done":true,"md":"Construimos agora o código binario (3,4), **C2**,  engadíndolle a cada palabra de **C1** o seu bit de paridade."}
︠48aaea19-ab67-4b8d-8c8e-309ebc6e0f5cs︠
C1 = ['00','01','10','11']
︡75513cfe-0871-4665-a919-3857352f5c6b︡{"done":true}
︠1ddfa11a-8ff9-4fbc-a489-b7e199d53539s︠
C2 = [ p+bp(p) for p in C1 ]
C2
︡2772bc78-5f8d-4e13-9a55-d24b2f615047︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'C1' is not defined\n"}︡{"done":true}︡
︠c1ff5ae2-4da2-4111-9a37-f12f5798013di︠
%md
Finalmente, contruímos o código binario (5,4), **C3**, replicando os bits 3º e 2º
︡4543f1ed-f9c5-4d7b-a2ff-d4b6baafc49e︡{"done":true,"md":"Finalmente, contruímos o código binario (5,4), **C3**, replicando os bits 3º e 2º"}
︠a31d78d1-84d6-4540-a7a2-8bdf0a53ab40s︠
C3 = [c+c[2]+c[1] for c in C2]; C3
︡2b6f34cb-9d70-4b56-9941-a71549fd5e23︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'C2' is not defined\n"}︡{"done":true}︡
︠659a21e7-9246-43eb-9093-a8ef802165abi︠
%md
### Distancia de Hamming

Lembremos que é o numero de entradas en que se diferencian dúas listas (ou cadeas)
︡d5d6e85e-2136-435f-acb2-f2ed9ee2268a︡{"done":true,"md":"### Distancia de Hamming\n\nLembremos que é o numero de entradas en que se diferencian dúas listas (ou cadeas)"}
︠cdae1b3c-7255-4f32-a2df-bf52b8d6eec1s︠
def ham(L,M):                      # non facemos test de entrada, polo que hai que meter listas do mesmo tamaño.
    c = 0                          # comezamos co contador a 0.
    for i in range( len(L) ):
        if L[i] != M[i]:           # (tamén vale <>) e miramos se son distintas as correspondentes entradas.
            c += 1                 # (tamén vale c = c+1), aumentamos 1 ao contador cado sexan distintas.
    return c
︡3be1bcb1-4e8f-490f-b2a1-210f92cbb3f4︡{"done":true}
︠36d66c13-9a85-4043-bc96-c7845bcd1a77s︠
ham([1,2,3], [1,2,1])
︡2b4360c8-4880-44c9-938c-9bb599f49f53︡{"stdout":"1\n"}︡{"done":true}
︠06b9a5cd-d1d8-4679-a928-9e54932c20ebs︠
ham('10101','11001')
︡52bef37b-9595-423b-a7df-0923ee5d3655︡{"stdout":"2\n"}︡{"done":true}
︠a53125ab-9359-44ac-a745-3277016edb67i︠
%md
Propoñémonos agora construír a matriz de distancias de Hamming entre as palabras dun código.

Para elo, no menú **Linear** podemos ver como é a sintaxe para definir unha matriz. Os dous primeiros parámetros son o número de filas e o número de columnas, e o terceiro é unha lista de lonxitude o producto deste números. Se non lle damos a lista, crea a matriz con todas as entradas iguais a 0. Para recuperar unha entrada da matriz **M**, simplemente usamos **M[i, j]**.

︡4cad625d-f93f-4607-bdc9-7f1a48336972︡{"done":true,"md":"Propoñémonos agora construír a matriz de distancias de Hamming entre as palabras dun código.\n\nPara elo, no menú **Linear** podemos ver como é a sintaxe para definir unha matriz. Os dous primeiros parámetros son o número de filas e o número de columnas, e o terceiro é unha lista de lonxitude o producto deste números. Se non lle damos a lista, crea a matriz con todas as entradas iguais a 0. Para recuperar unha entrada da matriz **M**, simplemente usamos **M[i, j]**."}
︠db6a2d04-ce0d-4ee0-8a29-0497812aa24cs︠
A = matrix(4,4)      # partimos da matriz nula
︡2cb17ff6-ac03-4c1b-b7e0-c777a3c086db︡{"done":true}
︠04e30ab6-9951-4c49-bd3f-762af1826ce5s︠
A
︡c8006b12-4288-49f6-ba2b-c61da9bafa41︡{"stdout":"[0 0 0 0]\n[0 0 0 0]\n[0 0 0 0]\n[0 0 0 0]\n"}︡{"done":true}
︠cec4ac51-b834-4407-84e6-ca6f7970c69cs︠
for i in range(4):                    # e modificamos as súas entradas
    for j in range(4):
        A[i,j] = ham (C3[i],C3[j])
A
︡0deba18a-d9ae-4bb9-9feb-0889a22f29b9︡{"stdout":"[0 4 3 3]\n[4 0 3 3]\n[3 3 0 4]\n[3 3 4 0]\n"}︡{"done":true}
︠ef3834ea-3cbf-41f7-8e3b-4699e3177c26i︠
%md
Para determinar a distancia mínima do código, dado que **ham** é simétrica, podémonos restrinxir a **j < i** (lembrar que i e j comezan en 0)
︡30f48b38-faee-4b9f-8910-a83c1c2e81ea︡{"done":true,"md":"Para determinar a distancia mínima do código, dado que **ham** é simétrica, podémonos restrinxir a **j < i** (lembrar que i e j comezan en 0)"}
︠fe77a50e-7530-4238-b6e7-843b3c916eb7s︠
min([A[i,j] for i in range(4) for j in range(i)])
︡51f5f138-9825-41e0-b24e-da5e1ac61232︡{"stdout":"3\n"}︡{"done":true}
︠8538319a-c396-41c9-ba86-5302363f48e5i︠
%md
Dado que a distancia mínima é 3, non pode haber palabras a distancia 1 de dúas palabras do código, polo que unha RDDMI vai descodificar aquelas palabras recibidas que estean a distancia 0 ou 1 dunha palabra do código.

Para definir unha RDDMI, dada unha palabra **x** construímos a lista das súas distancias a palabras do código e determinamos a menor de todas elas. Despois miramos cantas veces se alcanza esta menor distancia e, se só se alcanza unha vez, miramos en que posición e recuperamos a palabra do código que ocupa esa posición. Se se alcanza máis dunha vez, declaramos **erro**.

Usaremos os métodos para lsitas **.count( )** e **.index( )**
︡a46af81d-38d8-4d48-b475-1ed3e4bc75fc︡{"done":true,"md":"Dado que a distancia mínima é 3, non pode haber palabras a distancia 1 de dúas palabras do código, polo que unha RDDMI vai descodificar aquelas palabras recibidas que estean a distancia 0 ou 1 dunha palabra do código.\n\nPara definir unha RDDMI, dada unha palabra **x** construímos a lista das súas distancias a palabras do código e determinamos a menor de todas elas. Despois miramos cantas veces se alcanza esta menor distancia e, se só se alcanza unha vez, miramos en que posición e recuperamos a palabra do código que ocupa esa posición. Se se alcanza máis dunha vez, declaramos **erro**.\n\nUsaremos os métodos para lsitas **.count( )** e **.index( )**"}
︠804c62b2-3b51-4222-a0b1-790a3999b5f3s︠
def RDDMI(x,C):
    dists = [ham(x,c) for c in C]
    d1 = min(dists)
    if dists.count(d1) == 1:
        return C[dists.index(d1)]
    else:
        return '*'
︡ecf6ca35-c70a-4fc2-b611-0409255dc59c︡{"done":true}
︠c907d865-0369-4a66-b3a8-c6ec023e1920s︠
RDDMI('00101',C3)
︡0be3fb27-9c77-42b1-b088-82ddf8a0f15f︡{"stdout":"'*'\n"}︡{"done":true}
︠b4863357-48fd-4df6-8266-d08e1fba4b32i︠
%md
Podemos tamén construír a táboa da **RDDMI**, para o código binario (5,4,3), **C3**.

Para elo, primeiro construímos $A^5$,  usando **Permutations( )** e despois facemos unha lista coa palabra **x**, as súas distancias a palabras do código (convertidas a cadeas con str) e a descodificación de **x** con RDDMI. Xuntamos todas estas cadeas intercalándolles espacios en branco e representamos mediante **print**.
︡20cb827f-c4a2-4a69-8d12-1deee51f8e97︡{"done":true,"md":"Podemos tamén construír a táboa da **RDDMI**, para o código binario (5,4,3), **C3**.\n\nPara elo, primeiro construímos $A^5$,  usando **Permutations( )** e despois facemos unha lista coa palabra **x**, as súas distancias a palabras do código (convertidas a cadeas con str) e a descodificación de **x** con RDDMI. Xuntamos todas estas cadeas intercalándolles espacios en branco e representamos mediante **print**."}
︠2843aa89-dacb-45e2-bdd7-c29d7c940e07s︠
print ('/'.join(['recib.']+C3+['descodif.']))
print ('--------------------------------------------')
A5= [''.join(p) for p in Permutations('01'*5,5)]
for x in A5:
    #[x] + [ham(x,c) for c in C3] + [RDDMI(x,C3)]
    print (x,[ham(x,c) for c in C3],RDDMI(x,C3))
︡a102ac9f-f2f8-4331-9439-3f3327cabd39︡{"stdout":"recib./00000/01111/10110/11001/descodif.\n"}︡{"stdout":"--------------------------------------------\n"}︡{"stdout":"00000 [0, 4, 3, 3] 00000\n00001 [1, 3, 4, 2] 00000\n00010 [1, 3, 2, 4] 00000\n00011 [2, 2, 3, 3] *\n00100 [1, 3, 2, 4] 00000\n00101 [2, 2, 3, 3] *\n00110 [2, 2, 1, 5] 10110\n00111 [3, 1, 2, 4] 01111\n01000 [1, 3, 4, 2] 00000\n01001 [2, 2, 5, 1] 11001\n01010 [2, 2, 3, 3] *\n01011 [3, 1, 4, 2] 01111\n01100 [2, 2, 3, 3] *\n01101 [3, 1, 4, 2] 01111\n01110 [3, 1, 2, 4] 01111\n01111 [4, 0, 3, 3] 01111\n10000 [1, 5, 2, 2] 00000\n10001 [2, 4, 3, 1] 11001\n10010 [2, 4, 1, 3] 10110\n10011 [3, 3, 2, 2] *\n10100 [2, 4, 1, 3] 10110\n10101 [3, 3, 2, 2] *\n10110 [3, 3, 0, 4] 10110\n10111 [4, 2, 1, 3] 10110\n11000 [2, 4, 3, 1] 11001\n11001 [3, 3, 4, 0] 11001\n11010 [3, 3, 2, 2] *\n11011 [4, 2, 3, 1] 11001\n11100 [3, 3, 2, 2] *\n11101 [4, 2, 3, 1] 11001\n11110 [4, 2, 1, 3] 10110\n11111 [5, 1, 2, 2] 01111\n"}︡{"done":true}
︠96d2c46d-747f-43b6-b623-45f7782a29dcs︠
table([['recibida']+C3+ ['descodificada']] +[[p] + [ham(c,p) for c in C3] + [RDDMI(p,C3)] for p in A5],header_row=True, align='center')


︡489b45da-4c19-4793-b6f6-60a0bd6f6544︡{"stdout":"  recibida   00000   01111   10110   11001   descodificada\n+----------+-------+-------+-------+-------+---------------+\n   00000       0       4       3       3         00000\n   00001       1       3       4       2         00000\n   00010       1       3       2       4         00000\n   00011       2       2       3       3           *\n   00100       1       3       2       4         00000\n   00101       2       2       3       3           *\n   00110       2       2       1       5         10110\n   00111       3       1       2       4         01111\n   01000       1       3       4       2         00000\n   01001       2       2       5       1         11001\n   01010       2       2       3       3           *\n   01011       3       1       4       2         01111\n   01100       2       2       3       3           *\n   01101       3       1       4       2         01111\n   01110       3       1       2       4         01111\n   01111       4       0       3       3         01111\n   10000       1       5       2       2         00000\n   10001       2       4       3       1         11001\n   10010       2       4       1       3         10110\n   10011       3       3       2       2           *\n   10100       2       4       1       3         10110\n   10101       3       3       2       2           *\n   10110       3       3       0       4         10110\n   10111       4       2       1       3         10110\n   11000       2       4       3       1         11001\n   11001       3       3       4       0         11001\n   11010       3       3       2       2           *\n   11011       4       2       3       1         11001\n   11100       3       3       2       2           *\n   11101       4       2       3       1         11001\n   11110       4       2       1       3         10110\n   11111       5       1       2       2         01111\n"}︡{"done":true}
︠d3e86e21-a5c3-421b-a7c2-eb8c02336791s︠
︡4ee9557f-ca8c-4626-b24b-eca179a4183c︡{"done":true}
︠9518b0dd-ba51-44d2-9dd8-c54464c53883s︠

︡5766ef9e-f157-4846-a514-2b8961a1fba1︡{"done":true}
︠9089fa14-62e0-408f-a46b-78be73d24851︠









