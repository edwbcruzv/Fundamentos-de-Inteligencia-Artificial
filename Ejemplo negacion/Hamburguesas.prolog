/*==============================================
 * En un establecimiento de comida rapida, ofrecen hamburguesas de 4 tipos:
 * -Sencilla
 * -Con queso
 * -Especial
 * -De Pollo
 * 
 * Justo cuando Vicente llega al establecimiento tienen 3 hechas de cada tipo.
 * 
 * Pero a vicente NO le gusta la hamburguesa especial.
 * 
 * necesitamos averiguar cuales de las 12 hamburguesas ya 
 * preparadas le podrian gustar a vicente.
 * 
 * 
 * 
*/

sencilla(s1).
sencilla(s2).
sencilla(s3).

conQueso(q1).
conQueso(q2).
conQueso(q3).

especial(e1).
especial(e2).
especial(e3).

dePollo(p1).
dePollo(p2).
dePollo(p3).

hamburguesa(H):-sencilla(H);conQueso(H);especial(H);dePollo(H).

% indicamos que a vicente le gustan todas menos la especial.
disfruta(vicente,H):-hamburguesa(H),\+especial(H).

% un efecto parecido pero diferente con !-fail.
disfruta2(vicente,H):-especial(H),!,fail.
disfruta2(vicente,H):-hamburguesa(H).

/*
 *
 *disfruta(vicente,X).
 * 
 *findall(X,disfruta(vicente,X),ParaVicente).
 * 
 * disfruta2(vicente,X).
 *
 * pero se pierde el determinismo usando disfruta2/2
 * findall(X,disfruta(vicente,X),ParaVicente).
 * 
*/
