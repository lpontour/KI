% Autor: %lpontour%
% Datum: %08.01.2018%
%Start des Programmes mit "abstand.", dann Anweisungen folgen%

%Initialiesirungseintrag%
abst(arad,sibiu,140).

%Semmetryauflösung%
a( X, Y, A) :- abst( X, Y, A).
a( X, Y, A) :- abst( Y, X, A).

%Start des Programmes mit kleinem User-Interface%
abstand :- nl,
         write( 'Bitte eingeben: a( Stadt1, Stadt2)'),
         nl,
         write( 'Zum Beenden: exit'),
         repeat,
         nl,
         write( 'Eingabe: '),
         read( Input),
         verarbeiteEingabe( Input),
         !.

%Verarbeitet die Benutzereingaben aus dem Menü S1(Stadt1) S2(Stadt2)%
verarbeiteEingabe( exit) :- !.
verarbeiteEingabe( a( S1, S2)) :- abstand( S1, S2, A),
         fail.

%Gibt die Distanz zwischen den Orten aus, wenn bekannt%
ausgabe( S1, S2, A) :- nl,
    write( 'Abstand zwischen '),
    write( S1),
    write( ' und '),
    write( S2),
    write( ' ist '),
    write( A).

%Abstand wird ausgegeben, wenn abstand nicht bekannt wird der User gefragt%
abstand( S1, S2, A) :- a( S1, S2, A),
    ausgabe( S1, S2, A),
    !.
abstand( S1, S2, A) :- frageBenutzer( S1, S2, A),
    !.

%Abfrage des Benutzer nach Distanz zwischen zwei Orten%
frageBenutzer( S1, S2, A) :- nl,
    write( 'Abstand zwischen '),
    write( S1),
    write( ' und '),
    write( S2),
    nl,
    write( 'nicht bekannt.'),
    nl,
    write( 'Bitte Abstand angeben: '),
    read( AA),
    verarbeiteAntwort( S1, S2, A, AA).

%Fügt einen neuen Eintrag, auf Basis der Benutzereingaben, in die Wissensdatenbank ein%
verarbeiteAntwort( S1, S2, A, AA) :- number( AA),
    !,
    A = AA,
    assert(abst( S1, S2, A)),
    nl,
    write( 'Gespeichert, wiederhole:'),
    ausgabe( S1, S2, A).

%Verarbeitung von Antworten die nicht die Distanz sein können%
verarbeiteAntwort( S1, S2, A, nein).
verarbeiteAntwort( S1, S2, A, eof).
verarbeiteAntwort( S1, S2, A, AA) :- nl,
    write( '!!!Eingabe Ungueltig!!!'),
    frageBenutzer( S1, S2, A).

