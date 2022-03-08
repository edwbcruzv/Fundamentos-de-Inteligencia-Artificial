% Elaborado por Edwin Bernardo Cruz Villalba.
% Ing. en Sitemas Computacionales, ESCOM IPN.

% Github:edwbcruzv.


% Fundamentos de Inteligencia Artificial.
% Tarea 1: GOD.
% Realizar una lista de hechos escrito en lenguaje prolog, en base al diagrama.
% genealógico de los personajes de la serie "Game Of Thrones".


% Se encontrarán hechos básicos como lo son:.
% - Las 7 regiones que la conforman.
% - Las 8 casas que existen dentro de la serie.
% - Los colores de las casas.
% - Los géneros de los personajes.
% - Antecesores y Sucesores directos.
% - Amorios entre los personajes
% - Padres y Madres.
% - Hermanos y Hermanas.
% - Tios y Tias.
% - Primos.

% Una forma de ver todos los hechos:
% >consult([region,casa,hombre,mujer]).


% ************** Regiones **************.
region(vale).
region(riverlands).
region(north).
region(stormlands).
region(westerland).
region(reach).
region(dorne).

% ************** Casas **************.

casa(arryn).
casa(tully).
casa(stark).
casa(targaryen).
casa(baretheon).
casa(lannister).
casa(tyrell).
casa(martell).

% ************** Colores **************.

color(morado).
color(azul).
color(gris).
color(negro).
color(amarillo).
color(rojo).
color(turquesa).
color(naranja).

% ************** Lideres **************.

lider(jon,arryn,morado).
lider(hoster,tully,azul).
lider(rickard,stark,gris).
lider(aerys2,targaryen,negro).
lider(ormund,baratheon,amarillo).
lider(tywin,lannister,rojo).
lider(olenna,tyrell,turquesa).
lider(desconocido,martell,naranja).
lider(desconocida,martell,naranja).


% ************** Hombres **************.

% -------- Casa Arryn --------.
hombre(jon).
hombre(robin).

% -------- Casa Tully --------.
hombre(little-finger). % ext
hombre(walder-frey). % ext
hombre(hoster).
hombre(edmure).

% -------- Casa Stark --------.
hombre(brandon).
hombre(rickard).
hombre(eddard).
hombre(benjen).
hombre(robb).
hombre(rickon).
hombre(roose-bolton). % ext
hombre(ramsay-bolton). % ext

% -------- Casa Targaryen --------.
hombre(aergon-1).
hombre(maekar-1).
hombre(master-aemon).
hombre(aegon-5).
hombre(jaehaerys-2).
hombre(aerys-2).
hombre(the-mad).
hombre(jon-snow).
hombre(rhaegar).
hombre(viserys).
hombre(balon-greyjoy). % ext.
hombre(theon-greyjoy). % ext.

% -------- Casa baratheon --------.
hombre(ormund).
hombre(steffon).
hombre(robert).
hombre(stannis).
hombre(renly).
hombre(tommen).
hombre(joffrey).

% -------- Casa Lannister --------.
hombre(tywin).
hombre(jaime).
hombre(tyrion).

% -------- Casa Tyrell --------.
hombre(luthor).
hombre(mace).
hombre(loras).

% -------- Casa Martell --------.
hombre(desconocido).
hombre(doran).
hombre(oberyn).
hombre(trystane).
hombre(sand-snakes).


% ************** Mujeres **************.

% -------- Casa Tully --------.
mujer(lysa).
mujer(roslin-frey). % ext
mujer(catelyn).

% -------- Casa Stark --------.
mujer(talisa). % ext
mujer(sansa).
mujer(arya).
mujer(lyanna).

% -------- Casa Targaryen --------.
mujer(rhaelle).
mujer(daenerys).

% -------- Casa baratheon --------.
mujer(shireen).
mujer(myrcella).

% -------- Casa Lannister --------.
mujer(joanna).
mujer(cersei).

% -------- Casa Tyrell --------.
mujer(olenna).
mujer(margaery).

% -------- Casa Martell --------.
mujer(desconocida).
mujer(elia).


% ************** antecesores directos **************.
%antecesor(antecesor/a,sucesor/a)

% -------- Casa Arryn --------.
antecesor(jon,robin).
antecesor(lysa,robin).

% -------- Casa Tully --------.
antecesor(walder,roslin-frey). % ext.
antecesor(hoster,lysa).
antecesor(hoster,edmure).
antecesor(hoster,catelyn).

% -------- Casa Stark --------.
antecesor(roose-bolton,ramsay-bolton). % ext.
antecesor(rickard,brandon).
antecesor(rickard,eddard).
antecesor(rickard,benjen).
antecesor(rickard,lyanna).
antecesor(catelyn,robb).
antecesor(catelyn,sansa).
antecesor(catelyn,arya).
antecesor(catelyn,brandon).
antecesor(catelyn,rickon).
antecesor(eddard,robb).
antecesor(eddard,sansa).
antecesor(eddard,arya).
antecesor(eddard,brandon).
antecesor(eddard,rickon).

% -------- Casa Targaryen --------.
antecesor(balon-greyjoy,theon-greyjoy). % ext.
antecesor(maekar1,master-aemon).
antecesor(maekar1,aegon5).
antecesor(aegon5,jaehaerys2).
antecesor(aegon5,rhaelle).
antecesor(jaehaerys2,aerys2).
antecesor(aerys2,rhaegar).
antecesor(aerys2,viserys).
antecesor(aerys2,daenerys).
antecesor(lyanna,jon-snow).
antecesor(rhaegar,jon-snow).

% -------- Casa baratheon --------.
antecesor(rhaelle,steffon).
antecesor(ormund,steffon).
antecesor(steffon,robert).
antecesor(steffon,stannis).
antecesor(steffon,renly).
antecesor(stannis,shireen).
antecesor(robert,joffrey).
antecesor(robert,myrcella).
antecesor(robert,tommen).
antecesor(cersei,joffrey).
antecesor(cersei,myrcella).
antecesor(cersei,tommen).

% -------- Casa Lannister --------.
antecesor(tywin,jaime).
antecesor(tywin,cersei).
antecesor(tywin,tyrion).
antecesor(joanna,jaime).
antecesor(joanna,cersei).
antecesor(joanna,tyrion).

% -------- Casa Tyrell --------.
antecesor(luthor,mace).
antecesor(olenna,mace).
antecesor(mace,margaery).
antecesor(mace,loras).

% -------- Casa Martell --------.
antecesor(desconocido,doran).
antecesor(desconocido,elia).
antecesor(desconocido,oberyn).
antecesor(desconocida,doran).
antecesor(desconocida,elia).
antecesor(desconocida,oberyn).
antecesor(doran,trystane).
antecesor(oberyn,sand-snakes).


% ************** Relaciones **************.
% "X ama a Y"
ama(jon,lysa).
ama(lysa,jon).
ama(roslin-frey,edmure).
ama(edmure,roslin-frey).
ama(lysa,little-finger).
ama(little-finger,lysa).
ama(talisa,robb).
ama(robb,talisa).
ama(sansa,ramsay-bolton).
ama(ramsay-bolton,sansa).
ama(catelyn,eddard).
ama(eddard,catelyn).
ama(lyanna,rhaegar).
ama(rhaegar,lyanna).
ama(rhaegar,elia).
ama(elia,rhaegar).
ama(rhaelle,ormund).
ama(ormund,rhaelle).
ama(cersei,robert).
ama(robert,cersei).
ama(cersei,jaime).
ama(jaime,cersei).
ama(tywin,joanna).
ama(joanna,tywin).
ama(olenna,luthor).
ama(luthor,olenna).
ama(desconocida,desconocido).
ama(desconocido,desconocida).
ama(margaery,renly).
ama(renly,margaery).
ama(margaery,joffrey).
ama(joffrey,margaery).
ama(margaery,tommen).
ama(tommen,margaery).



% ************** Madres y Padres **************.
% "M es madre de H"
madre(M,H):-antecesor(M,H),mujer(M).

% "P es padre de H"
padre(P,H):-antecesor(P,H),hombre(P).

% ************** Hermanos y Hermanas **************.
% "A es hermano de b"
hermano(A,B):-antecesor(C,A),antecesor(C,B),hombre(A),A\==B.
% "A es hermana de b"
hermana(A,B):-antecesor(C,A),antecesor(C,B),mujer(A),A\==B.

% ************** Tios o Tias **************.
% "T es tio de S"
tio(T,S):-hermano(T,X),antecesor(X,S).
% "T es tia de S"
tia(T,S):-hermana(T,X),antecesor(X,S).

% ************** Primos o Primas**************.
% "A y B son primos"
primos(A,B):-antecesor(X,A),antecesor(Y,B),antecesor(Z,X),antecesor(Z,Y),A\==B.