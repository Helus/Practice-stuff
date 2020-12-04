︠c1034f29-51de-49c1-b3b1-068b18edb6eei︠
%md
## Álxebra linear en SageMath

Pasamos revista ó indispensable de álxebra linear para practicar cos conceptos básicos dos códigos lineares
︡67ef2f8d-8c74-4f08-8b47-651a3e69d7a9︡{"done":true,"md":"## Álxebra linear en SageMath\n\nPasamos revista ó indispensable de álxebra linear para practicar cos conceptos básicos dos códigos lineares"}
︠14c54bce-d995-4aa7-9915-d2c19726938di︠
%md
### Matrices
Hai esencialmente dúas maneiras de declarar unha matriz
- como lista de listas de igual lonxitude (as filas)
- dando as dimensións e unha lista única formada polas entradas ordenadas por filas

︡0c5828cb-2428-497c-a8af-32bae2d1b261︡{"done":true,"md":"### Matrices\nHai esencialmente dúas maneiras de declarar unha matriz\n- como lista de listas de igual lonxitude (as filas)\n- dando as dimensións e unha lista única formada polas entradas ordenadas por filas"}
︠b33e2851-37b8-483e-b4d6-c4f0f1a21499so︠
matrix ([[1,2,3],[4,5,6]])
︡8ab76cbd-ba85-4be3-86d7-d6bf1fed1323︡{"stdout":"[1 2 3]\n[4 5 6]\n"}︡{"done":true}
︠35866e25-2d16-4b0f-95ff-c0fc47bc19d6o︠
matrix (2,3,[1,2,3,4,5,6])
matrix (3,2,[1,2,3,4,5,6])
︡cf805c20-de37-4e6f-a120-0ff665211c74︡{"stdout":"[1 2 3]\n[4 5 6]\n"}︡{"stdout":"[1 2]\n[3 4]\n[5 6]\n"}︡{"done":true}
︠774366c7-c32c-4fd9-9c13-858f56dbf25ci︠
%md
Para especificarlle o anel / corpo no que queremos que considere a matriz, usamos este como primeiro parámetro
︡c117a9c8-0800-4ce7-bdf6-a17832c79e36︡{"done":true,"md":"Para especificarlle o anel / corpo no que queremos que considere a matriz, usamos este como primeiro parámetro"}
︠f92b17ae-b603-4d0f-947b-6a567d7d7989s︠
A = matrix(GF(3),2,3,[1,2,4,4,1,2])           #
A
parent(A)
︡3a5c84ed-f198-4d90-be87-c91bee749b02︡{"stdout":"[1 2 1]\n[1 1 2]\n"}︡{"stdout":"Full MatrixSpace of 2 by 3 dense matrices over Finite Field of size 3\n"}︡{"done":true}
︠01701d5c-43d5-4cb3-8ad8-68d0e45efc16si︠
%md
Coma sempre, para sabermos que métodos hai dispoñibles para aplicarlle a un obxecto de tipo matriz, usamos **.** **<** **TAB** **>**

En particular, serán de uso

- **.dimensions()**
- **.rows()**
- **.columns()**
- **.row_space()**
- **.column_space()**
- **.transpose()**
- **.rank()**
- **.echelon_form()**
- **.kernel()**
︡1d1e9210-db0b-4847-b1cd-f193a08b8676︡{"done":true,"md":"Coma sempre, para sabermos que métodos hai dispoñibles para aplicarlle a un obxecto de tipo matriz, usamos **.** **<** **TAB** **>**\n\nEn particular, serán de uso\n\n- **.dimensions()**\n- **.rows()**\n- **.columns()**\n- **.row_space()**\n- **.column_space()**\n- **.transpose()**\n- **.rank()**\n- **.echelon_form()**\n- **.kernel()**"}
︠054a3995-5ea7-4674-affb-b58753309670s︠
A.dimensions()
︡6f994114-b7cb-479b-b0a9-5345c8b7f21e︡{"stdout":"(2, 3)\n"}︡{"done":true}
︠6e754f61-bea8-418e-91a5-3a5f05aa436ds︠
A.rows()
︡6c14550c-c409-480a-b972-c367f9c9aa18︡{"stdout":"[(1, 2, 1), (1, 1, 2)]\n"}︡{"done":true}
︠9dfee615-f52e-4223-97cb-2bdc001c8b06s︠
A.row_space()                       # véxase que para a base usa a matriz reducida por filas
︡8b1221e6-6702-449d-88a2-b36d22568031︡{"stdout":"Vector space of degree 3 and dimension 2 over Finite Field of size 3\nBasis matrix:\n[1 0 0]\n[0 1 2]\n"}︡{"done":true}
︠69a8255f-cf47-44e3-9efd-830ea7a3ecbes︠
A.echelon_form()                    #
︡68b43c80-eb08-4596-98e0-f7e68fd12ad2︡{"stdout":"[1 0 0]\n[0 1 2]\n"}︡{"done":true}
︠f43f938f-2621-4406-b9a5-17cde960c5a4s︠
A.rank()                            # naturalmente, coincide coa dimensión do espazo xenerado polas filas (e tamén coa dimensión do espazo xenerado polas columnas)
︡529d8f8c-29bd-4caa-813c-23d7f769c3f4︡{"stdout":"2\n"}︡{"done":true}
︠984305a1-2baf-4fc6-87d3-ddd7bd706eddi︠
%md
É interesante destacar que, cada fila (ou columna) da matriz é un vector, non unha lista sen máis
︡6da60ca9-3dc4-4852-84bb-3405a4e68b43︡{"done":true,"md":"É interesante destacar que, cada fila da matriz é un vector, non unha lista sen máis"}
︠55493f64-3bb2-4812-a946-100447827656s︠
F1 = A[1]
parent(F1)
︡d4ea139c-f9fc-4904-b107-06d1435a054b︡{"stdout":"Vector space of dimension 3 over Finite Field of size 3\n"}︡{"done":true}
︠c0bd8c2f-b95d-4d75-ba99-e905bc3ecce4i︠
%md
**nota**: Para recuperar a fila *i*-ésima, aparte de usar o método anterior, pódese usar o método **.row**(*i* ), tendo en conta que comezamos por 0. Analogamente, **.column**(*i*) devolve a columna *i*-ésima
︡bdf24708-18f4-4cd2-a8e4-8877aae15180︡{"done":true,"md":"**nota**: Para recuperar a fila *i*-ésima, aparte de usar o método anterior, pódese usar o método **.row**(*i* ), tendo en conta que comezamos por 0. Analogamente, **.column**(*i*) devolve a columna *i*-ésima"}
︠dd4f79c4-a39a-44f5-b780-b92753052975s︠
A
A.column(0)
A.row(0)
︡85add92e-cebd-47ec-84b3-d98f4f91b5ed︡{"stdout":"[1 2 1]\n[1 1 2]\n"}︡{"stdout":"(1, 1)\n"}︡{"stdout":"(1, 2, 1)\n"}︡{"done":true}
︠3518b487-61ba-4a7d-ac94-12ec2cddd8d2i︠
%md
### Sistemas homoxéneos
Toda matriz dá orixe a dous sistemas homoxéneos, segundo mutipliquemos en fila pola esquerda, ou en columna pola dereita.
︡491095ba-7256-485f-a1ef-9f38833add86︡{"done":true,"md":"### Sistemas homoxéneos\nToda matriz dá orixe a dous sistemas homoxéneos, segundo mutipliquemos en fila pola esquerda, ou en columna pola dereita."}
︠dccb26a3-042a-473b-865b-1ae60bd6daadso︠
A.kernel()                           # Solucións de X*A = 0 (Tamén se pode usar left_kernel)
︡2417b450-02dd-4e15-932b-771f4862ae6a︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'A' is not defined\n"}︡{"done":true}︡
︠fca38163-4339-40e8-a1d5-675f61f48b47so︠
(A.transpose()).kernel()             # Solucións de X*A^t = 0 (Tamén se pode usar A.right_kernel)
A.right_kernel()
︡3fb8005e-11dc-4472-b41c-5136513443e9︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'A' is not defined\n"}︡{"done":true}︡
︠6561daba-16f2-4578-9fec-9b7c72dab5cei︠
%md
### Vectores
De igual modo, se queremos usar unha lista de números como vector, podemos usar **vector(** *lista* **)**, e, coma antes, podemos usar como primeiro parámetro o anel no queremos que o considere
︡991259c4-0a55-4326-837f-63ac33fb2682︡{"done":true,"md":"### Vectores\nDe igual modo, se queremos usar unha lista de números como vector, podemos usar **vector(** *lista* **)**, e, coma antes, podemos usar como primeiro parámetro o anel no queremos que o considere"}
︠3fc4863e-0131-45e2-9bcf-c2fe2ab93185s︠
v = vector(GF(3),[1,6,2])           # sobre o corpo GF(3)
v
parent(v)
︡b870d556-9e4e-4793-b3ae-8461c8524f94︡{"stdout":"(1, 0, 2)\n"}︡{"stdout":"Vector space of dimension 3 over Finite Field of size 3\n"}︡{"done":true}
︠4e6117aa-238c-4229-b13f-7399665232a6s︠
a = vector([1,2,3])                 # se non especificamos o anel/corpo base elixe o menor no que caben as compoñentes
b = vector([1,2,pi])
parent(a)
parent(b)
︡a806dc56-00b7-402e-91ea-7fe1d98f583c︡{"stdout":"Ambient free module of rank 3 over the principal ideal domain Integer Ring\n"}︡{"stdout":"Vector space of dimension 3 over Symbolic Ring\n"}︡{"done":true}
︠0c91e79a-7b40-4195-ad94-aef7feefcb94i︠
%md
### Operacións
Úsase **\*** para multiplicar matrices, para multiplicar un escalar por unha matriz, para multiplicar ununha matriz por un vector e para multiplicar un vector por outro (produto escalar). Observar que **non** hai que (de feito, non se pode) usar v.transpose
︡c890c891-c876-4fa6-84b3-8839ca9c748a︡{"done":true,"md":"### Operacións\nÚsase **\\*** para multiplicar matrices, para multiplicar un escalar por unha matriz, para multiplicar ununha matriz por un vector e para multiplicar un vector por outro (produto escalar). Observar que **non** hai que (de feito, non se pode) usar v.transpose"}
︠3348d76e-64ab-4e0f-a29a-4492fc780fe1so︠
2*A                                                       # escalar por unha matriz: a saída é unha matriz
︡b04ec5f0-d0e3-42a8-b2e5-0b72969a0f6d︡{"stdout":"[2 1 2]\n[2 2 1]\n"}︡{"done":true}
︠95d06e0f-d090-4f83-a093-211b4274be07so︠
A*A.transpose()                                           # producto de matrices: a saída é unha matriz
A.transpose()*A
︡ef1e163a-311b-4e56-8064-67b25a365dc9︡{"stdout":"[0 2]\n[2 0]\n"}︡{"stdout":"[2 0 0]\n[0 2 1]\n[0 1 2]\n"}︡{"done":true}
︠b02a643f-00ea-43ff-83f3-67e53508f789o︠
A*v                                                       # matriz por un vector: a saída é un vector
︡1e3e8d3a-06f6-461f-9055-709c5b70959d︡{"stdout":"(0, 2)\n"}︡{"done":true}
︠aee09ea1-5fa6-492c-80f5-1204b9e046c9o︠
v*(v+-2*v)                                                # a saída é un elemento do corpo: o producto escalar de  v por (v-2*v)
︡ff2d343c-d1a0-4f26-8b71-d0e0becd1678︡{"stdout":"1\n"}︡{"done":true}
︠b69952cd-ddaf-47e6-bf5e-3ee7af9c366eso︠
u = vector([1,4,2])
u*v                                                     # producto escalar de  u por v
u.dot_product(v-2*v)                                   # producto escalar de  v por (v-2*v)
︡91cdd837-f9a9-4575-a25e-58fd42f0ecad︡{"stderr":"Error in lines 2-2\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"sage/structure/element.pyx\", line 3391, in sage.structure.element.Vector.__mul__ (build/cythonized/sage/structure/element.c:21403)\n    return coercion_model.bin_op(left, right, mul)\n  File \"sage/structure/coerce.pyx\", line 1255, in sage.structure.coerce.CoercionModel.bin_op (build/cythonized/sage/structure/coerce.c:11178)\n    raise bin_op_exception(op, x, y)\nTypeError: unsupported operand parent(s) for *: 'Ambient free module of rank 3 over the principal ideal domain Integer Ring' and 'Vector space of dimension 2 over Finite Field of size 3'\n"}︡{"done":true}︡
︠ffdc5dd5-8aaf-4a9d-8dd8-1df40dea7ee0i︠
%md
### Espazos vectoriais
Para crearmos espazos vectoriais temos varias opcións
##### métodos aplicados a matrices:
- **.row_space( )**
- **.column_space( )**
- **.kernel( )**
##### comandos:
- **VectorSpace( )**
- **span( )**

︡1a1c7d01-bf94-4e5b-a9a3-9b8a8b6931f2︡{"done":true,"md":"### Espazos vectoriais\nPara crearmos espazos vectoriais temos varias opcións\n##### métodos aplicados a matrices:\n- **.row_space( )**\n- **.column_space( )**\n- **.kernel( )**\n##### comandos:\n- **VectorSpace( )**\n- **span( )**"}
︠56a484ed-a0a5-40f2-ae51-f8dc799f0da4s︠
VectorSpace(GF(7),3)                                   # corpo base e dimensión
︡2ab80ba4-a0b2-4d7f-b32e-d24a246ddd34︡{"stdout":"Vector space of dimension 3 over Finite Field of size 7\n"}︡{"done":true}
︠001a352d-a548-495a-8f6e-27b5324cd17es︠

︡b8592606-8a11-4f42-9239-c98b29d83556︡{"done":true}
︠8e31e19c-fc5a-4dde-94c5-b9c5ae55b168s︠
u
v

︡46dea748-dfd8-420c-b9be-3f38027e4444︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'u' is not defined\n"}︡{"done":true}
︠2e2c5c18-41a2-4b72-bd63-0d2e9cd8d234o︠
span([u,v])                                            # lista de vectores. Prestara atención ao espazo ambiente, anque u non tiña especificado o espazo
︡0239fe23-7dd1-4a18-a974-7c135c85c790︡{"stdout":"Vector space of degree 3 and dimension 2 over Finite Field of size 3\nBasis matrix:\n[1 0 2]\n[0 1 0]\n"}︡{"done":true}
︠7053703b-8117-401a-9a4d-ecf0d32cd04di︠
%md
Unha vez que temos construído o espazo vectorial, temos varios métodos interesantes para aplicarlle, dos que destacamos os seguintes:
- **.dimension( )**
- **.basis_matrix( )**
︡e7b1ef3c-8991-4034-93e1-e44bfc961be6︡{"done":true,"md":"Unha vez que temos construído o espazo vectorial, temos varios métodos interesantes para aplicarlle, dos que destacamos os seguintes:\n- **.dimension( )**\n- **.basis_matrix( )**"}
︠45095427-b548-4e61-9677-9b3cf1ccedd4o︠
V = span([u,v,u+2*v])
V.dimension()
V.basis_matrix()
︡0eb464ba-2755-44ff-acb2-f891b279c295︡{"stdout":"2\n"}︡{"stdout":"[1 0 2]\n[0 1 2]\n"}︡{"done":true}
︠317ae8bc-d12d-405a-8908-79166c9938c5i︠
%md
## Códigos lineares

Son unha clase importante de códigos, definidos como subespazos de dimensión $k$ do espazo $\mathbb{F}_q^n$, onde $\mathbb{F}_q$ denota o corpo finito de $q$ elementos (onde $q$ é potencia dun número primo). A un tal código $q$-ario asócianselle os parámetros $[n,k]$. Como espazo vectorial, admite unha base e á unha matriz $G\in \mathcal{M}_{k\times n}$ con filas os vectores dunha base, chámaselle *matriz xeneradora* do código $\mathcal{C}$. Esta matriz é a que se usa para asociarlle unha palabra do código a cada $k$-upla de elementos de $\mathbb{F}_q$.

A calquera matriz $H\in \mathcal{M}_{(n-k)\times n}$ de rango $n-k$ tal $H^t$que sexa ortogonal a G, chámaselle matriz de control do código $\mathcal{C}$ e ao sistema $X\cdot H^t =0$, que caracteriza as palabras do código, chámanselle *ecuacións de control* de $\mathcal{C}$.  A matriz de control permítenos coñecer a distancia mínima entre palabras do código, que coincide co menor número de columnas linearmente dependentes. Tamén se usa para definir o concepto de *síndrome* dunha palabra: $s(X) = X\cdot H^t$, un concepto interesante para a descodificación de canal, pois é compartido por, e só por, palabras que se diferencia nunha palabra do código.

Anque SageMath ten implementado un constructor de códigos lineares a partir da matriz xeneradora, nesta práctica desenvolveremos os conceptos vistos na teoría para construírmos a táboa estándar e a táboa de síndromes dun código linear, e daremos unha RDDMC.

Pare elo usaremos un par de ferramentas básicas de álxebra linear:
- **matrix** para construír matrices
    - **.rows()** e **.columns()** para ver as filas e as columnas dunha matriz
    - **.row_space** e **.column_space()**  para construír o espazo vectorial xenerado polas filas/columnas
    - **.echelon_form()** para escalonar
- **GF(**$q$**)** para declarar que traballamos no corpo finito con $q$ elementos
- **vector( )** para construír vectores
︡2da489a0-6b83-44f9-aeef-96dee580a87e︡{"done":true,"md":"## Códigos lineares\n\nSon unha clase importante de códigos, definidos como subespazos de dimensión $k$ do espazo $\\mathbb{F}_q^n$, onde $\\mathbb{F}_q$ denota o corpo finito de $q$ elementos (onde $q$ é potencia dun número primo). A un tal código $q$-ario asócianselle os parámetros $[n,k]$. Como espazo vectorial, admite unha base e á unha matriz $G\\in \\mathcal{M}_{k\\times n}$ con filas os vectores dunha base, chámaselle *matriz xeneradora* do código $\\mathcal{C}$. Esta matriz é a que se usa para asociarlle unha palabra do código a cada $k$-upla de elementos de $\\mathbb{F}_q$.\n\nA calquera matriz $H\\in \\mathcal{M}_{(n-k)\\times n}$ de rango $n-k$ tal $H^t$que sexa ortogonal a G, chámaselle matriz de control do código $\\mathcal{C}$ e ao sistema $X\\cdot H^t =0$, que caracteriza as palabras do código, chámanselle *ecuacións de control* de $\\mathcal{C}$.  A matriz de control permítenos coñecer a distancia mínima entre palabras do código, que coincide co menor número de columnas linearmente dependentes. Tamén se usa para definir o concepto de *síndrome* dunha palabra: $s(X) = X\\cdot H^t$, un concepto interesante para a descodificación de canal, pois é compartido por, e só por, palabras que se diferencia nunha palabra do código.\n\nAnque SageMath ten implementado un constructor de códigos lineares a partir da matriz xeneradora, nesta práctica desenvolveremos os conceptos vistos na teoría para construírmos a táboa estándar e a táboa de síndromes dun código linear, e daremos unha RDDMC.\n\nPare elo usaremos un par de ferramentas básicas de álxebra linear:\n- **matrix** para construír matrices\n    - **.rows()** e **.columns()** para ver as filas e as columnas dunha matriz\n    - **.row_space** e **.column_space()**  para construír o espazo vectorial xenerado polas filas/columnas\n    - **.echelon_form()** para escalonar\n- **GF(**$q$**)** para declarar que traballamos no corpo finito con $q$ elementos\n- **vector( )** para construír vectores"}
︠ff92f08a-5bcc-49a3-ac7f-613082d93218i︠
%md
### Matriz xeneradora
Para un $[n,k]$-código sobre $\mathbb{F}_q$, é unha matriz $G\in \frak{M}_{k\times n}(\mathbb{F}_q)$, con $k$ filas independentes que xeneran $C$.
︡ac40c31f-ae87-48d7-80d6-ca3d308154ee︡{"done":true,"md":"### Matriz xeneradora\nPara un $[n,k]$-código sobre $\\mathbb{F}_q$, é unha matriz $G\\in \\frak{M}_{k\\times n}(\\mathbb{F}_q)$, con $k$ filas independentes que xeneran $C$."}
︠cbeb57d0-f8ca-49f6-a0b3-2d4e63528464s︠
G = matrix(GF(3),2, 3, [1,1,2,2,0,1])                   # matriz xeneradora do noso [3,2] código sobre GF(3)
G
︡40f05edf-0606-4ac7-aebc-4df1442423a0︡{"stdout":"[1 1 2]\n[2 0 1]\n"}︡{"done":true}
︠9fe35683-bc39-4efb-94c3-58c8aadcc2d9si︠
G.dimensions()[0]
︡918d29ac-3a30-4cc8-87a2-cf3c7d41e5d2︡{"stdout":"2\n"}︡{"done":true}
︠56c22f28-11ef-48f8-b1a2-f1d4d6f8d352s︠
matrix(G.columns()[:2])
︡0c99d49a-82ca-4dca-8950-1916f4836e87︡{"stdout":"[1 2]\n[1 0]\n"}︡{"done":true}
︠92726602-3422-4232-8bb9-1d7b91409a18i︠
%md
Para sabermos se o nos código é sitemático, podémolo facer por inspección, calculando a escalonada e vendo se a parte da esquerda é a matriz identidade, ou podemos definir unha función que faga o test
︡e6cc5643-5fcf-4b26-9412-b8d4eceec927︡{"done":true,"md":"Para sabermos se o nos código é sitemático, podémolo facer por inspección, calculando a escalonada e vendo se a parte da esquerda é a matriz identidade, ou podemos definir unha función que faga o test"}
︠fc4f9836-21db-49a9-a67a-2aab6605b5e2s︠
G.echelon_form()                                        # por simple inspección, sabemos que o noso código é sistemático
︡d6d474f6-6700-4312-b705-b02c9ff0b547︡{"stdout":"[1 0 2]\n[0 1 0]\n"}︡{"done":true}
︠895e8d4e-0cbc-432f-a6f7-cca71deb45a5s︠
def sistematico(G):                                     # Queremos ver se o código do que G é a matriz xeneradora é sistemático
    F = G.base_ring()                                   # o corpo base ó que pertencen os elementos de G
    k = G.dimensions()[0]                               # número de filas de G  (entendemos que son independentes; se non, podemos usar G.rank())
    E = G.echelon_form()                                # reducida por filas
    M = matrix(E.columns()[:k])                         # matriz formada coas primeiras k columnas de E (traspostas)
    return M == identity_matrix(F),k                    # devolve o valor de verdade da afirmación
︡a0fa87c6-66c5-401c-b072-a398101b0791︡{"done":true}
︠e13d0540-cf1c-4521-8ea0-ac6c6e8e02fbs︠
sistematico(G)
︡dd068f42-c7a2-4738-b8ac-7c4b61b99bf9︡{"stdout":"(False, 2)\n"}︡{"done":true}
︠e61df343-75c8-4441-b8dc-230fba271cdcs︠
G1 = matrix(GF(3),2, 3, [1,2,1,2,1,0])                  # este código non é sistemático
sistematico(G1)
︡5e805d27-44dd-43fc-a748-4368f1bf66b6︡{"stdout":"(False, 2)\n"}︡{"done":true}
︠09c31711-9cdc-4a12-912c-53d821194398i︠
%md
O noso código $C$ é o espazo xenerado polas filas da matriz $G$
︡8544cfcf-60f1-49ae-a522-bdf523869a17︡{"done":true,"md":"O noso código $C$ é o espazo xenerado polas filas da matriz $G$"}
︠5c505dbc-9589-4021-bada-239def7f6eb3s︠
C = G.row_space()
C
︡ba4199e8-bb82-4d65-b9fb-da04625c262e︡{"stdout":"Vector space of degree 3 and dimension 2 over Finite Field of size 3\nBasis matrix:\n[1 0 2]\n[0 1 0]\n"}︡{"done":true}
︠344900dc-4299-4ab2-951b-d5d5eb2cb0d2i︠
%md
### Codificación de fonte
A matriz $G$ úsase para facer a *codificación da fonte*. Cada vector X de (GF(3))^3 codifícase como a palabra do código X*G
︡122db9db-5e46-493a-b723-9222881288aa︡{"done":true,"md":"### Codificación de fonte\nA matriz $G$ úsase para facer a *codificación da fonte*. Cada vector X de (GF(3))^3 codifícase como a palabra do código X*G"}
︠d6a84f03-f13d-4b33-b7bc-6740d6de40ffs︠
for v in VectorSpace(GF(3),2):                    # esta será a codificación de cada palabra fonte
    print (v, '~------>',v*G)
︡345634a3-42b9-4897-afc9-97f1bffbecde︡{"stdout":"(0, 0) ~------> (0, 0, 0)\n(1, 0) ~------> (1, 1, 2)\n(2, 0) ~------> (2, 2, 1)\n(0, 1) ~------> (2, 0, 1)\n(1, 1) ~------> (0, 1, 0)\n(2, 1) ~------> (1, 2, 2)\n(0, 2) ~------> (1, 0, 2)\n(1, 2) ~------> (2, 1, 1)\n(2, 2) ~------> (0, 2, 0)\n"}︡{"done":true}
︠0eda5534-6dc0-4f2c-a7a7-b3c2458d1317i︠
%md
Dado que o código é sistemático, se usamos a matriz en forma estándar, a codificación sería máis ventaxosa, pois as primeiras compoñentes sería a fonte
︡1d5cfcd0-b5cf-422e-8e4e-54e91ae143cd︡{"done":true,"md":"Dado que o código é sistemático, se usamos a matriz en forma estándar, a codificación sería máis ventaxosa, pois as primeiras compoñentes sería a fonte"}
︠37093d0d-c2ef-450e-a04c-f2e697194decs︠
GE = G.echelon_form()
for v in VectorSpace(GF(3),2):
    print (v, '~----->',v*GE)                    # as dúas primeiras compoñentes de cada palabra do código conteñen a información
︡cc3a0626-2540-45cf-9d56-368e1ad31e88︡{"stdout":"(0, 0) ~-----> (0, 0, 0)\n(1, 0) ~-----> (1, 0, 2)\n(2, 0) ~-----> (2, 0, 1)\n(0, 1) ~-----> (0, 1, 0)\n(1, 1) ~-----> (1, 1, 2)\n(2, 1) ~-----> (2, 1, 1)\n(0, 2) ~-----> (0, 2, 0)\n(1, 2) ~-----> (1, 2, 2)\n(2, 2) ~-----> (2, 2, 1)\n"}︡{"done":true}
︠82dc72e6-7766-4a8d-b3a1-6ca5eeeaf8bfi︠
%md
### Descodificación de fonte
Acabamos de ver o interesante que é traballarmos con matrices estándar (cando temos un código sistemático) para levar a cabo a descodificación de fonte. No caso xeral, para recuperar a información a partir dunha palabra $c$ do código, temos que resolver o sistema $G\cdot x^t = c^t$.

#### Reto:
A idea será definir unha función que nos recupere $v \in \mathbb{F}_q^k$ sabendo que $v\ast G == c$.
︡39d66bab-c564-4fde-8cc1-4ce85061a8c3︡{"done":true,"md":"### Descodificación de fonte\nAcabamos de ver o interesante que é traballarmos con matrices estándar (cando temos un código sistemático) para levar a cabo a descodificación de fonte. No caso xeral, para recuperar a información a partir dunha palabra $c$ do código, temos que resolver o sistema $G\\cdot x^t = c^t$.\n\n#### Reto:\nA idea será definir unha función que nos recupere $v \\in \\mathbb{F}_q^k$ sabendo que $v\\ast G == c$."}
︠60d3ce4b-d250-4aba-b980-b2ab4521d7f1s︠
G = matrix(GF(2),3,5,[1,0,0,1,1,0,1,0,1,1,0,0,1,0,0])
︡9ce99955-c027-41be-9b23-d5e475e77379︡{"done":true}
︠9ba4c7a7-1909-414b-9727-a6976d194a03s︠
V = VectorSpace(GF(2),3)
︡68a2e92b-5012-4d39-ac65-cf98d4764c73︡{"done":true}
︠b779344a-8361-4a74-9ed5-2df12291df38s︠
def c_f(v):
    return v*G
︡6f1a9f55-c2e2-47b6-be0e-b2890ad85430︡{"done":true}
︠504f80db-a72e-4a50-b8d4-9429f584013dso︠
for v in V:
    print (v, '~--->', c_f(v))
︡f73d7ea4-289d-48b5-8dab-6de205f3f1d6︡{"stderr":"Error in lines 1-2\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'V' is not defined\n"}︡{"done":true}︡
︠11e1c4a1-b984-4eae-9eb9-cc87c035009ds︠
def d_f(c):
    for v in V:
        if v*G == c:
            return v
    return 'non e unha palabra codigo'
︡c4f061ce-aa6f-4854-8455-54211ec17955︡{"done":true}
︠33738b8e-2e85-4605-83b6-caffa2aafd2dso︠
d_f(vector([1, 1, 1, 0, 0]))
︡df8cdb24-33a7-44e3-9579-7488b88ae7d4︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"\", line 2, in d_f\nNameError: name 'V' is not defined\n"}︡{"done":true}︡
︠7802e2b8-80fb-403b-b799-9e629e2f5c15︠
︡f99dfc62-03b0-4b82-a534-4b5d7148c15f︡
︠cecf5448-c86a-47bc-833d-4dbcfe3d4094︠
︡5626cfae-7075-44da-9097-f5572b1d341a︡
︠1f286a14-057a-4429-bd82-8dde8dc02ab6s︠
G
︡65514c31-def9-46aa-b5ed-2230607640ad︡{"stdout":"[1 0 0 1 1]\n[0 1 0 1 1]\n[0 0 1 0 0]\n"}︡{"done":true}
︠8cd50a6c-3c60-4f9c-b8cc-add36e7679df︠

︡bfb558f9-60ea-492b-9181-28d30dddaa7e︡
︠443c9ada-0f62-4ba7-b9a0-9587eebc415ei︠
%md
### Código dual e matriz de control
Para determinar a matriz de control, a idea é determinar o espazo ortogonal a C e despois construír unha base.
$$C^{\perp} = \{ v \in \mathbb{F}_q^n\mid c\cdot v=0, \forall c \in C  \} = \{X \mid G\cdot X^t=0\}$$
é dicir, as solucións do sistema homoxéneo con matriz $G$.
︡cd38c8ea-7625-4180-b102-234f382b77fa︡{"done":true,"md":"### Código dual e matriz de control\nPara determinar a matriz de control, a idea é determinar o espazo ortogonal a C e despois construír unha base.\n$$C^{\\perp} = \\{ v \\in \\mathbb{F}_q^n\\mid c\\cdot v=0, \\forall c \\in C  \\} = \\{X \\mid G\\cdot X^t=0\\}$$\né dicir, as solucións do sistema homoxéneo con matriz $G$."}
︠3635754a-2454-4955-a7cb-1791c8cde321o︠
C_dual = G.right_kernel()          # ou, simplemente,  C_dual = G.right_kernel()
C_dual
︡42574d4f-9459-4439-b66a-bb0540120261︡{"stdout":"Vector space of degree 3 and dimension 1 over Finite Field of size 3\nBasis matrix:\n[1 0 1]\n"}︡{"done":true}
︠8566b21c-ccfd-42b8-9849-8778f6755905so︠
H = C_dual.basis_matrix()                  # a matriz de control do código C
H
︡9ffa7628-870e-406c-8fe2-8752a6b86a6b︡{"stdout":"[1 0 1]\n"}︡{"done":true}
︠51bc3100-e6af-4ae4-8d1f-47c0f74b6d97i︠
%md
### Ecuacións de control
Dado que $$\left(C^{\perp}\right)^{\perp} = C,$$ todo vector $c\in C$ verifica $H\cdot c^t = 0$, é dicir, é solución do sistema $H\cdot X^t = 0$. Polo tanto, $C$ é o espazo de solucións do sistema anterior.

︡f2210a07-f525-4d2d-b075-61427fb39128︡{"done":true,"md":"### Ecuacións de control\nDado que $$\\left(C^{\\perp}\\right)^{\\perp} = C,$$ todo vector $c\\in C$ verifica $H\\cdot c^t = 0$, é dicir, é solución do sistema $H\\cdot X^t = 0$. Polo tanto, $C$ é o espazo de solucións do sistema anterior."}
︠84c185de-4a28-473e-8f70-c531f3edb965so︠

# no noso exemplo, x_1 + x_3 = 0 é a única ecuación de control
# C = H.right_kernel()

︡b6a80ed2-3c7b-4f47-aab8-9f107cce8cd2︡{"done":true}
︠eb1c5292-0ec4-4b31-959d-1178d116de3ei︠
%md
### Distancia mínima e matriz de control

Sendo $C_1,\dots,C_n$ as columnas de $H$ e $X = (x_1,\dots,x_n)$ unha palabra do código, $H\cdot X^t = \displaystyle\sum_{i=1}^nx_iC_i = 0$. Polo tanto, se $w(X) = p$, entón, hai un conxunto de índices $\{i_1,\dots,i_p\}$ de xeito que $x_i=0$, para $i\not\in \{i_1,\dots,i_p\}$, polo que, dado que $\displaystyle\sum_{i=1}^nx_iC_i = \displaystyle\sum_{i\in\{i_1,\dots,i_p\}}x_iC_i = 0$, e as columnas $C_{i_1},\dots,C_{i_p}$ son linealmente dependentes.

Polo tanto, a distancia mínima coincide co menor número de columnas que son linearmente dependentes ou, equivalentemente, o maior número $r$ para o que calquera $r-1$ columnas son linearmente independentes.
︡af34a71a-1698-42eb-84e7-62c0393f8b6e︡{"done":true,"md":"### Distancia mínima e matriz de control\n\nSendo $C_1,\\dots,C_n$ as columnas de $H$ e $X = (x_1,\\dots,x_n)$ unha palabra do código, $H\\cdot X^t = \\displaystyle\\sum_{i=1}^nx_iC_i = 0$. Polo tanto, se $w(X) = p$, entón, hai un conxunto de índices $\\{i_1,\\dots,i_p\\}$ de xeito que $x_i=0$, para $i\\not\\in \\{i_1,\\dots,i_p\\}$, polo que, dado que $\\displaystyle\\sum_{i=1}^nx_iC_i = \\displaystyle\\sum_{i\\in\\{i_1,\\dots,i_p\\}}x_iC_i = 0$, e as columnas $C_{i_1},\\dots,C_{i_p}$ son linealmente dependentes.\n\nPolo tanto, a distancia mínima coincide co menor número de columnas que son linearmente dependentes ou, equivalentemente, o maior número $r$ para o que calquera $r-1$ columnas son linearmente independentes."}
︠a4dac680-0355-45ae-a488-805dfe01f0f2i︠
%md
### Reto:
Usar **H.columns()** para determinar a distancia mínima dun código

Pode ser de axuda saber que **Combinations**(*r, s*) construe as combinacións de $\{0,1,\dots,r-1\}$ tomados de $s$ en $s$.

︡a4ba1f27-03c2-4e00-b97e-04fefe542d88︡{"done":true,"md":"### Reto:\nUsar **H.columns()** para determinar a distancia mínima dun código\n\nPode ser de axuda saber que **Combinations**(*r, s*) construe as combinacións de $\\{0,1,\\dots,r-1\\}$ tomados de $s$ en $s$."}
︠560e30ad-1382-49ce-bec3-7e5b4107fe9dso︠
H = G
H
︡8d165ce9-12bf-46e4-bb55-5910e90b748f︡{"stdout":"[1 0 0 1 1]\n[0 1 0 1 1]\n[0 0 1 0 0]\n"}︡{"done":true}
︠8cdf3590-b795-4ab2-bbcd-ae76d14f2869so︠
Combinations(5,2).list()
︡58db8524-d9b4-4c2f-b412-df1b263d244c︡{"stdout":"[[0, 1], [0, 2], [0, 3], [0, 4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]\n"}︡{"done":true}
︠9c427bf4-649e-44dc-b823-54e56b05f4f6so︠
K = H.columns()
K
︡35fde2d4-4ca5-4c24-ab05-4080fe03ccb8︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'H' is not defined\n"}︡{"done":true}︡
︠51fe8bf6-547f-4579-b4e1-b55508b6d63fso︠
[K[0],K[1]]
︡b952cc7e-58c9-46cd-8a35-8a1220eb6ae4︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'K' is not defined\n"}︡{"done":true}︡
︠eec31a42-556a-4650-8bef-888dd66345e7so︠
exemplo = Combinations(5,2)[4]
exemplo
︡58b0a043-4ebd-452e-a9e9-531fd3f55875︡{"stdout":"[1, 2]\n"}︡{"done":true}
︠82d748c7-9f1e-43ea-9402-4cbefae47f16so︠
[K[i] for i in exemplo]
︡29156db4-1273-42e8-9ac7-b8d2978c2a28︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'exemplo' is not defined\n"}︡{"done":true}︡
︠e828f0ff-589e-4ddc-a35c-e27e57b53d77so︠
(matrix([K[i] for i in exemplo])).rank()
︡985b56f3-1619-46f3-9997-3f69552e9f80︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'exemplo' is not defined\n"}︡{"done":true}︡
︠d538a72a-c5b2-4846-a3bc-87c43c0a48a3so︠
for c in Combinations(3,2):
    c
︡341b28ce-1955-4fa9-94c6-921fdfda053a︡{"stdout":"[0, 1]\n[0, 2]\n[1, 2]\n"}︡{"done":true}
︠45163a2d-b4f1-45ce-9d79-12a6e10c7ba3so︠
H.dimensions()
︡169b4e8e-c956-4762-b4c4-93c7b9ac077b︡{"stdout":"(3, 5)\n"}︡{"done":true}
︠aea712ed-9077-4b3a-8889-2969dc433db6︠
def dm(M):
    r = M.dimensions()[0]
    c = M.dimensions()[1]
    k = 1
    K = M.columns()
    while k <= r:
        comb = Combinations(c,k)
        for x in comb:
            m_c = matrix([K[i] for i in x])
            if m_c.rank() < k:
                return k
        k += 1
    return k
︡71ecb685-b727-4e94-ba8d-e1c4c2e07be9︡{"done":true}
︠d0bc5156-1c11-488c-abe9-c7a714acfbb4so︠
dm(H)
︡33b24718-6024-4ba0-9061-47f1abddf13f︡{"stdout":"2\n"}︡{"done":true}
︠5f4381e4-2a79-43a5-84c2-9570c85711c6︠

︡97911d7b-76a5-4e52-960a-027888d0a968︡
︠20d2eeeb-0ed3-4976-9546-a8000a5f48c8so︠
H
︡7ac1982d-8eee-44e0-975d-8551fdacf523︡{"stdout":"[1 0 0 1 1]\n[0 1 0 1 1]\n[0 0 1 0 0]\n"}︡{"done":true}
︠75ef31e2-0174-4539-9b48-43c4ebc940f1so︠
M = H
r= H.dimensions()[0] 
c
c = H.dimensions()[1]
r
k = 2
print ('-------')
comb = Combinations(c,k)
for x in comb:
    m_c = matrix([K[i] for i in x])
    m_c
    m_c.rank()
︡9ee75f86-b055-406e-9b8d-85ff86d0ed9e︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'H' is not defined\n"}︡{"done":true}︡
︠a4482ebc-177f-457a-80b5-6d4a061007d2s︠
K = Combinations(3,2)
︡e5f547d6-3b21-42f7-8b2f-647956d995d9︡{"done":true}
︠9a071b7e-65a5-46c2-99f5-d5c36188339aso︠
V = VectorSpace(GF(2),2)
V
︡5f6a0f13-d2bb-41d6-b076-3dbd0b3eb086︡{"stdout":"Vector space of dimension 2 over Finite Field of size 2\n"}︡{"done":true}
︠f8f1cfdf-0209-4c14-b1bd-236dfc12ecf7s︠
H = matrix(GF(2),2,5,[1,0,1,0,1,0,1,0,1,1])
C = H.columns()
︡91a38c3f-b099-4504-9cf4-fe326a59a1e6︡{"done":true}
︠57ef1cd7-e4cd-4090-903f-d853ae55dc4cso︠
for c in C:
    c, V.subspace([C[i] for i in c]),dimension(V.subspace([C[i] for i in c]))
︡ba63208a-e573-4d0e-baec-b800a642b504︡{"stdout":"((1, 0), Vector space of degree 2 and dimension 2 over Finite Field of size 2\nBasis matrix:\n[1 0]\n[0 1], 2)\n((0, 1), Vector space of degree 2 and dimension 2 over Finite Field of size 2\nBasis matrix:\n[1 0]\n[0 1], 2)\n((1, 0), Vector space of degree 2 and dimension 2 over Finite Field of size 2\nBasis matrix:\n[1 0]\n[0 1], 2)\n((0, 1), Vector space of degree 2 and dimension 2 over Finite Field of size 2\nBasis matrix:\n[1 0]\n[0 1], 2)\n((1, 1), Vector space of degree 2 and dimension 1 over Finite Field of size 2\nBasis matrix:\n[0 1], 1)\n"}︡{"done":true}
︠3e08d98e-338d-4d84-a102-490ba8e0aa77so︠
  G
︡8d98a9a5-f38b-4a72-9119-72665aee00e8︡{"stdout":"[1 0 0 1 1]\n[0 1 0 1 1]\n[0 0 1 0 0]\n"}︡{"done":true}
︠4b67b8df-6c9d-4186-85e6-54099fefb421︠









