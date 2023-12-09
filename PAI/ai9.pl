% check validity of configuration
valid([],0,_,_).
valid([Q|Qboard],QC,C,R) :- valid(Qboard,CC,C,R),
                            QC is CC + 1,
                            Dc is abs(QC-C),
                            Dr is abs(R-Q),
                            Dr =\= 0,
                            Dc =\= Dr.

% find a valid position
find_valid_position(Q,C,R,R) :- valid(Q,_,C,R).
find_valid_position(Q,C,IR,RR) :- NR is IR + 1,
                                  NR =< 8,
                                  find_valid_position(Q,C,NR,RR).


eight_queen(Q,9,Q).
eight_queen(Q,C,RQ) :- find_valid_position(Q,C,1,X),
                       NQ = [X | Q],
                       NC is C+1,
                       eight_queen(NQ,NC,RQ).

solution(Pos) :- eight_queen([],1,Pos).
