dfs(Current,Goal):-Current = Goal,write('Reached Goal!'),nl.
dfs(Current,Goal):-write('Current Node:'), write(Current),nl,neighbour(Current,Next),dfs(Next,Goal).
neighbour(A,B):-B is A+1.
