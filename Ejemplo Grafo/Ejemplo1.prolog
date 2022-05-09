/*
 * Un grafo sin importar si es dirigido o no, etiquetado
 * o no, puede ser representado en prolog de varias formas
 * 
 * Se puede seguir la estructura de la definicion formal y 
 * replicarla en una lista, usando parejas
 *      
 *      G=<V,A>
 *      
 *      [[a,b,c,d,e,f,g],
 *      [[a,b],[a,f],[b,c]],[c,d],[c,e],[e,d],[f,c],[f,e],[f,g],[g,c]]
 * 
 * o con un predicado
 * 
 * vertice(a,[d,f]).
 * vertice(b,[c]).
 * vertice(c,[d,e]).
 * vertice(e,[d]).
 * vertice(f,[c,e,g]).
 * vertice(g,[c]).
 * 
 * LA siguiente dorma es la mas utilizada, sin usar predicados y 
 * representando cada grafo en una lista conteniendo las parejas
 *              vertice-vertices_adyacentes
 * 
 * [a-[d,f],b-[c],c-[d,e],e-[d],f-[c,e,g],g-[c]]
 * 
 * A esta forma se le conoce como S-representation o representacion 
 * simbolica
 * 
 */

%=====================Declarando las aristas existentes=====================
arco(a,b).
arco(a,f).
arco(b,c).
arco(c,d).
arco(c,e).
arco(e,d).
arco(f,c).
arco(f,e).
arco(f,g).
arco(g,c).
%==============================agregando ciclos======================================
arco(e,a). 
arco(b,b).
arco(d,g).
%====================================================================================
% Definiendo el predicado para averiguar la navegabilidad 
% pero solo obtendremos true o false.
%====================================================================================
conecta(V,V). % el mismo nodo
conecta(V1,V2):-arco(V1,V2). % arco directo a ambos nodos (unidireccional)
% conecta(V1,V2):-arco(V1,V2);arco(V2,V1). % arco directo a ambos nodos (bidireccional)
conecta(V1,V2):-arco(V1,Z),conecta(Z,V2). % existe un intermediario

%=====================necesitamos obtener los nodos por donde pasamos================ 
ruta(V,V,[V]). % el mismo nodo
ruta(V1,V2,[V1,V2]):-arco(V1,V2). % arco directo a ambos nodos (unidireccional)
ruta(V1,V2,[V1|Resto]):-arco(V1,Z),ruta(Z,V2,Resto). % existe un intermediario

%====================================================================================
% Para evitar problemas y se quede ciclando entramos al concepto del camino hamiltoniano
% Necesitamos una lista auxiliar que almacene los vertices que ya pasamos
% y que constantemente revise que vertices no estan en la lista auxiliar.
%====================================================================================
%           navergar(<origen>,<destino>,<visitados>,<ruta>).

navegar2(A,A,_,[A]).
navegar2(A,B,_,[A,B]):-arco(A,B).
navegar2(A,B,Mem,[A|Ruta]):-arco(A,Z), % buscamos a un posible nodo intermediario
                        Z \== B, % Verificamos que Z y B sean diferentes.
                        \+ member(Z, Mem), % que Z no forme parte de los nodos recorridos
                        navegar2(Z,B,[Z|Mem],Ruta). % se agrega Z a la memoria y se manda el resto de la ruta.
rutaH(A,B,Ruta):-navegar2(A,B,[],Ruta).

%=====================Para almacenar los resultados en una lista=====================
calcula_rutas(A,B,Rutas):-findall(R, rutaH(A,B,R), Rutas).

%=====================Para encontrar la ruta mas corta de la lista que ya tenemos====

ruta_corta([R],R).
ruta_corta(Rutas,R):-maplist(length, Rutas, Len_List), % se calculan todas las longitudes de las listas de rutas y se unifican en Len
                    min_list(Len_List, Min), % se busca el numero mas pequeño de la lista Len
                    member(R, Rutas),
                    length(R,Min).

%=====================Encontrando las mejors rutas===================================
mejor_ruta(A,B,Mejor):-calcula_rutas(A,B,Rutas),
                    ruta_corta(Rutas,Mejor).
                    
mejores_rutas(A,B,Mejores):-findall(Mejor,mejor_ruta(A,B,Mejor),Mejores).
