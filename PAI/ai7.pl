hanoi(N) :-
    move(N, left, middle, right).

% Define the base case for moving 0 disks (no action needed).
move(0, _, _, _) :- !.

% Define the recursive case for moving N disks.
move(N, A, B, C) :-
    N > 0,
    M is N - 1,
    move(M, A, C, B),           % Move the top N-1 disks from A to B
    display_move(N, A, C),      % Display the move of the Nth disk
    move(M, B, A, C).           % Move the N-1 disks from B to C

% Define a predicate to display the move of a disk.
display_move(Disk, From, To) :-
    format('Move disk ~w from ~w to ~w~n', [Disk, From, To]).
