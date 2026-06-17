% Aquí va el código.

% En lógico, definimos una base de conocimiento.

% 1. Tenemos algunos ejemplos:

% El punto "." termina la cláusula.
% El predicado "maestro" relaciona 2 individuos.

% HECHOS:
maestro(toph, tierra).
maestro(katara, agua).
maestro(zuko, fuego).
maestro(aang, agua).
maestro(aang, tierra).
maestro(aang, fuego).
% maestro(zaheer, aire). -> feo malo. El que tiene que deducir es el programa, no vos.

% Escribo una REGLA:
maestro(Alguien, aire) :-   % Es como el <= implica de lógica
    creo(Alguien, _).
maestro(Alguien, aire) :-
    tieneConexionEspiritual(Alguien).

% El predicado "maestro" es una RELACIÓN entre el conjunto de nombres y el conjunto de elementos.

% Y Sokka? Dónde está Sokka?
% Si Sokka siempre debe dar falso para la pregunta "maestro(sokka, algo)", entonces no lo pongo. 
% No ponemos a Sokka, porque por el principio de "universo cerrado", todo lo que no esté en la base es falso.

% Tanto los individuos como los predicados comienzan con minúscula.

% 2. YA ESTA.

% Consultas:
% ?- maestro(sokka, Elemento).
% ¿Es cierto que existe un elemento del que sea maestro Sokka?
% Elemento es una variable. Las variables empiezan con mayúscula.
% Las variables me permiten preguntar ∃ X/maestro(sokka, X).

% En lógico siempre consulto por la verdad de una consulta. Si hay una variable con nombre (Elemento por ejemplo), además me va a dar ejemplos de a quiénes tengo que poner ahí para que dé cierto.

% not(maestro(aang,Elemento)).
% significa "¿es cierto que no existe un Elemento del que sea maestro aang?"

% Motor de backtracking.
% Me permite hacer una solución más declarativa que la de funcional para este problema.

% No con todos los predicados puedo preguntar por existencia. Algunos no me saben resolver el problema.
% Decimos que un predicado es INVERSIBLE por un parámetro cuando se puede hacer la pregunta por existencia.

%Ejemplo:
% ¿es inversible maestro/2 por el Elemento? -> sí
% ¿es inversible maestro/2 por el Nombre? -> sí
% ¿es inversible between/3 por el tercer parámetro? -> sí
% ¿es inversible between/3 por el primer parámetro? -> no
% ¿es inversible between/3 por el segundo parámetro? -> no

% Relación creo(Nombre,Movimiento).
creo(zaheer, volar).
creo(aang, patinetaDeAire).
creo(tenzin, torbellinoDeAire).

% Los predicados de aridad 1, se llaman PROPIEDADES.
tieneConexionEspiritual(zaheer).
tieneConexionEspiritual(bumi).
tieneConexionEspiritual(kai).
tieneConexionEspiritual(naza).

% En lógica proposicional:
% q v r => p

% En Prolog:
% p :- r.
% p :- q.

% Definido SIN CONTAR, usando lógica de primer orden.
tieneDobleMaestria(Maestro) :-
    maestro(Maestro, ElementoA), % La coma es el Y (and)
    maestro(Maestro, ElementoB),
    ElementoB \= ElementoA.

% ¿Qué es un programa?
% En el paradigma procedural es una secuencia de instrucciones. Se ejecuta llamando a un procedimiento.
% En el paradigma funcional es un conjunto de definiciones de funciones. Se ejecuta llamando a una función.
% En el paradigma lógico es una base de conocimientos con varios predicados. Se ejecuta haciendo consultas a esa base de conocimientos.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
Consultas hechas a la consola:


alf@alf-ThinkPad-T14-Gen-3:~/repos/pdep/2026-l-introLogico (main)$ swipl avatar.pl 
Welcome to SWI-Prolog (threaded, 64 bits, version 9.0.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

?- maestro(zuko,fuego).
true.

?- maestro(zuko,agua).
false.

?- maestro(sokka,fuego).
false.

?- maestro(sokka, Elemento).
false.

?- maestro(sokka, Elemento).
false.

?- maestro(aang, Elemento).
Elemento = agua .

?- maestro(alf, Elemento).
false.

?- maestro(alf, _).
false.

?- maestro(sokka, _).
false.

?- maestro(toph, _).
true.

?- maestro(aang, _).
true .

?- maestro(aang, Elemento).
Elemento = agua .

?- 
|    maestro(aang, Elemento).
Elemento = agua ;
Elemento = tierra .

?- maestro(aang, Elemento).
Elemento = agua ;
Elemento = tierra .

?- 
|    maestro(aang, agua).
true .

?- maestro(aang, tierra).
true .

?- maestro(aang, fuego).
true.

?- maestro(aang, Elemento).
Elemento = agua ;
Elemento = tierra ;
Elemento = fuego.

?- maestro(aang, _).
true .

?- maestro(aang, Elemento).
Elemento = agua .

?- maestro(aang, fuego).
true.

?- maestro(aang, Elemento).
Elemento = agua ;
Elemento = tierra ;
Elemento = fuego.

?- 3 + 5.
ERROR: Unknown procedure: (+)/2 (DWIM could not correct goal)
?- 3 < 5.
true.

?- 3 == 5.
false.

?- 3 == 3.
true.

?- not(3 == 3)
|    .
false.

?- not(3 == 5).
true.

?- maestro(aang,agua).
true .

?- not(maestro(aang,agua)).
false.

?- maestro(aang,_).
true .

?- not(maestro(aang,_)).
false.

?- not(maestro(aang,Elemento)).
false.

?- maestro(aang,_)
|    .
true .

?- maestro(aang,_).
true .

?- maestro(aang,Elemento).
Elemento = agua .

?- not(maestro(aang,_)).
false.

?- not(maestro(aang,Elemento)).
false.

?- maestro(alf, Elemento).
false.

?- not(maestro(alf,Elemento)).
true.

?- elemento(aang,Elemento).
ERROR: Unknown procedure: elemento/2 (DWIM could not correct goal)
?- maestro(aang,Elemento).
Elemento = agua ;
Elemento = tierra ;
Elemento = fuego.

?- maestro(Nombre, fuego).
Nombre = zuko ;
Nombre = aang.

?- maestro(Nombre, metal).
false.

?- maestro(_, metal).
false.

?- maestro(_, fuego).
true .

?- maestro(sokka,_).
false.

?- maestro(aang,_).
true .

?- maestro(Nombre, Elemento).
Nombre = toph,
Elemento = tierra .

?- maestro(Nombre, Elemento).
Nombre = toph,
Elemento = tierra ;
Nombre = katara,
Elemento = agua ;
Nombre = zuko,
Elemento = fuego ;
Nombre = aang,
Elemento = agua ;
Nombre = aang,
Elemento = tierra ;
Nombre = aang,
Elemento = fuego.

?- 2 > 1.
true.

?- between(1,10,5).
true.

?- between(1,10,11).
false.

?- between(1,10,tierra).
ERROR: Type error: `integer' expected, found `tierra' (an atom)
ERROR: In:
ERROR:   [10] between(1,10,tierra)
ERROR:    [9] toplevel_call(user:user: ...) at /usr/lib/swi-prolog/boot/toplevel.pl:1173
?- between(1,10,3).
true.

?- between(1,10,_).
true .

?- between(11,10,_).
false.

?- between(11,10,Nro).
false.

?- between(1,10,_).
true .

?- between(1,10,Nro).
Nro = 1 ;
Nro = 2 ;
Nro = 3 ;
Nro = 4 ;
Nro = 5 ;
Nro = 6 ;
Nro = 7 ;
Nro = 8 ;
Nro = 9 ;
Nro = 10.

?- between(9,10,Nro).
Nro = 9 ;
Nro = 10.

?- between(1,10,1.5).
ERROR: Type error: `integer' expected, found `1.5' (a float)
ERROR: In:
ERROR:   [10] between(1,10,1.5)
ERROR:    [9] toplevel_call(user:user: ...) at /usr/lib/swi-prolog/boot/toplevel.pl:1173
?- between(1,10,5).
true.

?- not(between(1,10,5)).
false.

?- not(between(1,10,_)).
false.

?- not(between(1,10,Numero)).
false.

?- between(1,10,5).
true.

?- between(1,10,Nro).
Nro = 1 .

?- 
|    between(1,10,Nro).
Nro = 1 ;
Nro = 2 ;
Nro = 3 ;
Nro = 4 ;
Nro = 5 ;
Nro = 6 ;
Nro = 7 ;
Nro = 8 ;
Nro = 9 ;
Nro = 10.

?- between(Inferior,10,5).
ERROR: Arguments are not sufficiently instantiated
ERROR: In:
ERROR:   [10] between(_23436,10,5)
ERROR:    [9] toplevel_call(user:user: ...) at /usr/lib/swi-prolog/boot/toplevel.pl:1173
?- maestro(aang,Algo).
Algo = agua ;
Algo = tierra ;
Algo = fuego.

?- maestro(Nombre,fuego).
Nombre = zuko ;
Nombre = aang.

?- between(1,10,Nro).
Nro = 1 .

?- make.
Warning: /home/alf/repos/pdep/2026-l-introLogico/avatar.pl:29:
Warning:    Singleton variables: [Consultas]
ERROR: /home/alf/repos/pdep/2026-l-introLogico/avatar.pl:29:
ERROR:    Arguments are not sufficiently instantiated
% /home/alf/repos/pdep/2026-l-introLogico/avatar compiled 0.00 sec, 3 clauses
true.

?- make.
% /home/alf/repos/pdep/2026-l-introLogico/avatar compiled 0.00 sec, 1 clauses
true.

?- maestro(zaheer, fuego).
false.

?- maestro(zaheer, aire).
true.

?- creo(zaheer,_).
true.

?- maestro(Maestro, aire).
Maestro = zaheer .

?- maestro(Maestro, aire).
Maestro = zaheer ;
Maestro = aang ;
Maestro = tenzin.

?- make
|    .
% /home/alf/repos/pdep/2026-l-introLogico/avatar compiled 0.00 sec, 1 clauses
Warning: The predicates below are not defined. If these are defined
Warning: at runtime using assert/1, use :- dynamic Name/Arity.
Warning: 
Warning: tieneConexionEspiritual/1, which is referenced by
Warning:        /home/alf/repos/pdep/2026-l-introLogico/avatar.pl:21:4: 8-th clause of maestro/2
true.

?- make.
% /home/alf/repos/pdep/2026-l-introLogico/avatar compiled 0.00 sec, 4 clauses
true.

?- maestro(Maestro, aire).
Maestro = zaheer ;
Maestro = aang ;
Maestro = tenzin ;
Maestro = zaheer ;
Maestro = bumi ;
Maestro = kai ;
Maestro = naza.

?- maestro(naza, aire).
true.

?- tieneConexionEspiritual(Alguien).
Alguien = zaheer ;
Alguien = bumi ;
Alguien = kai ;
Alguien = naza.

?- tieneDobleMaestria(aang).
ERROR: Unknown procedure: tieneDobleMaestria/1 (DWIM could not correct goal)
?- maestro(M, E).
M = toph,
E = tierra ;
M = katara,
E = agua ;
M = zuko,
E = fuego ;
M = aang,
E = agua ;
M = aang,
E = tierra ;
M = aang,
E = fuego ;
M = zaheer,
E = aire ;
M = aang,
E = aire ;
M = tenzin,
E = aire ;
M = zaheer,
E = aire ;
M = bumi,
E = aire ;
M = kai,
E = aire ;
M = naza,
E = aire.

?- tieneDobleMaestria(aang).
ERROR: Unknown procedure: tieneDobleMaestria/1 (DWIM could not correct goal)
?- make.
Warning: /home/alf/repos/pdep/2026-l-introLogico/avatar.pl:78:
Warning:    Singleton variables: [ElementoA,ElementoB]
% /home/alf/repos/pdep/2026-l-introLogico/avatar compiled 0.00 sec, 1 clauses
true.

?- tieneDobleMaestria(aang).
true .

?- tieneDobleMaestria(alf).
false.

?- maestro(alf, ElementoA).
false.

?- tieneDobleMaestria(toph).
true .

?- make.
% /home/alf/repos/pdep/2026-l-introLogico/avatar compiled 0.00 sec, 0 clauses
true.

?- tieneDobleMaestria(toph).
false.

?- tieneDobleMaestria(alf).
false.

?- tieneDobleMaestria(aang).
true .

?- tieneDobleMaestria(zaheer).
false.

?- maestro(Alguien, aire).
Alguien = zaheer ;
Alguien = aang ;
Alguien = tenzin ;
Alguien = zaheer ;
Alguien = bumi ;
Alguien = kai ;
Alguien = naza.

?- tieneDobleMaestria(Maestro).
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
Maestro = aang ;
false.

?- halt.
*/