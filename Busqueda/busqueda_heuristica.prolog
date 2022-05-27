/* ==================================================================================
 * Busqueda no informada
 * 
 * - Solo se aporta como informacion la definicion del problema
 * - Solo se puede ir generando nodos y comporbando si alguno de ellos es la solucion
 *      al problema
 * -Los algoritmos se diferencias enc uanto al siguiente nodo a espandir
 * ==================================================================================
 * Busqueda Informada
 * 
 * - Basada en busqueda de costo uniforme.
 * - Selecciona el siguiente nodo a expandir mediante una funcion de evaluacion f(n)
 *      que se implementa dentro de la lista de prioridad.
 * 
 * 
 * 
 * ==================================================================================
 * Busqueda Heuristica
 * 
 * Tambien llamada: Funcion heurística, heurística
 * 
 * Es una tecnica diseñada para resolver un problema mas rapidamente cuando los 
 * métodos clasicos son demasiado lentos o encontrar una solución aproximada 
 * cuando los métodos clasicos no logran encontrar una solucion exacta.
 * 
 * Esto se logra intercambiando optimización, integridad, exactitud o precisión 
 * por velocidad.
 * 
 * Podriamos llamarlo un ATAJO.
 * 
 * Una función heurística clasifica las alternativas en los algoritmos de búsqueda
 * en cada paso de la bifurcación en función de la información posible.
 * Para decidir que rama seguir.
 * 
 * objetivo: producir una solución en un marco de tiempo razonable que sea suficientemente 
 * bueno para resolver el problema, puede no ser la mejor solución, simplemente puede
 * aproximarse. 
 * 
 * ==================================================================================
 * Criterios para decidir si usar una heurística para resolver un problema:
 * -Optimalidad.
 * -Completitud.
 * -Exactitud o Precisión.
 * -Tiempo de ejecución.
 * 
 * ==================================================================================
 * Caracteristicas que la busqueda:
 * 
 * Conjunto de estados: comprenden todas las configuraciones posibles de un dominio.
 * 
 * Estados iniciales: estados donde empieza el análisis
 * 
 * Estados finales: las soluciones del problema.
 * 
 * Operadores: se aplican para pasar de un estado a otro.
 * 
 * Solucionador: mecanísmo de nos permite evolucionar de un estado a otro a través de 
 *              un algoritmo. Se siguen los siguientes pasos:
 *              
 *         1- Elegir estado a explorar.
 *         2- Establecer operador que trabaje sobre el estado elegido.
 *         3- Comprobar si el resultado obtenido es un estado final. Caso contrario,
 *            regresar al estado anterior.
 * 
 * La técnica de la busqueda heurística o busqueda en el espacio de estados
 * (space-state search).
 * 
 * Una familia de tecnicas para la solución de problemas, que enumeran el espacio de 
 * estados de cada problema para recorrerlo, desde un estado inicial hasta un estado meta.
 * 
 * El recorrido, desde el estado inicial hasta el estado meta, constituye una solución
 * al problema planteado.
 * ==================================================================================
 * Estategia general de busqueda en prolog:
 *  
 * busca(Agenda,EdoInicial,EdoMeta):-
 *                             sig_revision(Agenda,Edo),
 *                             meta(Edo).
 * busca(Agenda,EdiInicial,EdoMeta):-
 *                             sig_revision(Agenda,EdoActual),
 *                             sucesores(EdoActual,Suc),
 *                             valida_y_filtra(Suc,Suc2),
 *                             anadir(Suc2,NuevaAgenda),
 *                             busca(NuevaAgenda,EdoMeta).
 * 
 * 
 */
%===========================Retomando ejemplo pasado========================
%===========================Declarando las aristas existentes========================
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

navegar(A,A,_,[A]).
navegar(A,B,_,[A,B]):-arco(A,B).
navegar(A,B,Mem,[A|Ruta]):-arco(A,Z), % buscamos a un posible nodo intermediario
                        Z \== B, % Verificamos que Z y B sean diferentes.
                        \+ member(Z, Mem), % que Z no forme parte de los nodos recorridos
                        navegar(Z,B,[Z|Mem],Ruta). % se agrega Z a la memoria y se manda el resto de la ruta.
rutaH(A,B,Ruta):-navegar(A,B,[],Ruta).

%==================Salida de la consola, semejandose a las ramas de un arbol==========
/*
?- consult('busqueda_heuristica1.prolog').
true.

?- rutaH(f,a,R).
R = [f, c, e, a] ;  %rama
R = [f, e, a] ;    $rama
R = [f, g, c, e, a] ; %rama 
false.

?- 
*/