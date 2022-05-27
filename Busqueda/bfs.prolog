/* ==================================================================================
 * Busqueda primero a lo ancho (Breath first search)
 * 
 * Se usa en estructuras de datos de argoles o grafos.
 * Empieza en el nodo raiz y explora a lo ancho del arbol y termina hasta los nodos
 * raiz en lo profundo.
 * 
 * Para la frontera de busqueda de usa una cola (FIFO). (Agenda)
 * 
 * -Se expande el nodo raiz.
 * -Luego, todos sus nodos hijos.
 * -Luego, los hijos de los hijos, asi hasta econtrar la solucion.
 * 
 * Se expande cada nivel antes de expandir los del siguiente nivel.
 * 
 * Completo: si, si existe solucion, la encuentra, Comprueba si un nodo es la 
 * solucion cuando se genera y no cuando se expande.
 * 
 * Optimo: si, porque la solucion encontrada es la mas superficial 
 * (condicion: coste de acciones iguales y no negativos)
 * 
 * Ventajas:
 * -Si hay solucion, la encuentra.
 * 
 * Desventajas:
 * -Expande muchos nodos inutiles.
 * -Orden exponencial en espacio.
 * -Coste constante y no negativo.
 * -Solo para problemas muy simples.
 * 
 * ==================================================================================
 * Algoritmo BFS en prolog:
 * 
 * Para realizar una busqueda a lo ancho se necesita primero, una lista(cola) de 
 * rutas candidatas:
 * 
 * -si la cabeza de la primera ruta es el estado objetivo, entonces esta ruta 
 *      es la solucion.
 * -si no, eliminar la primera ruta de la lista(cola) de rutas candidatas y agregar 
 *      una lista de todos todas las posibles extensiones de paso de esa ruta y 
 *      agregar al final(formar) esa lista a la lista(cola) de rutas candidatas, 
 *      y ejecutar la busqueda de ancho sobre la nueva lista creada.
 * 
 * ----------------------------------------------------------------------------
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
*/