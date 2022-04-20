/*
 * Solo 3 casas, 2 atributos y 3 pistas.
* 1) el español vive junto a la casa roja.
* 2) El noruego vive en la casa azul.
* 3) Un italiano vive en la segunda casa.
 * 
 * 
 * ================================================================
 * Tenemos 3 casas con la sig estructura:
 * 
 * V=[[<color>,<pais>],[_,_],[_,_]]
 * 
 * El vecindario sera una lista (de longitud 3) de casas
 * 
 * Formalizamos el concepto de que una casa se encuentra "junto a" otra casa
 * dentro de una lista:
 * 		junto(C1,C2,Lista):-append(_,[C1,C2|_],Lista).
 * 		junto(C1,C2,Lista):-append(_,[C2,C1|_],Lista).
 * 
 * Ahora, definimos el vecindario como una lista de longitud 3 y que contiene 
 * casas:
 * 		vecindario(V):-length(V,3),
 * 					...
 * 
 * ================================================================
 * 
 * 1) el español vive junto a la casa roja.
 *      junto([espana,_],[_,roja],V),
 * 
 * 2) El noruego vive en la casa azul.
 *      junto([noruega,_],[_,azul],V)
 * 
 * 3) Un italiano vive en la segunda casa.
 *      V=[[_,_],[italia,_]|_]
 * 
*/