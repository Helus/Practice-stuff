︠127f758c-537e-4ac7-b89b-a66269350227i︠
%md
## Empaquetamento de bolas e códigos perfectos
- Distancia de Hamming
- Bólas / esferas
    - volume
    - cota de Hamming
- radio de empaquetamento
- exemplos de códigos perfectos
︡645b7a9e-679f-4825-a6a5-3ac4168549a8︡{"done":true,"md":"## Empaquetamento de bolas e códigos perfectos\n- Distancia de Hamming\n- Bólas / esferas\n    - volume\n    - cota de Hamming\n- radio de empaquetamento\n- exemplos de códigos perfectos"}
︠e257f3d1-01d6-4fe2-8836-567a86d04facs︠
def ham(L,M):                      # non facemos test de entrada, polo que hai que meter listas do mesmo tamaño.
    c = 0                          # comezamos co contador a 0.
    for i in range( len(L) ):
        if L[i] != M[i]:           # (tamén vale <>) e miramos se son distintas as correspondentes entradas.
            c += 1                 # (tamén vale c = c+1), aumentamos 1 ao contador cado sexan distintas.
    return c
︡653a42d7-fca1-43d7-a0d3-fff587d6bb38︡{"done":true}
︠717423f6-d797-49d1-b0d4-3b2a4b6fd545s︠
def B(u,r, A):                      # bola (no alfabeto A) de radio r e centrada en u
    n = len(u)
    Bol = []
    for x in Permutations(A*n,n):
        if ham(u,x) <= r:
            Bol.append(''.join(x))
    return Bol
︡0881d78a-3bf4-4df2-bf54-7b8405319498︡{"done":true}
︠7416a3f6-9b6f-498b-8eea-8b60da1115b9s︠
B('000',2,'012')
B('000',2,'01')
︡e846acea-725a-4ab5-8e63-9bded0f1bf41︡{"stdout":"['000', '001', '002', '010', '011', '012', '020', '021', '022', '100', '101', '102', '110', '120', '200', '201', '202', '210', '220']"}︡{"stdout":"\n"}︡{"stdout":"['000', '001', '010', '011', '100', '101', '110']\n"}︡{"done":true}
︠ee0d3bdf-9112-41a4-9628-8e62ac4d2aafs︠
def vol(B):
    return len(B)
︡a1f0360e-d095-4bca-9edf-1d954208687b︡{"done":true}
︠84ba4dcb-0976-4413-94a0-2e200c7230a2s︠
vol(B('000',2,'012'))
︡ae2d79e1-8e92-4284-b057-b743c4594bfc︡{"stdout":"19\n"}︡{"done":true}
︠cec35cd1-f15a-4571-a1ba-14445b8173d1s︠
def volume(n,r,q):                        # volume dunha bóla en A^n, con radio r e q =|A|
    v = 0
    for i in range(r+1):
        v += binomial(n,i)*(q-1)^i
    return v
︡a615c318-489a-42e2-b802-192d1ef75f2f︡{"done":true}
︠af96d6e6-a5ac-463a-a16b-2a054ae0f160s︠
volume(4,2,3)
︡74e7f0d6-09e7-43c6-bebc-bff9e5611fe6︡{"stdout":"33\n"}︡{"done":true}
︠1e6b5e1a-ab78-4a41-9b4d-dc96f5777c21s︠
# definición alternativa
def volume(n,r,q):                        # volume dunha bóla en A^n, con radio r e q =|A|
    return sum([binomial(n,i)*(q-1)^i for i in range(r+1)])
︡38291406-c8bc-4643-a525-201a28376bc2︡{"done":true}
︠8426901f-1703-49fd-aff6-86e8c6df3c89s︠
volume(4,2,3)
︡f44f241e-7eff-4ded-a63c-1ecce9f6196e︡{"stdout":"33\n"}︡{"done":true}
︠3d224826-6bd0-423c-912f-8947d524959es︠
def pr(n, M, q):                            #radio de empaquetamento para un (n, M) q-código C
    r = 0
    while M*volume(n,r,q) <= q^n:
        r += 1
    return r-1
︡ee32f120-d405-44d1-ba21-185c63868586︡{"done":true}
︠a3e995bd-b306-407c-9c60-b1b9400b6e97s︠
pr(4, 2, 2)
︡259ef56c-33b1-4e2d-9c32-2de01fc01fa0︡{"stdout":"1\n"}︡{"done":true}
︠1a7b4ed6-d48f-48d1-88bd-a950376f4524i︠
%md
## Busca de códigos perfectos
A continuación, definiremos uha función que para cada cardinal de alfabeto, $q$, e unda distancia mínima prefixada, $d$, buscará o primeiro valor de $n$ para o que existe un código perfeto non trivial de lonxitude $n$ nese alfabeto e con esa distancia mínima e devolveranos os parámetros de dito código.
︡be51422e-687d-4ebc-b0b9-f537a78a5c16︡{"done":true,"md":"## Busca de códigos perfectos\nA continuación, definiremos uha función que para cada cardinal de alfabeto, $q$, e unda distancia mínima prefixada, $d$, buscará o primeiro valor de $n$ para o que existe un código perfeto non trivial de lonxitude $n$ nese alfabeto e con esa distancia mínima e devolveranos os parámetros de dito código."}
︠53d1195d-5506-4880-addd-7ae5461b826es︠
def cod_per(q,d):                         # q = aridade, d = distancia mínima
    n = d+1                               # evitamos o código trivial de repetición
    r = floor((d-1)/2)
    while q^n % volume(n,r,q) > 0:        # a división non dá exacta
        n += 1
    M = (q^n)/volume(n,r,q)
    #print ((n,M,d))                       # estes son os datos
    print ('(',n,',',q,'^',log(M,q),',',d,')')      # para ver os datos coma vimos nos exemplos da clase
︡32fcc2cd-a769-4984-bd90-d4389a630484︡{"done":true}
︠e6b54c39-6c39-4746-bd9a-dcf509b176f5s︠
cod_per(2,7)                              # G_23 = (23,2^12,7)
︡4c797a49-3920-44d4-b310-1bfdc6f21101︡{"stdout":"( 23 , 2 ^ 12 , 7 )\n"}︡{"done":true}
︠ec68b842-b439-450d-967e-d584a5af56cfs︠
cod_per(3,5)                              # G_11 = (11, 3^6, 5)
︡5a7920ed-f158-42eb-b26f-d695a7d17e46︡{"stdout":"( 11 , 3 ^ 6 , 5 )\n"}︡{"done":true}
︠6b8b71f3-31d8-47fc-b416-5d73c092d7bas︠
cod_per(2,3)                              # H_2(3) = (7,2^4,3)
︡2b2fdcfb-f363-41b0-ab27-7a33812e77e7︡{"stdout":"( 7 , 2 ^ 4 , 3 )\n"}︡{"done":true}
︠a4dfea80-d47a-41ba-b14a-9c32b1a44f71s︠
cod_per(2^3,3)                            # H_8(3) = (9,8^21,3)
︡de32f6bf-dbba-4ec6-94e2-63d08fb20cbd︡{"stdout":"( 9 , 8 ^ 7 , 3 )\n"}︡{"done":true}
︠f7a8eaf8-476e-4f98-ae2d-64bca604dc6di︠
%md
O algoritmo anterior párase cando atopa o primeiro $n$ para o que existe un dódigo perfecto. Pdemos facer unha pequena modificación para seguir investigando se existen códigos perfectos de lonxitude maior ou igual ca unha cota dada
︡99388b5a-13a7-4043-a253-ab60b10de6de︡{"done":true,"md":"O algoritmo anterior párase cando atopa o primeiro $n$ para o que existe un dódigo perfecto. Pdemos facer unha pequena modificación para seguir investigando se existen códigos perfectos de lonxitude maior ou igual ca unha cota dada"}
︠89f458d4-fbfe-4931-957b-48955e1faf63s︠
def cod_per_(q,d,cota):                             # q = aridade, d = distancia mínima, cota inferior para a lonxitude do código a buscar
    n = max([d+1,cota])                             # evitamos o código trivial de repetición
    r = floor((d-1)/2)
    while q^n % volume(n,r,q) > 0:                  # a división non dá exacta
        n += 1
    M = (q^n)/volume(n,r,q)
    #print ((n,M,d))                                # estes son os datos
    print ('(',n,',',q,'^',log(M,q),',',d,')')      # para ver os datos coma vimos nos exemplos da clase
︡08010170-b505-4c6e-bd3e-8229f30a0945︡{"done":true}
︠4be1c8da-61ec-428d-a321-bb48c41586c9s︠
cod_per_(2,3,8)
︡95d653b1-810a-4d94-98de-258759e5e12a︡{"stdout":"( 15 , 2 ^ 11 , 3 )\n"}︡{"done":true}
︠d07334e7-4e99-4c16-be39-889a04ed7ddds︠
cod_per_(2,3,16)
︡9c140982-1070-43c1-97be-a36d8236d0e9︡{"stdout":"( 31 , 2 ^ 26 , 3 )\n"}︡{"done":true}
︠ed939df5-e695-4db3-9fe5-c1a295a5944bs︠
cod_per_(2,5,12)                                    # Non se coñece ningún código con estes parámetros
︡2d04c719-68ea-4eee-8be5-c7ab367b7d4b︡{"stdout":"( 90 , 2 ^ 78 , 5 )\n"}︡{"done":true}
︠87bdb7c0-a6ae-4964-b04a-e445ab6f0123︠









