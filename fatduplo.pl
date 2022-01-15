fatduplo(0,1).
fatduplo(1,1).

fatduplo(N,F) :-
   N>0,
   N1 is N-2, %% só o que muda é essa subtração
   fatduplo(N1,F1),
   F is N * F1.


