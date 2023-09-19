friend(ram).
edges(hexagon,6).
author(gitanjali, "rabrindranath tagore").
telephone(fire,101).
wife(kasturba,gandhi).
players(cricket,11).
husband(ram,sita).
husband(shiv,parvati).
husband(X,Y):-wife(Y,X).
wife(A,B):-husband(B,A).
