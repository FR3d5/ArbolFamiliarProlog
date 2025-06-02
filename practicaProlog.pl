varon(desiderio).
varon(alfredo).
varon(freds).
varon(jhoel).
varon(gael).

mujer(angelica).
mujer(lidia).
mujer(tania).
mujer(amanda).
mujer(nicol).
mujer(jhuliana).
mujer(zaret).
mujer(sheyla).

padre(desiderio, alfredo).
padre(desiderio, lidia).
padre(desiderio, tania).
padre(desiderio, freds).
padre(alfredo, zaret).
padre(alfredo, gael).

madre(angelica, alfredo).
madre(angelica, lidia).
madre(angelica, tania).
madre(angelica, freds).

madre(lidia, nicol).
madre(lidia, jhoel).
madre(lidia, jhuliana).

madre(tania, sheyla).

madre(amanda, zaret).
madre(amanda, gael).

progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

hermano(X, Y) :- progenitor(P, X),progenitor(P, Y),varon(X),X \= Y.

hermana(X, Y) :- progenitor(P, X),progenitor(P, Y),mujer(X),X \= Y.

hijo(X, Y) :- progenitor(Y, X), varon(X).
hija(X, Y) :- progenitor(Y, X), mujer(X).

abuelo(X, Z) :- padre(X, Y), progenitor(Y, Z), varon(X).
abuela(X, Z) :- madre(X, Y), progenitor(Y, Z), mujer(X).

tio(X, Y) :- progenitor(P, X),progenitor(P, Z),hermano(X, Z),progenitor(Z, Y),varon(X).

tia(X, Y) :- progenitor(P, X),progenitor(P, Z),hermana(X, Z),progenitor(Z, Y),mujer(X).

sobrino(X, Y) :-progenitor(Tio, X),(tio(Y, Tio) ; tia(Y, Tio)),varon(X).

sobrina(X, Y) :-progenitor(Tia, X),(tio(Y, Tia) ; tia(Y, Tia)),mujer(X).

nieto(X, Y) :- progenitor(Y, Z), progenitor(Z, X), varon(X).
nieta(X, Y) :- progenitor(Y, Z), progenitor(Z, X), mujer(X).
