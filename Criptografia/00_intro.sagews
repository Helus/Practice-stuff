︠d4427284-4482-40a9-939a-ab63ceb2fbc6i︠
%md
# Breve Introdución a Sagemath
### *Felipe Gago*
︡5ae8db61-68d6-4ea5-9409-fb861d1431b9︡{"done":true,"md":"# Breve Introdución a Sagemath\n### *Felipe Gago*"}
︠ac7e06f3-a92e-46bd-ab10-f6c1feb06806i︠
%md
SAGE [**S**oftware for **A**lgebra and **G**eometry **E**xperimentation]



- entorno de cálculos matemáticos: CAS [wiki/List_of_computer_algebra_systems]( http://en.wikipedia.org/wiki/List_of_computer_algebra_systems)

  - algoritmos propios

  - algoritmos *prestados* de outros entornos.

- escrito en [Python](https://www.python.org)

- software libre e de balde (http://www.sagemath.org)

- posibilidades de uso

  - servizo web (http://cocalc.com)

  - LAN

  - instalación ordenador

    - modo terminal [*command line*]

    - browser [*graphical interface notebook*]
︡01ee0065-c50f-4805-b925-fd1290af68ef︡{"done":true,"md":"SAGE [**S**oftware for **A**lgebra and **G**eometry **E**xperimentation]\n\n\n\n- entorno de cálculos matemáticos: CAS [wiki/List_of_computer_algebra_systems]( http://en.wikipedia.org/wiki/List_of_computer_algebra_systems)\n\n  - algoritmos propios\n\n  - algoritmos *prestados* de outros entornos.\n\n- escrito en [Python](https://www.python.org)\n\n- software libre e de balde (http://www.sagemath.org)\n\n- posibilidades de uso\n\n  - servizo web (http://cocalc.com)\n\n  - LAN\n\n  - instalación ordenador\n\n    - modo terminal [*command line*]\n\n    - browser [*graphical interface notebook*]"}
︠6ebefa84-0fa0-4369-8cfa-d58d0f943f3b︠
3+4 # <enter> o <return>

︡22afb8e7-219b-49f4-ac46-4edaf1fb85be︡
︠ce4790a8-d8a4-473d-9e82-3667dd1a1b73s︠
3+4 # <shift> + (<enter> ou <return>)
︡996b2ae8-aa82-4256-bdfe-1408b2146140︡{"stdout":"7\n"}︡{"done":true}︡
︠f60202ba-63a6-4765-9e0c-5776c3f1547ai︠
%md
**Comentarios e anotacións**
1. Usando **#** dentro de calquera liña
- todo o que aparece á dereita de # non se procesa

2. Declarando unha celda como texto
- [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) :  Iniciamos con **%md**

- [html](http://www.w3schools.com/html/) : Iniciamos con **%html**

   En ambos dous casos, podemos usar [Latex](http://www.latex-project.org) para escribir fórmulas matemáticas $x^3 + x^2 = \frac{a}{b+1}$

︡ef093cc4-b4e5-4249-aa45-56553a9cca5b︡{"done":true,"md":"**Comentarios e anotacións**\n1. Usando **#** dentro de calquera liña\n- todo o que aparece á dereita de # non se procesa\n\n2. Declarando unha celda como texto\n- [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) :  Iniciamos con **%md**\n\n- [html](http://www.w3schools.com/html/) : Iniciamos con **%html**\n\n   En ambos dous casos, podemos usar [Latex](http://www.latex-project.org) para escribir fórmulas matemáticas $x^3 + x^2 = \\frac{a}{b+1}$"}
︠73a57de7-0ba0-4b22-968e-f541b42652efi︠
%md
**Sintaxe das operacións básicas:** &nbsp; &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp;  - &nbsp; &nbsp; &nbsp;  \* &nbsp; &nbsp; &nbsp;  /&nbsp; &nbsp; &nbsp; \*\* (ou **^**)&nbsp; &nbsp; &nbsp;
    *Atención á prelación en operacións combinadas!*
︡0139346d-9dd2-47de-9fbe-5ef51f3594dc︡{"md":"**Sintaxe das operacións básicas:** &nbsp; &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp;  - &nbsp; &nbsp; &nbsp;  \\* &nbsp; &nbsp; &nbsp;  /&nbsp; &nbsp; &nbsp; \\*\\* (ou **^**)&nbsp; &nbsp; &nbsp;\n    *Atención á prelación en operacións combinadas!*\n"}︡
︠12676858-45fc-4991-8320-52a71da618de︠
5*6
︡16cce371-695f-401c-8973-404b5a81c7ea︡
︠29344803-f9f8-414d-81bb-63c50c3a898f︠
3^4
︡9ca55d45-1b2a-4c8c-b50e-3509c7787d8f︡
︠03973e91-af7a-4198-91eb-9c8d2c56c5ab︠

︡71968817-a02c-4245-b5b6-d935ea47e740︡
︠679e3702-aa55-4bc6-82b3-9888134cdaf0s︠
9/3
︡f1d7a25e-b2d7-4963-9555-875c33b1afa7︡{"stdout":"3\n"}︡{"done":true}︡
︠9ac88d14-5300-4055-8f98-758d52c07ef3s︠
10/3
︡27bec645-9f05-4635-8877-36866cdea49c︡{"stdout":"10/3\n"}︡{"done":true}︡
︠b1bb2103-0f18-44f8-863b-3b6d99c0ca96s︠
3^(1/2)
︡e647a56c-7093-4f76-babe-d21ac0cb7739︡{"stdout":"sqrt(3)\n"}︡{"done":true}︡
︠8c5e669e-3ce9-49e7-9a2c-8cfa76dc3ab7s︠
sqrt(4)
︡2b1bd740-85bf-4f62-a6b0-0df3bad0e873︡{"stdout":"2\n"}︡{"done":true}︡
︠e28ced2a-47e4-4f1a-8ce1-02be5c5f679c︠
4**(1/2)
︡691548ae-ca31-43ee-8ca3-cfdf233d84fe︡
︠b5e9d231-2e7e-4ccb-8e3e-b96c236939eb︠
sqrt(3)
︡18056ff9-c763-47ca-83cf-a56008371f09︡
︠a2737f4b-80c0-4d8a-b064-34d0b83ccb6b︠
3**(1/2)
︡aedc81f3-5f5e-40b6-acf2-732482b9963f︡
︠cd444f65-b28a-468f-a6fc-e6fce1c7ae6ei︠
%md
### Diversos tipos de obxectos e números
︡2fc3aec4-6a91-4c23-a046-a88efb984cbb︡{"done":true,"md":"### Diversos tipos de obxectos e números"}
︠cbb9c865-0123-494e-8b72-fcda17a02cabi︠
%md
**Universos**
- Números enteiros, racionais, reais, complexos… (ZZ, QQ, RR, CC)
- Anel simbólico
- Booleano
- ...
︡2166f0f3-a09e-4a43-a4d3-b0b19cc99751︡{"md":"**Universos**\n- Números enteiros, racionais, reais, complexos… (ZZ, QQ, RR, CC)\n- Anel simbólico\n- Booleano\n- ...\n"}︡
︠07f2c1ae-6b68-4db9-9198-2ea467a9f5e3s︠
parent(5)
parent(9/3)
parent(9/5)
parent(sqrt(2))
parent(9.0)
︡aa5c042b-b630-42d4-af56-6aa4f6035bf6︡{"stdout":"Integer Ring\n"}︡{"stdout":"Rational Field\n"}︡{"stdout":"Rational Field\n"}︡{"stdout":"Symbolic Ring\n"}︡{"stdout":"Real Field with 53 bits of precision\n"}︡{"done":true}︡
︠8da3e224-0516-4e29-9205-9cbbe7b6edd1︠
parent(pi)
︡6d928666-08b9-4202-b658-3e4af58b959f︡
︠3ca6384e-060d-4fd6-9846-78d08c6ded7bs︠
3 == 4
︡e0a13de5-8cef-4e39-91eb-75d82f889624︡{"stdout":"False\n"}︡{"done":true}︡
︠6b68290a-8bce-439f-8c59-2a3d04d6c19fs︠
parent(3 == 4)
︡a8d3369a-78b9-44e2-96ce-9c271c29fbda︡{"stdout":"<type 'bool'>\n"}︡{"done":true}︡
︠63abfbea-8e8f-4db5-b0fd-a9a609784ec8s︠
3 < 4
︡31759d3e-a987-4e4b-a425-178c2783ae0a︡{"stdout":"True\n"}︡{"done":true}︡
︠dab9b264-74de-4660-95b1-c1ef52d48d40s︠
parent(3 < 4)
︡ba4dc9a0-4f94-4f5f-a29e-eae2c997a84b︡{"stdout":"<type 'bool'>\n"}︡{"done":true}︡
︠c6b96b63-40c5-4374-a860-c60403bcfc13︠
3 < 4
︡18a7f952-49a6-4aa8-90b8-2ea34dfd1d31︡
︠73d1fcd4-8505-4c5d-9ede-b7c60b7da0bbi︠
%md
**Cálculos numéricos**
1. usar números reais

2. coerción

3. pedir valor aproximado cun determinado número de bits
︡409f52c2-40f6-431b-a634-56d50e563a25︡{"done":true,"md":"**Cálculos numéricos**\n1. usar números reais\n\n2. coerción\n\n3. pedir valor aproximado cun determinado número de bits"}
︠883c080b-3e34-49c4-9663-5672ff546c7di︠
%md
**Nomes dos universos de números máis usuais**
︡a4adc086-3931-48a0-a4e5-e77d0161d170︡{"done":true,"md":"**Nomes dos universos de números máis usuais**"}
︠77608871-dcc5-4390-8e28-2e0c6cc69d3fs︠
ZZ
QQ
RR
CC
GF(2)
GF(25)
︡891ed547-822e-4a4c-a74d-971697c1ee06︡{"stdout":"Integer Ring\n"}︡{"stdout":"Rational Field\n"}︡{"stdout":"Real Field with 53 bits of precision\n"}︡{"stdout":"Complex Field with 53 bits of precision\n"}︡{"stdout":"Finite Field of size 2\n"}︡{"stdout":"Finite Field in z2 of size 5^2\n"}︡{"done":true}︡
︠74874ae8-15d0-434a-90e2-f56dbdd65a4ds︠
RR(9/7)  # forzar que sexa considerado no universo dos números reais
︡dae48898-857b-4e41-8a01-3c128b63c382︡{"stdout":"1.28571428571429\n"}︡{"done":true}︡
︠1019a28c-9450-4dda-a696-b17c7c44b5f2︠
9/7.n()  # valor aproximado
︡e5d12162-530e-4864-91da-b6c36c68dbb7︡
︠70bc6a92-e18f-42dd-a83e-05b256efbf67︠
pi.n()   # 53 bits
︡ffafd183-07d0-492b-ac7d-9943609b8c9a︡
︠54fd006c-9c4c-4880-b6bd-c29069f68a83i︠
%md
Podemos modificar o número de bits para a precisión dos cálculos
︡c1910e04-286f-4c96-9564-2c087eedd275︡{"md":"Podemos modificar o número de bits para a precisión dos cálculos\n"}︡
︠7754f7d1-6ec1-4188-9f32-bf1db990b136︠
pi.n(18)    # 18 bits
︡212f3cc5-8751-421f-bf6f-07360f2f91e1︡
︠815ffc35-d28f-4d4c-b245-f8d0f09509cf︠
RealField(100)(9/7) # 100 bits
︡d058cd87-6189-4183-b3ab-407bc126b71f︡
︠583248c4-c556-4a8e-8217-a119cb51d2d2s︠

︡39aba74e-6e47-4743-8e8f-a310c2a23ef2︡{"done":true}︡
︠ee6e86b6-ed89-4793-955f-0835f8bd4ef1i︠
%md
**Variables**
- tipos:
    - informáticas : **=**
    - matemáticas : *var(' ')*
    - non confundir con *constantes matemáticas* : (*pi, e, i* ...)
- nomes:
    - combinacións de letras, números e guións baixos
    - non poden conter espacios
    - non poden comezar por número
    - non poden ser palabras reservadas (*while, if, sum, bin* ...)
    - si poden ser nomes de constantes matemáticas (*pi, e, ...*) pero non é aconsellable
- eliminación : *reset('nome')*
︡6a337dab-1ede-4726-a4fc-19bfa9d499db︡︡{"done":true,"md":"**Variables**\n- tipos:\n    - informáticas : **=**\n    - matemáticas : *var(' ')*\n    - non confundir con *constantes matemáticas* : (*pi, e, i* ...)\n- nomes:\n    - combinacións de letras, números e guións baixos\n    - non poden conter espacios\n    - non poden comezar por número\n    - non poden ser palabras reservadas (*while, if, sum, bin* ...)\n    - si poden ser nomes de constantes matemáticas (*pi, e, ...*) pero non é aconsellable\n- eliminación : *reset('nome')*"}
︠aee57fb5-de26-434c-991b-c5d87f51d392︠
numero = 3                   # crea a variable numero e asígnalle o valor 3
︡45b4974e-43b8-4d7f-963f-ad96f409db4e︡
︠0ccad998-862a-4f67-95fa-50ab53bb5416︠
parent(numero)
︡7902d717-a471-4f1b-b894-de27838e1f50︡
︠0c2fd67f-205d-4485-9514-24e4775a0e8a︠
frase = 'calquera cousa que se che ocorra'
︡910eee46-eb9e-4513-b8ab-948d0a6898bc︡
︠325d7dff-240c-456f-a942-7f38e34e7351︠
frase
︡11e6e895-6f77-41e0-aaa5-daf9fc097e25︡
︠b8cd2e2e-60df-44b0-927a-04783acf8eb2︠
print(frase)
︡cbb30da2-fcbc-442d-878f-a4921fb28163︡
︠cb60a0f2-699c-460a-b4bd-cbb2d08bc00c︠
parent(frase)
︡66285e99-1461-4b03-ac6c-c9e022f2a760︡
︠2f83a78b-713d-48f5-a553-db8f3a789052︠
x = var('x')
︡2d0896b2-3687-4a9f-9099-e90118b528e0︡
︠88ee047d-956e-4206-a9b2-d976ef58a022︠
x**numero
︡239152e9-a13c-4dd6-8f28-03cf0cf77494︡
︠36c9d371-2b67-4812-bc3f-84604be82f7e︠
numero2 = 7
︡202cc73a-eacf-432c-8a4c-fdf5a8744eab︡
︠8111a217-7230-4f48-a2db-82ba1bae7290︠
numero + numero2
︡368bad79-1923-489a-ae57-e9fd1a7af9a9︡
︠aa09e6c4-5050-4bfa-a994-db6058fb8497︠
reset('numero2')             # ollo que o nome da variable vai entre '  '
︡a5f0f407-2679-4669-a620-d4a2099851e3︡
︠7ab2de30-6f98-40b9-bb3c-e7c05caac911︠
numero2
︡8d4e7595-308c-4ca2-bd0b-fa4d37bc3b46︡
︠2720d828-cbcb-44b8-a4e8-7cf7b8e82bc0︠
x, y = var('x y')            # creación simultánea de dúas variables matemáticas,  Tamén valería    var ('x, y')
︡afa0d059-e4a6-425c-bea5-e3e8e71b7f15︡
︠4a41b3bb-662a-4f78-afbd-a166cfa6ff9f︠
pol = (x + y)^2              # creamos unha nova variable informática
︡75ac10df-5d3a-4b4a-aed2-7711aa91170a︡
︠6925b07b-d49e-4d09-b7c7-581e89ff4973︠
pol.expand()                 # exemplo de método que se lle pode aplicar a esta variable
︡2960e12a-b934-4f5f-b5f4-d0f519498355︡
︠502857f0-453d-4be7-9450-9d44dc56e4f4︠
latex(pol)                   # danos o código LaTex
︡6e6f59c8-1c81-4740-bccf-6f72a1c96735︡
︠7230fc95-97cc-417c-9ecb-2069d6bd86b2︠
sin(x+y).simplify_trig()     # exemplo de cálculo simbólico en Sage
︡9000a578-a864-492b-b190-9012c5f70fdf︡
︠2e67973b-ac35-453d-a9b8-12baeaeb5445︠
tan(x+y).simplify_trig()
︡115698b7-65cd-4ac5-9873-14ff88754bd1︡
︠731d5245-b6cb-44c7-8c8f-36be1b572508︠
show(tan(x+y).simplify_trig())  # maneira de obter a representación matemática bidimensional
︡4ba3a5a8-3291-4781-aa48-b7d065ed6947︡
︠1bdaef75-7e4c-4f06-a077-add13b5a29d1︠
typeset_mode(true)           # podemos forzar a que todas as saída matemáticas sexa bidimensionais
︡8fd55c46-813d-42ac-9ee7-f98c5a96c623︡
︠83bcffef-edbe-4296-bac9-12435daa1706i︠
%md
Para volver á representación linear, **type_set(false)**
︡8c8c79d6-fd96-4404-9c28-cb47e7d37cff︡{"md":"Para volver á representación linear, **type_set(false)**\n"}︡
︠21777877-6d89-4e0c-9dc0-a2b53d7eaa3e︠
log(e)
︡f4a47f9d-0415-47fa-8935-aca44ec05b7f︡
︠8fedb650-a532-44b0-803a-972804a9cf0cs︠
sin(pi)
︡c6e684e0-0510-40a1-bf4c-c1072c8ad2ad︡{"stdout":"0\n"}︡{"done":true}︡
︠ea3f4e45-9008-4001-87c8-7cb3f78eb6b4s︠
tan?
︡1f5349ac-c030-46f9-8e49-687882100b74︡{"code":{"filename":null,"lineno":-1,"mode":"text/x-rst","source":"File: /ext/sage/sage-8.3_1804/local/lib/python2.7/site-packages/sage/functions/trig.py\nSignature : tan(self, coerce=True, hold=False, dont_call_method_on_arg=False, *args)\nDocstring :\nThe tangent function.\n\nEXAMPLES:\n\n   sage: tan(pi)\n   0\n   sage: tan(3.1415)\n   -0.0000926535900581913\n   sage: tan(3.1415/4)\n   0.999953674278156\n   sage: tan(pi/4)\n   1\n   sage: tan(1/2)\n   tan(1/2)\n   sage: RR(tan(1/2))\n   0.546302489843790\n\nWe can prevent evaluation using the \"hold\" parameter:\n\n   sage: tan(pi/4,hold=True)\n   tan(1/4*pi)\n\nTo then evaluate again, we currently must use Maxima via\n\"sage.symbolic.expression.Expression.simplify()\":\n\n   sage: a = tan(pi/4,hold=True); a.simplify()\n   1\n\nIf possible, the argument is also reduced modulo the period length\npi, and well-known identities are directly evaluated:\n\n   sage: k = var('k', domain='integer')\n   sage: tan(1 + 2*k*pi)\n   tan(1)\n   sage: tan(k*pi)\n   0"}}︡{"done":true}︡
︠ab300e5b-8660-4fa2-a3d5-a8571d8ae4cei︠
%md
**Axuda**
- **...?**
- **...** + **< tab >**
︡78c9f77e-64fb-416a-b2f3-34435c19e76c︡{"md":"**Axuda**\n- **...?**\n- **...** + **< tab >**\n"}︡
︠92d19f2d-892d-4b04-bd41-aba18c0db11c︠
tan?
︡052aa80f-5e91-420e-88a7-e7db6303d0e3︡
︠e4991450-5461-4c03-bb3d-fc7569d947c9i︠
%md
http://www-rohan.sdsu.edu/~mosulliv/sagetutorial/sageprog.html
︡2ba7db82-29cc-4057-b2e9-1313c1ec11f7︡{"md":"http://www-rohan.sdsu.edu/~mosulliv/sagetutorial/sageprog.html\n"}︡
︠0c4d474e-cfb5-4477-9994-ff69001ef2cci︠
%md
**Listas**
- creación :  [ ]
- obtención de información (lonxitude, elementos, sublistas, posición de elementos, veces que aparece un elemento, ...)

︡64caa684-83bf-4b95-bab0-b9df34011b0e︡{"md":"**Listas**\n- creación :  [ ]\n- obtención de información (lonxitude, elementos, sublistas, posición de elementos, veces que aparece un elemento, ...)\n\n"}︡
︠e7eb9310-1924-47e4-81eb-a447cdc89049︠
l = [3,5,3,1,6]
l
︡665a3628-2227-434a-8ba7-2a04e66a8e12︡
︠4ea79bf4-bb6b-41e0-933c-ef03ac81f394︠
len(l)
︡30a46ed0-2f24-4048-93ae-64f6a2d25d28︡{"stdout":"5\n"}︡
︠df7bda2d-b7d5-4ab7-99ab-2188c2745674︠
l[0]
l[1]
l[2]
l[3]
l[4]
︡cd419345-913d-4f0a-a67e-25798b601162︡
︠21ed19da-ef3a-49e9-b7f2-9870563a060d︠
l[-2]
l[-3]
︡c0a50d50-4605-4b2d-ba3c-1216142c370e︡
︠34bf510c-2628-4ae6-8dd4-16a73fcc656f︠
L = ['ouros', 'copas', 'espadas', 'bastos']  # as listas non só son de números
L
︡3befeb3d-3685-4590-80ef-35c731807d75︡
︠8dfb82ab-d1f5-45ae-a557-fc1a85cf73da︠
L[2]
︡8da800dc-56fb-462c-801f-0052681157c0︡
︠7618e18c-bc69-44e9-bd13-aeec31d20c58︠
L.index('copas')
︡ebc2b8a9-f772-42a5-805d-815f215d3d29︡
︠7f11967a-e627-49f1-8538-a93287169ad0︠
l.index(3)
︡650ca782-bae4-4bef-8123-68cd6027a08f︡
︠542279ac-4280-4c52-b0b7-cafa88713d22︠
l.index(7)
︡289339e6-0bd9-46db-8dbf-d06c9575c774︡
︠1ff9bcd1-706e-4aed-8d1b-37b6af58288e︠
l.count(3)
︡37d0e422-6215-42a8-877d-28583f70157c︡
︠95796b87-3fdc-497e-8acf-646c4d5db683︠
[5, [2,1], l]
︡4f4ee67b-6fbc-484c-b79d-91b1a1e250d9︡
︠4630c052-f258-407f-a6b9-c68cca9adb01︠
parent(L)
︡b29b7a2a-4581-47c3-ab67-b5aad4f1aa93︡
︠3021b6e4-468c-49bd-ae45-0591d4820216︠
parent(L[0])
︡61f9afb3-4202-48eb-b7aa-d7b8e12f4073︡
︠4107464b-1ec3-41d9-9e87-5a9c5dc11b23︠
parent(l[2])
︡34242b00-def6-4d0e-80ac-5c2702fcd28e︡
︠8a361ddd-e0a0-4e50-bbce-be70e48cf475︠
l[1:2]
l[1:3]
l[2:]
l[:2]
l[2:2]
l[:]
︡13566dc1-d55d-4aa3-a7d6-64e7ec6c4d5e︡
︠59ca517b-7b57-4aa7-aa3e-d02123c406b0︠
l[-3:-1]
l[-2:]
l[:-2]
l[-2:-2]
︡2df513de-baaf-4744-806a-dc8d04e7c0ce︡
︠903abf3a-7bf1-4895-87e6-2613bb91d088i︠
%md
**Algunhas listas de números**
︡a62ef9a6-ff90-402f-b751-12348da1394a︡{"md":"**Algunhas listas de números**\n"}︡
︠12f47ba9-c7e1-4202-b893-6268cd1be4c1︠
range(13)  # os trece primeiros números, comezando en 0
︡9521b954-9546-48c0-8f81-e6292b7051d6︡
︠ca67bc55-ba27-4d00-9906-591930a5b6df︠
[2..12]  # os números entre 2 e 12
︡174b3ab3-7934-4ed6-9336-1fdb704c97d9︡
︠c83e945f-2ae0-4efb-8247-6d6d26736acb︠
[2,5..12]  # os números menores ou iguales a 12 comezando en 2 e sumándolle 5-2 ao anterior
︡ac5f0208-9182-463f-abd8-8605ee79f2f0︡
︠866b4c76-10b2-4dd7-bf9e-09ac309c43cei︠
%md
**Manipulación de listas**
- ordear unha lista : ***sort***
- modificar un elemento dunha lista
- operar cos elementos dunha lista : ***sum*** e ***prod***
- engadir elementos a unha lista : ***append***
- concatenar dúas listas : ***extend***
- intercalar os elementos de dúas listas : ***zip***
︡59135476-9198-4b0a-8679-aeeb7f6b13b2︡{"md":"**Manipulación de listas**\n- ordear unha lista : ***sort***\n- modificar un elemento dunha lista\n- operar cos elementos dunha lista : ***sum*** e ***prod***\n- engadir elementos a unha lista : ***append***\n- concatenar dúas listas : ***extend***\n- intercalar os elementos de dúas listas : ***zip***\n"}︡
︠9c8ff92c-9984-4b7c-b53d-32fce65ebf4f︠
L
︠da30ed4a-3ee3-457e-9fbc-2dd1870ae103︠
L.sort();L
︠ab921d41-9888-467d-a83e-3e079c334091︠
L = ['ouros', 'copas', 'espadas', 'bastos'];L
︠b393cf3b-7250-407f-9349-e938153b9cb3︠
M = L[:];M.sort();M;L
︠b7cbbf4c-3ebe-4f65-8be7-4254bc26cdd3︠
Lc = L[:]; Lc[0]='oros';Lc
︠b3746349-fa38-4fbf-8aea-b138c40e8270︠
l
︠a1d6f5c4-f996-4350-a59e-fa53053096bd︠
sum(l)
︠a0bb23e5-f4e1-408c-aa8a-b7e675133889︠
prod(l)
︠75df3d17-0caf-4aab-952d-85b50a23b126︠
sum[1..10] # suma dos números do 1 ao 10
︠7d4669e0-4c79-4f7c-ac56-28ba02b68fac︠
sum([10,12..99]) # suma dos números pares de 2 cifras
︠79212e8a-3242-4a42-8e59-2362aab7aa88︠
l.append(10);l
︠f1458aba-802d-4ddf-ab73-5b0b62bf24c1︠
Lc.extend([1..4]); Lc
︠849643a2-208a-4ebe-b45e-36fd26e859d0︠
zip(L,[1..4])
︠cd7500c9-edb1-484c-ab44-5b7bfd8ff43e︠
zip([1..3],L)
︠8d6c6b9b-cb49-4d20-a46d-90fd49131400︠
[3,2*3..100]
︠47078e0e-9542-461c-b218-23e2ceb741a6︠
sum([102,105..999]) # suma dos múltiplos de 3 con 3 cifras
︠77910f68-2eed-4b08-912c-ed181659763b︠









