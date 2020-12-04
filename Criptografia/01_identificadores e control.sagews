︠10572990-da84-4480-8a8f-a36d8134f79di︠
%md
### Retomamos as listas da práctica anterior
︡852c91a5-7445-4fca-9f02-772cf3b40798︡{"done":true,"md":"### Retomamos as listas da práctica anterior"}
︠d94c3c80-fa6d-4ed7-8096-ac3302fc929ds︠
[1,2,3,4,6]                 # créanse usando [  ]
︡cbf0e5eb-f9c2-4caf-bb81-66d43eb16454︡{"stdout":"[1, 2, 3, 4, 6]"}︡{"stdout":"\n"}︡{"done":true}
︠186174e0-5d00-4b0b-b320-6b74cc1f7c75s︠
lista = [1,2,3,4,6]        # pódense asignar a variables
︡64bee45d-1658-4a45-86fa-cb18f2aba8f6︡{"done":true}
︠9c9b4e5d-93be-4180-9bce-e8a943676b60s︠
lista
︡922e3b2f-cdbf-4ee9-92be-4317c2d7098d︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'lista' is not defined\n"}︡{"done":true}︡
︠cda9d613-6f95-4c76-97b4-8c2dceba719es︠
len(lista)                  # con len( ) determinamos a cantidade de elementos que teñen
︡90ad0f60-7963-4d84-9230-1d727b0cb0be︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'lista' is not defined\n"}︡{"done":true}︡
︠9cddec4b-541a-4f3a-9b9f-0bc419b73a23s︠
lista[1]                    # para recuperar o elemento de posición k usamos  lista[k]
                            # ollo que as posicións numéranse comezando en 0
︡1d3f9146-34ce-4c07-ae58-5686ba31ccc2︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'lista' is not defined\n"}︡{"done":true}︡
︠656d9e5b-0263-42f8-924a-e8271c7301e1s︠
lista[8]                    # se pedimos unha posición que non existe temos mensaxe de erro (ver última liña)
︡87a703dc-301e-44ce-a4d8-0cfbe610ffb2︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'lista' is not defined\n"}︡{"done":true}︡
︠4fc86cf2-4300-43f9-ab94-9ad71d891217s︠
[4^i for i in lista]        # mediante o bucle "for", podemos crear listas a partir de outras creadas
                            # onde os elementos son función dos da lista previa
︡626191f3-3255-4758-b8e9-5d84fe3bc427︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'lista' is not defined\n"}︡{"done":true}︡
︠f9a24ee3-d2cc-4347-bd25-8f0704a15ba5s︠
['a' for i in lista]        # se a función é constante, naturalmente todos os elementos da nova lista son iguales
︡59bcdab8-e34a-4485-bffe-c8b815d77260︡{"stdout":"['a', 'a', 'a', 'a', 'a']\n"}︡{"done":true}
︠f75876a1-2759-4d38-8dce-4026c063c8fds︠

︡018d1487-a3c5-4dc4-addb-e1af592ede7d︡{"done":true}
︠df5626b0-6be0-422e-a8d3-a0694e8dad61︠
︡440e30b6-5d93-4f9d-9cf5-5cdedbcc08d3︡
︠6567e181-ef84-4ceb-82c4-5292387a3fc6i︠
%md
## EAN 13

Desenvolveremos o necesario para verificar se unha lista de 13 números representa un identificador EAN válido.

*a* **%** *n* devolve o resto de dividir *a* entre *n*. Comparar con **mod**(*a*,*n*).
**sum**(*lista*) calcula a suma dos elementos de *lista*, supoñendo que sexan números
︡ddc92dfe-5760-44f3-b01a-d8f257b3c36c︡{"done":true,"md":"## EAN 13\n\nDesenvolveremos o necesario para verificar se unha lista de 13 números representa un identificador EAN válido.\n\n*a* **%** *n* devolve o resto de dividir *a* entre *n*. Comparar con **mod**(*a*,*n*).\n**sum**(*lista*) calcula a suma dos elementos de *lista*, supoñendo que sexan números"}
︠8ca89aa8-b4b7-4591-acfe-f15ed7d618fds︠
5 % 3
mod(5,3)            # o resultado parece o mesmo
︡687e1fc3-81cc-46d2-8571-84f08a17aad8︡{"stdout":"2\n"}︡{"stdout":"2\n"}︡{"done":true}
︠fb1a9429-7c55-4ada-bdab-97c64b8d46d0s︠
5 % 3 + 8
mod(5,3) + 8        # pero non o é
︡bf25443f-b521-42a6-b56e-876a026f8ca0︡{"stdout":"10\n"}︡{"stdout":"1\n"}︡{"done":true}
︠916e12bd-2bbd-46ce-aea7-5fd5fd8d1946s︠
parent(5 % 3)        # o primeiro é un número enteiro
parent(mod(5,3))     # o segundo é un elemento de Z3
︡bcc49eba-6bb7-45f1-ae09-7b6941ef145c︡{"stdout":"Integer Ring\n"}︡{"stdout":"Ring of integers modulo 3\n"}︡{"done":true}
︠03e7edaf-aed3-44eb-9843-32f7050a57c8s︠

︡dd192356-29c9-4e59-9442-2a9012e14823︡{"done":true}
︠8e98ad60-6089-48f5-b09e-7d44f84144ecs︠
EAN = [9,7,8,1,1,0,8,4,4,7,2,3,2]      # exemplo de lista de 13 números entre 0 e 9 (corresponde a un ISBN)
︡6012654b-3667-4e17-8d91-9deb42711c82︡{"done":true}
︠a3887a67-f74f-481a-98ea-b2bce2717f63s︠
len(EAN)                               # comprobemos que en efcto son 13
︡c7447e2f-86f9-4a0d-99a4-5e00b2332d9e︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'EAN' is not defined\n"}︡{"done":true}︡
︠a6cf79d2-f744-4a44-99b6-aa3fc745fe12s︠
EAN[0]
EAN[1]
EAN[2]                                # son, respectivamente, o primeiro, o segundo e o terceiro díxito
                                      # atención á paridade, que muda debido a que as posicións na lista comezan en 0
                                      # é dicir, EAN[i]  é o (i+1)-ésimo díxito
︡6b84ab68-f973-48d0-9d69-bd1966d0f38f︡{"stdout":"9\n"}︡{"stdout":"7\n"}︡{"stdout":"8\n"}︡{"done":true}
︠857bd479-8c08-4194-a9c2-d768d42b0af2io︠
%md
Debido a iso, EAN[*k*] teremos que multiplicalo  por 1, se *k* é par, e por 3, se *k* é impar.

A análise de paridade podémola facer con *k* **%** 2, e, para convertir 0 en 1 e 1 en 3, podemos facer 3^0 e 3^1, ou 2\*0+1 e 2\*1+1
︡b04a05e2-d870-4e79-90f7-61739c3f281c︡{"done":true,"md":"Debido a iso, EAN[*k*] teremos que multiplicalo  por 1, se *k* é par, e por 3, se *k* é impar.\n\nA análise de paridade podémola facer con *k* **%** 2, e, para convertir 0 en 1 e 1 en 3, podemos facer 3^0 e 3^1, ou 2\\*0+1 e 2\\*1+1"}
︠7998166e-0674-4d63-b009-a2eed301f369s︠
EAN                                                 # para vermos os valores de EAN
︡5f05efa5-9c79-45f9-8614-ece0982b654e︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'EAN' is not defined\n"}︡{"done":true}︡
︠4ca14c3f-96da-4c87-b0ea-a948fca0da24s︠
[EAN[i]* 3^(i%2) for i in range(13)]                 # comparamos cos valores anteriores para verificarmos que funciona ben
︡7d2ddd6c-d448-4ce8-afef-82f450a61879︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 1, in <listcomp>\nNameError: name 'EAN' is not defined\n"}︡{"done":true}︡
︠f7d8c3fc-a3d5-44d1-aab2-cba001762409s︠
sum([EAN[i] * 3^(i%2) for i in range(13)] )          # a suma de todos estes productos
︡4babb79a-0672-477b-bf98-84bf8c27cfc3︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 1, in <listcomp>\nNameError: name 'EAN' is not defined\n"}︡{"done":true}︡
︠97623dbf-e9fd-4210-a445-2f00ce6ac350s︠
sum([EAN[i] * 3^(i%2) for i in range(13)])%10        # vemos o resto ao dividir por 10 é 0. É, polo tanto, un número EAN válido!
︡6f4d9db3-830e-4ded-b722-300fe0a377e5︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 1, in <listcomp>\nNameError: name 'EAN' is not defined\n"}︡{"done":true}︡
︠b6d465ba-97b5-4dec-be03-68ca0be12776i︠
%md
Fixemos unha aproximación académica ao problema, pero, xa comprendedes que hai aproximacións máis *profesionais*, é dicir, usando comandos xa definidos.

Por exemplo, podiamos convertir a lista nun vector mediante **vector**(*EAN*), fabricar o vector de pesos e facero seu producto escalar con **.dot_product()**.

Se, ademais, algunha da entradas (ou todas) son en Z10, o resultado do producto escalar xa estará en módulo 10
︡c4f7c70e-7ca1-4944-acd1-dbc6d047f644︡{"done":true,"md":"Fixemos unha aproximación académica ao problema, pero, xa comprendedes que hai aproximacións máis *profesionais*, é dicir, usando comandos xa definidos.\n\nPor exemplo, podiamos convertir a lista nun vector mediante **vector**(*EAN*), fabricar o vector de pesos e facero seu producto escalar con **.dot_product()**.\n\nSe, ademais, algunha da entradas (ou todas) son en Z10, o resultado do producto escalar xa estará en módulo 10"}
︠71b61b39-081d-4237-ace0-bacec9978c57s︠
ean = vector(EAN)
ean
parent(ean)
︡ace262f6-d949-4a6d-99b9-a8b7b1eef572︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'EAN' is not defined\n"}︡{"done":true}︡
︠2393d56a-98e7-419d-a9cb-2227c9afb291s︠
parent(ean)
ean=vector([3, 4, 5, 2, 3, 5, 5, 9, 1, 0, 0, 2, 7])
︡01b284bf-b2b0-4864-86d6-a9737965db8a︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'ean' is not defined\n"}︡{"done":true}︡
︠aada4620-eef8-4758-a1d7-1d986fc60c87s︠
w = vector([1,3,1,3,1,3,1,3,1,3,1,3,1])             # construído á man
w = vector([3^(i%2) for i in range(13)])            # a partir de la lista [0,1,2,..., 12]
w
︡6dcf5c0a-01a0-4634-b554-e85f1bec099d︡{"stdout":"(1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1)\n"}︡{"done":true}
︠58cc2b5c-b17d-498e-b7a4-669cbc95135ds︠
ean.dot_product(w)                                  # o producto escalar. Xa só faltaría facer o módulo 10
︡2d8d5b6f-a350-4be0-bb2d-9ff94aecd91d︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'ean' is not defined\n"}︡{"done":true}︡
︠6abb8a21-8114-4244-8cd2-c9af4ded5018s︠
w = vector([mod(3^(i%2),10) for i in range(13)])    # se forzamos a que os pesos estean en Z10
w
parent(w)                                           # o vector de pesos pasa a estar en (Z10)^13
︡01ce5da5-2269-4278-819b-b8603cd7f7ee︡{"stdout":"(1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1)\n"}︡{"stdout":"Ambient free module of rank 13 over Ring of integers modulo 10\n"}︡{"done":true}
︠8642ab5f-f34e-4f86-b8a7-6a779bf876e9s︠
ean.dot_product(w)                                  # o producto escalar xa sae en Z10
︡c90b0bc5-48e6-4ca0-bb60-3b2cd93a2a40︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'ean' is not defined\n"}︡{"done":true}︡
︠728fe204-83ae-4854-bc89-0ea6645ee7a0io︠
%md
## NIF
Para aplicar as mesmas ferramentas para verificación do *díxito* de control do NIF, o primeiro a facer é determinar o vector de pesos.

Para elo, lembramos que o *díxito* de control é (a letra que lle corresponde a) o resto de dividir o número do DNI entre 23.

Lembremos que o número do DNI ten, como máximo, 8 cifras, polo que se o damos en versión lista, poderíase obter mediante
︡30bd6545-63c4-4412-a11a-801e63b4a6d2︡{"done":true,"md":"## NIF\nPara aplicar as mesmas ferramentas para verificación do *díxito* de control do NIF, o primeiro a facer é determinar o vector de pesos.\n\nPara elo, lembramos que o *díxito* de control é (a letra que lle corresponde a) o resto de dividir o número do DNI entre 23.\n\nLembremos que o número do DNI ten, como máximo, 8 cifras, polo que se o damos en versión lista, poderíase obter mediante"}
︠c3c0d27e-325a-4514-a3fe-07991da6a599s︠
DNI = [1,2,3,4,5,6,7,8]
dni = sum([DNI[k]*10^(7-k) for k in range(8)])
dni
︡9c44ad6f-9295-43d8-9df4-42190c101d2a︡{"stdout":"12345678\n"}︡{"done":true}
︠163a9256-5bcc-4555-90d1-b9c977fa1936i︠
%md
É dicir, $$\rm dni = DNI[0]\cdot10^7 + \cdots + DNI[6]\cdot10^1 + DNI[7]\cdot 10^0$$

e, para calcular o seu módulo 23, podemos calcular previamente os módulos de $10^7, 10^6,\dots,10^1, 10^0$.
︡09e67f66-d5ac-409d-8454-bb29e34436cf︡{"done":true,"md":"É dicir, $$\\rm dni = DNI[0]\\cdot10^7 + \\cdots + DNI[6]\\cdot10^1 + DNI[7]\\cdot 10^0$$\n\ne, para calcular o seu módulo 23, podemos calcular previamente os módulos de $10^7, 10^6,\\dots,10^1, 10^0$."}
︠9e9986f3-c20e-4e80-b1e6-fb9b0b2235d3s︠
coef = [mod(10^(7-i),23) for i in range(8)]            # non confundir co vector de pesos!
coef
︡30ad4255-4e1c-48eb-9d40-07db9daae352︡{"stdout":"[14, 6, 19, 18, 11, 8, 10, 1]\n"}︡{"done":true}
︠eab9ab21-b5bb-49e7-a05d-f3e6deab2200s︠
dc = vector(DNI).dot_product(vector(coef))             # é o díxito de control que, naturalmente, ten que coincidir con dni%23
dc
︡7fe44e8e-b5ec-47ef-a57e-ffecea3513a0︡{"stdout":"14\n"}︡{"done":true}
︠cb4b116d-3567-4950-b1f9-f545dee9ba66s︠
NIF = DNI + [dc]             # sería un NIF correcto
NIF
︡515519ce-097f-4a8c-a68f-135eb9b1fb0b︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'DNI' is not defined\n"}︡{"done":true}︡
︠74e2007e-6724-40d0-8181-c8565c45d156io︠
%md

Dada unha lista de 9 números (o último é o que representa á letra), para verificarmos que se trata dun NIF correcto, o último díxito (o díxito de control) tería que ser multiplicado por -1 que, en $\mathbb{Z}_{23}$ é 22.

Polo tanto, o vector de pesos sería
︡03d9ef44-b34d-4d6a-91df-fedb87e1343a︡{"done":true,"md":"\nDada unha lista de 9 números (o último é o que representa á letra), para verificarmos que se trata dun NIF correcto, o último díxito (o díxito de control) tería que ser multiplicado por -1 que, en $\\mathbb{Z}_{23}$ é 22.\n\nPolo tanto, o vector de pesos sería"}
︠b0a35ecd-3ee6-4e2d-b4af-eea7b82c0de3︠

︡2743ec89-5419-4043-b452-3e64dff4808a︡
︠1ae33ab8-cbe7-48a8-aafc-f8036ab4b516s︠
w = vector(coef + [22])
w
︡d87b24a2-297b-4a72-bbc0-abf30599d07b︡{"stdout":"(14, 6, 19, 18, 11, 8, 10, 1, 22)\n"}︡{"done":true}
︠e710cf0a-7bb9-4ec3-ac54-adb0b055c813s︠
nif = vector(NIF)
︡6b3ecee5-f041-49c2-876b-730d40ee3fb5︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'NIF' is not defined\n"}︡{"done":true}︡
︠910b7ad8-d459-43c1-a778-922f5398a573s︠
nif.dot_product(w)                        # que cumpre a condición para ser un NIF correcto
︡4340fefb-c474-4cc8-a474-3a4170688b17︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'nif' is not defined\n"}︡{"done":true}︡
︠49010f12-71db-45b2-97aa-ad6a8a1450b1i︠
%md
Rematamos a práctica vendo outras versións dos bucles **for** e dos condicionais **if...then**  (ver o menú desplegable **control** para exemplos de uso)
︡256c872f-a8af-492c-aa66-3b4c7c675c69︡{"done":true,"md":"Rematamos a práctica vendo outras versións dos bucles **for** e dos condicionais **if...then**  (ver o menú desplegable **control** para exemplos de uso)"}
︠e363222d-8d54-4e63-b0af-ac839ee97d5bs︠
for i in range(5):
    print(i)
︡9a40879d-518b-4b7a-9d66-ccb3be06c2b4︡{"stdout":"0\n1\n2\n3\n4\n"}︡{"done":true}
︠b1c9b5a8-cbe8-4df9-a954-e066ffab2eeds︠
l = [1, 2, 5, 8, 10]
m = []
for i in l:
    m.append(i)
m
︡375fbe61-8da2-432f-8671-2123e848f63e︡{"stdout":"[1, 2, 5, 8, 10]\n"}︡{"done":true}
︠bd3ba21c-3a43-4762-8a14-6ffb72e3b32as︠
12345678%23
︡4cd34e31-4e66-4480-b150-5030db87f914︡{"stdout":"14\n"}︡{"done":true}
︠ff8a8c7d-916b-4de1-b321-e4840270058fss︠
nif=[1,2,3,4,5,6,7,8,14]
︡e93344c3-2d50-40d2-9302-08bcaa23ec27︡{"done":true}
︠8b93ad23-0efd-48a6-8f9e-5ad67f99f61as︠
1*10^7+2*10^6
︡368db6cc-ded5-4c7c-8207-2c10d07f3770︡{"stdout":"12000000\n"}︡{"done":true}
︠de4bb210-0e4b-43c2-8b42-fca28db1d1c8s︠
is_prime(4)
is_prime(7)
︡43ffdd94-32a3-4ac0-b3e0-9c85e1d91d4b︡{"stdout":"False\n"}︡{"stdout":"True\n"}︡{"done":true}
︠88cb6160-5e81-4629-81b9-c0472dc43d28s︠

lista=[]
for p in range(100):
    if is_prime(p):
        lista.append(p)
lista
︡af4a1f3d-673f-4938-934f-83ddaa1f4291︡{"stdout":"[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]\n"}︡{"done":true}
︠61aa3324-e499-47dd-97a2-f6aad6befb20s︠
[p for p in range(100) if is_prime(p)]                    # lista dos primos menores que 100
︡44455c42-72ec-4f7f-a5be-1455c4908b06︡{"stdout":"[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]\n"}︡{"done":true}
︠43c7f5a2-822b-47b7-b9a6-bd2968241c51s︠
L = [1,2,3,4,5,6]
︡516dcd51-59be-4b51-b4de-d4bb16a9eb35︡{"done":true}
︠453b68fd-28d9-4d67-8e8f-9a2a341f6a1es︠
L[2]
︡d47101f2-48c0-4afb-80c0-1b66643a3022︡{"stdout":"3\n"}︡{"done":true}
︠00734013-1431-4dd6-abcb-8ccfbb33dd2cs︠
L[2:4]
︡cdabef1c-ab45-4cbc-b282-1a4b52ee27d1︡{"stdout":"[3, 4]\n"}︡{"done":true}
︠5f334469-ac37-4924-8a5d-b10e11d25606s︠
L[:4]
︡c347c450-3f55-45f6-adaa-59a6e519491a︡{"stdout":"[1, 2, 3, 4]\n"}︡{"done":true}
︠1067fadf-1385-41de-90f3-4b4dbfb75e8es︠
L[3:]
︡c2686fca-9586-4524-989d-8d0e5c2f7795︡{"stdout":"[4, 5, 6]\n"}︡{"done":true}
︠c33a79cb-2462-4a09-9da6-6ad8cc0287c3s︠
[p for p in range(10000) if is_prime(p)][:100]         # lista dos 100 primeiros números primos
︡a6cae46b-22d6-4ba3-b3f1-ebf98e877e23︡{"stdout":"[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541]\n"}︡{"done":true}
︠05a4b667-d30c-462f-8266-c97e5d764f55s︠
[1,5..20]
︡aa73527e-6827-48d5-9d0c-de241a849a2e︡{"stdout":"[1, 5, 9, 13, 17]\n"}︡{"done":true}
︠94c65b88-de92-4539-b966-3c2a77b70942s︠
[1..20]
︡ac968771-461f-472e-acf6-2a5131934365︡{"stdout":"[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]\n"}︡{"done":true}
︠568d0017-0fe5-4693-9291-7f2b6e20bf65s︠
p=2
while p<100:
    p
    p = next_prime(p)
︡8af2bf72-8500-45d0-b64c-7ddcc5c27e8a︡{"stdout":"2\n3\n5\n7\n11\n13\n17\n19\n23\n29\n31\n37\n41\n43\n47\n53\n59\n61\n67\n71\n73\n79\n83\n89\n97\n"}︡{"done":true}
︠084cc45a-91bd-46f9-b61f-4396893bda44︠









