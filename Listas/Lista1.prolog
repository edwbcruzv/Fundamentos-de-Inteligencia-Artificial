% Elaborado por Edwin Bernardo Cruz Villalba.
% Ing. en Sitemas Computacionales, ESCOM IPN.

% Github:edwbcruzv.


% Fundamentos de Inteligencia Artificial.
% Tarea 2: Lista de ejercicios.

/*|Construya predicados Prolog, etiquetados como se indica con color azul en cada
problema y que resuelvan las tareas solicitadas. Respete las restricciones marcadas
entre corchetes y coteje contra los ejemplos proporcionados en cada problema.   */

/*  1) [] contiene_numero/1. Verificar si una lista contiene algún elemento numérico.   */
% Si el elemento es un numero.
contiene_numero(Elem):-number(Elem),!.
% Si el elemento es un numero y si se puede seguir comparando.
contiene_numero([X|Resto]):-number(X);contiene_numero(Resto),!.

                    /* Pruebas
                    ?- contiene_numero([c,b,g]).
                    false.

                    ?- contiene_numero([c,584,b,g]).
                    true .

                    ?- contiene_numero([c,584,b,g,[g,y,k]]).
                    true .

                    ?- contiene_numero([c,b,g,[g,y,k]]).
                    false.

                    ?- contiene_numero([c,b,g,[g,51,y,k]]).
                    false.

                    ?- contiene_numero(25).
                    false.
                    */


/*  2) []inserta_ceros/2. Intercalar ceros después de cada elemento original.   */
% Cuando no hay elementos en la lista.
inserta_ceros([],[]):-!.
% Se toma la cabeza de la lista principal y forma parte de la lista de respuesta incluyendo el cero.
inserta_ceros([Elem|Resto],[Elem,0|R]):-inserta_ceros(Resto,R).
                    /*
                    ?- inserta_ceros([1,2,3,4],R).
                    R = [1, 0, 2, 0, 3, 0, 4, 0].

                    ?- inserta_ceros([si,[2,no,qwe,0],pal,2451,"cad"],R).
                    R = [si, 0, [2, no, qwe, 0], 0, pal, 0, 2451, 0, "cad"|...].
                    */
/*  3) [sin usar append] rota/3. Rotar los elementos de una lista algún
número de posiciones hacia  la  derecha. rota(<lista>, <n>, <respuesta>).    */

% Cuando se termina de recorer la lista1, la lista2 se agrega como resto2
join([],L2,L2):-!.
% Se apunta siempre el en Resto2 mientras la cabeza se llena.
join([Elem1|Resto1],L2,[Elem1|Resto2]):-join(Resto1,L2,Resto2). 
% rota_izquierda([Cabeza|Resto2],0,[Cabeza|[Cabeza2|Resto2]]).
rota_aux1(_,0,[]):-!.
rota_aux1([Cabeza|Resto],N,[Cabeza|Resto2]):-Num is N-1,
                rota_aux1(Resto,Num,Resto2).

% rota_izquierda(L,N,R):-rota_aux1(L,N,R)

/*  4) [sin usar reverse, ni append] reversa_simple/2. Invertir una lista.
reversa_simple(<lista>, <respuesta>). */
% Cuando la lista esta vacia
reversa_simple([],_):-!.
% Se llega al final de la lista y en el regreso recursivo se van encolando los elementos
reversa_simple([Elem|Resto],R):-reversa_simple(Resto,Cabeza),join(Cabeza,[Elem],R).

                    /*
                    ?- reversa_simple([1,2,3,4,5],R).
                    R = [5, 4, 3, 2, 1] .

                    ?- reversa_simple([1,["cadena",fbfb,d,2548],vbhbv,1254,cad,[65,[2548,24],54454]],R).
                    R = [[65, [2548, 24], 54454], cad, 1254, vbhbv, ["cadena", fbfb, d, 2548], 1] 
                    */
                    /*
5) [sin usar select] inserta_en/4.  Insertar un término arbitrario en alguna
posición específica de una lista. inserta_en(<término>, <lista>, <posición>, <resultado>).  */
% Al llegar al indice indicado se hace la insercion correspondiente
inserta_en(Elem,Resto1,0,[Elem|Resto1]):-!.
% Se hace la llamada recursiva hasta encontrar la posicion correcta
inserta_en(Elem,[Cabeza1|Resto1],N,[Cabeza1|Resto2]):-Num is N-1,inserta_en(Elem,Resto1,Num,Resto2).

                    /*
                    ?- inserta_en(pal,[1,2,3,4,5],6,R).
                    false.

                    ?- inserta_en(pal,[1,2,3,4,5],2,R).
                    R = [1, 2, pal, 3, 4, 5] .

                    ?- inserta_en(pal,[1,2,3,4,5],5,R).
                    R = [1, 2, 3, 4, 5, pal] .

                    ?- inserta_en("cad",[njfbg,[25,14],nvj,2,[6,[8,2],qwe,djbv],"pal"],5,R).
                    R = [njfbg, [25, 14], nvj, 2, [6, [8, 2], qwe, djbv], "cad", "pal"] .
                    */
/*
6) [] promedio_parcial/3.  Calcular el promedio (media aritmética) de los
primeros n elementos de una lista. promedio_parcial(<lista>, <n>, <resultado>). */
% Primero creamos un predicado que se encargue de hacer la suma de los elementos de una lista.
% Se termina de hacer la suma hasta el indice que se indico y se "inicializa" R en 0.
promedio_suma(_,0,R):-R is 0,!.
% Buscamos la posicion indicada  y en el regreso recursivo se hace la suma de los elementos.
promedio_suma([Elem|Resto],N,R):-number(Elem),
                Num is N-1,
                promedio_suma(Resto,Num,Aux),
                R is Elem + Aux.
% Al tener el resultado de la suma se hace la division para obtener el promedio.
promedio_parcial(L,N,R):-
                promedio_suma(L,N,Aux),
                R is Aux/N.
                    /*
                    ?- promedio_parcial([10,4,6,1,1,1],7,R).
                    false.

                    ?- promedio_parcial([10,4,6,1,1,1],4,R).
                    regreso
                    R = 5.25.

                    ?- promedio_parcial([10,pal,6,1,1,1],3,R).
                    false.
                    */

/*  7) [sin optimizar] fibonacci/2.  Calcular cada término en la serie de Fibonacci.
fibonacci(<n>, <resultado>).*/
% Caso base.
fibonacci(0,0):-!.
% Caso base.
fibonacci(1,1):-!.
% Caso recursivo.
fibonacci(N,R):-N1 is N-1,N2 is N-2,fibonacci(N1,R1),fibonacci(N2,R2),R is R1 + R2.
                    /*
                    ?- fibonacci(8,R).
                    R = 21.

                    ?- fibonacci(10,R).
                    R = 55.

                    ?- fibonacci(20,R).
                    R = 6765.
                    */
/*
8) []  simplifica/2.  Eliminar de una lista todos los elementos que se
encuentren  duplicados. simplifica(<lista>, <resultado>).*/
% Cuando este vacia la lista analizada.
elimina_elem(_,[],[]):-!.
% Al encontrar el elemento lo eliminamos de la lista.
elimina_elem(Elem,[Cabeza|Resto],R):-Elem == Cabeza,elimina_elem(Elem,Resto,R),!. 
% El elemento comparado anteriormente pasa a ser parte de la respuesta y seguimos comparando.
elimina_elem(Elem,[Cabeza|Resto],[Cabeza|Resto2]):-elimina_elem(Elem,Resto,Resto2),!.



simplifica([],[]):-!.
simplifica([Elem|Resto],R):-simplifica(Resto,R),
            elimina_elem(Elem,Resto,R),write(Elem+Resto+R).
            

/*
elimina_elem(a,[a,b,1,2,c,a,2,1,4,0],R).
*/
/*
9) []  depura/2.  Eliminar    de    una    lista    todos    los    elementos    que    NO    se
encuentren  duplicados, cuando  menos,  una  vez.
depura(<lista>, <resultado>).   */

% Cuando este vacia la lista analizada.
elimina_elem2(_,[],[]):-!.
% 
elimina_elem2(Elem,[Cabeza|Resto],[Cabeza|Resto2]):-Elem == Cabeza,elimina_elem2(Elem,Resto,Resto2),!.
%
elimina_elem2(Elem,[_|Resto],R):-elimina_elem2(Elem,Resto,R),!. 
% 
/*
elimina_elem2(a,[a,b,1,2,c,a,2,1,4,0],R).
*/
/*
10) [] maximo/2. Identificar  el  mayor  valor  de  entre  aquellos  contenidos  en
una  lista.
maximo(<lista>, <resultado>).
*/
maximo([Elem],Elem):-!.
maximo([Elem1,Elem2|Resto],R):-number(Elem1),
                number(Elem2),
                Elem1 >= Elem2,
                maximo([Elem1|Resto],R),!. 
maximo([Elem1,Elem2|Resto],R):-number(Elem1),
                number(Elem2),
                maximo([Elem2|Resto],R). 

                    /*
                    ?- maximo([8,7,6,5,4,3,2,1],R).
                    R = 8.

                    ?- maximo([1,2,3,4,5,6,7,8],R).
                    R = 8.

                    ?- maximo([17,148,3,62,51,95,74,30,0,64,8,1,8],R).
                    R = 148.

                    ?- maximo([17,148,hbhb,'kik',64,8,1,8],R).
                    false.
                    */