/*******************Problema de la cebra**********************
* En un vecindario de los suburbios,
* 1) Existen 5 casas en linea.
* 2) El ingles vive en la casa roja.
* 3) El español tiene un perro.
* 4) En la casa verde se bebe cafe.
* 5) El ukraniano bebe te.
* 6) La casa verde esta junto a la casa blanca.
* 7) El fumador de old gold tiene un caracol.
* 8) En la casa amarilla se fuma kool.
* 9) En la casa del centro se bebe leche.
* 10) Un noruego vive en la primera casa.
* 11) el fumador de chesterfield vive junto al dueño de un zorro.
* 12) Los cigarros kool se fuman en la casa junto ala que tiene un caballo.
* 13) El fumador de lucky strike bebe jugo.
* 14) El japones fuma parliament.
* 15) El noruego vive junto a la casa azul.
* 
* PReguntas:
* 1) ¿Quien bebe agua?.
* 2) ¿Quien tiene una cebra?.
* 
* SOLUCION EN PROLOG...
* =========================================================================
* PRINCIPIO A SEGUIR...	
* "UNA VEZ DESCARTADO LO IMPOSIBLE, LO QUE QUEDA, POR IMPROBABLE QUE 
* PAREZCA, DEBE SER LA VERDAD"
* =========================================================================
* El razonamiento...
* 
* Eliminar opciones no consistentes es justamente el tipo de razonamiento
* que se ejecuta facilmente con unificacion.
* 
* La idea es representar en prolog la estructura, tanto de cada casa,como
* el vecindario, y permitir que la unificacion elimine las opciones
* inconsistentes.
* 
* Las expresiones del planteamiento del problema son de dos tipos:
* 		Las que relacionan dos o mas elementos:
* 			4) En la casa verde se bebe cafe.
* 			8) En la casa amarilla se fuma kool.
* 		Las que indican la relacion de posicion entre dos casas diferentes:
* 			6) La casa verde esta junto a la casa blanca.
* 			11) el fumador de chesterfield vive junto al dueño de un zorro.
* 
* =========================================================================
* Definicion de la estructura de la casa
* 		casa(Color,Pais,Mascota,Bebida,Cigarros)
* 
* El vecindario sera una lista (de longitud 5) de casas
* 
* Formalizamos el concepto de que una casa se encuentra "junto a" otra casa
* dentro de una lista:
* 		junto(C1,C2,Lista):-append(_,[C1,C2|_],Lista).
* 		junto(C1,C2,Lista):-append(_,[C2,C1|_],Lista).
* 
* Ahora, definimos el vecindario como una lista de longitud 5 y que contiene 
* casas:
* 		vecindario(V):-length(V,5),
* 					...
* 
*El resto de las consultas son aquellas planteadas en el problema original
* =========================================================================
* 1) Existen 5 casas en linea.
* 		length(V,5)
* 2) El ingles vive en la casa roja.
* 		member(casa(rojo,inglaterra,_,_,_),V).
* 
* 3) El español tiene un perro.
* 		member(casa(_,españa,perro,_,_),V).
* 
* 4) En la casa verde se bebe cafe.
* 		member(casa(verde,_,_,cafe,_),V).
* 
* 5) El ukraniano bebe te.
* 		member(casa(_,ukrania,_,te,_),V).
* 
* 6) La casa verde esta junto a la casa blanca.
* 		junto(casa(blanco,_,_,_,_),casa(verde,_,_,_,_),V).
* 
* 7) El fumador de old gold tiene un caracol.
* 		member(casa(_,_,caracol,_,oldgold),V).
* 
* 8) En la casa amarilla se fuma kool.
* 		member(casa(amarillo,_,_,_,kool),V).
* 
* 9) En la casa del centro se bebe leche.
* 		V=[_,_,casa(_,_,_,leche,_),_,_].
* 
* 10) Un noruego vive en la primera casa.
* 		V=[_,_,casa(_,noruega,_,_,_),_,_].
* 		V=[_,_,casa(_,noruega,_,_,_)|_].
* 
* 11) el fumador de chesterfield vive junto al dueño de un zorro.
* 		junto(casa(_,_,_,_,chesterfield),casa(_,_,zorro,_,_),V).
* 
* 12) Los cigarros kool se fuman en la casa junto ala que tiene un caballo.
* 		junto(casa(_,_,_,_,kool),casa(_,_,caballo,_,_),V).
* 
* 13) El fumador de lucky strike bebe jugo.
* 		member(casa(_,_,_,jugo,luckystrike),V).
* 
* 14) El japones fuma parliament.
* 		member(casa(_,japon,_,_,parliament),V).
* 
* 15) El noruego vive junto a la casa azul.
* 		junto(casa(_,noruega,_,_,_),casa(azul,_,_,_,_),V).
* 
* =========================================================================
* RESPUESTAS...
* Los dos valores faltantes (agua y cebra), se especifican de la misma forma,
* completando la definicien del vecindario (universo de estudio)
* 
* 		En alguna casa, se bebe agua
* 			member(casa(_,_,_,agua,_),V)
* 		En alguna casa, la mascota es una cebra
* 			member(casa(_,_,cebra,_,_),V)
*/

junto(C1,C2,Lista):-append(_,[C1,C2|_],Lista),!.
junto(C1,C2,Lista):-append(_,[C2,C1|_],Lista).


vecindario(V):-
length(V,5),  % se crea una lista de 5      % 1) Existen 5 casas en linea.
member(casa(rojo,inglaterra,_,_,_),V),      % 2) El ingles vive en la casa roja.
member(casa(_,espana,perro,_,_),V),         % 3) El español tiene un perro.
member(casa(verde,_,_,cafe,_),V),           % 4) En la casa verde se bebe cafe.
member(casa(_,ukrania,_,te,_),V),           % 5) El ukraniano bebe te.
junto(casa(blanco,_,_,_,_),casa(verde,_,_,_,_),V),% 6) La casa verde esta junto a la casa blanca.
member(casa(_,_,caracol,_,oldgold),V),      % 7) El fumador de old gold tiene un caracol.
member(casa(amarillo,_,_,_,kool),V),        % 8) En la casa amarilla se fuma kool.
V=[_,_,casa(_,_,_,leche,_),_,_],            % 9) En la casa del centro se bebe leche.
V=[_,_,casa(_,noruega,_,_,_),_,_],          % 10) Un noruego vive en la primera casa.	
junto(casa(_,_,_,_,chesterfield),casa(_,_,zorro,_,_),V),% 11) el fumador de chesterfield vive junto al dueño de un zorro.
junto(casa(_,_,_,_,kool),casa(_,_,caballo,_,_),V),% 12) Los cigarros kool se fuman en la casa junto ala que tiene un caballo.
member(casa(_,_,_,jugo,luckystrike),V),     % 13) El fumador de lucky strike bebe jugo.
member(casa(_,japon,_,_,parliament),V),     % 14) El japones fuma parliament.
junto(casa(_,noruega,_,_,_),casa(azul,_,_,_,_),V),% 15) El noruego vive junto a la casa azul.
member(casa(_,_,_,agua,_),V),               % Pregunta 1:En alguna casa, se bebe agua
member(casa(_,_,cebra,_,_),V),!.              % Pregunta 2:En alguna casa, la mascota es una cebra