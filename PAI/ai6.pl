my_predicate(X,Y):-
Local_Variable = 42,
write('Local)Variable='),write(Local_Variable),nl,
(X = 1 -> Y = 'X is 1';
X = 2 -> Y = 'X is 2';
Y = 'X is neither 1 nor 2').

