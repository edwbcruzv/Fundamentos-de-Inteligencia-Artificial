/* ==================================================================================
 * Busqueda primero a lo profundo (Depth first search)
 * 
 * Se usa en estructuras de datos de argoles o grafos.
 * Empieza en el nodo raiz y explora a lo lejos posible a lo largo de cada rama de
 * arriba hacia abajo, pasando por cada nodo.
 * 
 * Para la frontera de busqueda de usa una pila (LIFO) o recursion. (Agenda)
 * 
 * - Se expande nodo raiz.
 * - Luego, uno de sus hijos.
 * - Luego, uno de sus hijos del hijo, etc.
 * - Cuando se llegue  a una hoja, si no es solucion, se retrocede y se pueba con
 *     el siguiente hijo.
 * 
 * Se expande el nodo mas profundo de la frontera
 * 
 * Completo: si evita caminos redundantes y el espacio de estados es finito.
 * (evitar caminos repetidos no evita caminos redundantes)
 * 
 * Optimo: no, puede encontrar otras soluciones antes del optimo.
 * 
 * 
 * Ventajas: Ocupa muy poco espacio
 * 
 * Desventajas: No es completa ni optima
 * Puebe probar caminos inutiles
 * Puede quedar atrapado en bucles infinitos
 * Costo constante no negativo
 * Solo aplica para problemas simples
 * 
 * ----------------------------------------------------------------------------------
 * Algoritmo DFS en prolog:
 * 
 * Para encontrar una ruta de una solucion "Sol", desde un nodo dado "N" a algun
 *  objetivo:
 * 
 * -Si N es un nodo objetivo, entonces Sol = N.
 * 
 * -Si hay un nodo sucesor N1 de N, tal que hay un camino Sol1 desde N1
 *  a un nodo objetivo, entonces Sol=[N|Sol1] 
 * 
 * % --------------Cuando el grafo o arbol no tenga ciclos--------------
 * solucion(N,[N]):-edo_meta(N) % se ha llegado a un estado meta
 * solucion(N,[N|Sol1]):- sucesor(N,N1), % N1 es sucesor de N
 *                         solucion(N1,Sol1). % Continua con el trazo de la ruta
 * solucion(N,Solucion). %invocacion

 * % --------------Cuando el grafo o arbol tenga ciclos--------------
 * 
 * depth_first(Ruta,N,[N|Ruta]):-edo_meta(N).
 * depth_first(Ruta,N,Solucion):-sucesor(N,N1), % se busca el sucesor de Nodo actual
 *                              \+member(N1,Ruta) % se verifica que no hayamos pasado por N, previniendo el ciclo
 *                              depth_first([N,Ruta],N1,Solucion). % Continuamos con la busqueda
 * resolver(Nodo,Sol):- depth_first([],Nodo,Sol). %invocacion
 * 
 * %------------------Limitando la profundidad---------------------
 * depth_first2(N,[N|_]):-edo_meta(N).
 * depth_first2(N,[N|Solucion],Max_Depth):-Max_Depth > 0, % se indicara cuantos niveles queremos bajar
 *                                      sucesor(N,N1), % se busca el sucesor de Nodo actual
 *                                      Max_Depth_Aux is Max_Depth - 1, % disminuyendo contador
 *                                      depth_first2(N1,Solucion,Max_Depth_Aux). % Continuamos con la busqueda
 * depth_first2(N,Solucion,Max_Depth). %invocacion
 * ==================================================================================
 */





