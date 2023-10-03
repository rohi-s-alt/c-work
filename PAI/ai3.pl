%Find Factorial of a number
factorial(0,1).
factorial(N,X):-factorial(N1,X1),N is N1+1, X is X1*N.

%celsius to farenheit
c_to_f(C,F):-F is C*9/5+32.
freezing(F):-F=<32.

%monkey banana problem
in_room(banana).
in_room(chair).
in_room(monkey).
push(monkey,chair).
can_climb(monkey,chair).
grasp(monkey,banana).
eat(monkey,banana).
can_reach(X,Y):-in_room(X),in_room(Y),in_room(Z),push(X,Z),can_climb(X,Z),grasp(X,Y),eat(X,Y).

%Medical diagnostic system in prolog
symptom(charlie,fever).
symptom(charlie,rash).
symptom(charlie,headache).
symptom(charlie,runny_nose).
hypothesis(Patient,measles):-symptom(Patient,fever),symptom(Patient,cough),symptom(Patient,conjunctivites),symptom(Patient,runny_nose),symptom(Patient,rash).
hypothesis(Patient,german_measles):-symptom(Patient,fever),symptom(Patient,headache),symptom(Patient,runny_nose),symptom(Patient,rash).
hypothesis(Patient,flu):-symptom(Patient,fever),symptom(Patient,headache),symptom(Patient,body_ache),symptom(Patient,conjunctivities),symptom(Patient,chills),symptom(Patient,sore_throat),symptom(Patient,cough),symptom(Patient,runny_nose).


