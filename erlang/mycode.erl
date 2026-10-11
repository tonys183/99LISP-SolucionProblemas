-module(mycode).
-export([myLast/1, myButLast/1, elementAt/2, myLength/1, myReverse/1, isPalindrome/1, myFlatten/1, compress/1, packo/1, encode/1]).
-export([encodeMod/1, decodeMod/1, encodeDir/1, dupli/1, repli/2, drop/2, split/2, slice/3, rotate/2, removeAt/2]).
-export([insertAt/3, range/2, rdnSelect/2, diffSelect/2, rndPermu/1, combinations/2, group/2, lsort/1]).
-export([isPrime/1, gcd/2, coprime/2, totientPhi/1, primeFactors/1, primeFactorsMul/1, phi/1, primesR/2, goldbach/1]).

% P01
myLast([]) -> [];
myLast([H]) -> H;
myLast([_H|T]) -> myLast(T).


% P02
myButLast([H,_T]) -> H;
myButLast([_H|T]) -> myButLast(T).


% P03
elementAt([H|_T], N) when N =:= 1 -> H;
elementAt([_H|T], N) -> elementAt(T, N-1).


% P04
myLength([]) -> 0;
myLength([_H|T]) -> 1 + myLength(T).


% P05
myReverse([]) -> [];
myReverse([H|T]) -> myReverse(T) ++ [H].


% P06
isPalindrome(L) -> L =:= lists:reverse(L).


% P07
myFlatten([]) -> [];
myFlatten([[]|T]) -> myFlatten(T);
myFlatten([[H|T]|R]) -> myFlatten([H|T]) ++ myFlatten(R);
myFlatten([H|T]) -> [H|myFlatten(T)].


% P08
compress([]) -> [];
compress([H|T]) -> compress([H|T], 0).
compress([], _) -> [];
compress([H|T], H) -> compress(T, H);
compress([H|T], _) -> [H|compress(T, H)].


% P09
packo([]) -> [];
packo([H|T]) -> packo(T, [H], []).
packo([], G, R) -> lists:reverse([G|R]);
packo([H|T], [H|G], R) -> packo(T, [H, H|G], R);
packo([H|T], G, R) -> packo(T, [H], [G|R]).


% P10
encode([]) -> [];
encode([H|T]) -> encode(T, H, 1, []).
encode([], E, C, G) -> lists:reverse([[C,E]|G]);
encode([H|T], H, C, G) -> encode(T, H, C+1, G);
encode([H|T], E, C, G) -> encode(T, H, 1, [[C,E]|G]).


% P11
encodeMod([]) -> [];
encodeMod([H|T]) -> encodeMod(T, H, 1, []).
encodeMod([], E, 1, G) -> lists:reverse([E|G]); 
encodeMod([], E, C, G) -> lists:reverse([[C,E]|G]);
encodeMod([H|T], H, C, G) -> encodeMod(T, H, C+1, G);
encodeMod([H|T], E, 1, G) -> encodeMod(T, H, 1, [E|G]); 
encodeMod([H|T], E, C, G) -> encodeMod(T, H, 1, [[C,E]|G]).


% P12
repeat(0, _) -> [];
repeat(N, E) -> [E|repeat(N-1, E)].

decodeMod([]) -> [];
decodeMod([[N,E]|T]) -> repeat(N, E) ++ decodeMod(T);
decodeMod([H|T]) -> [H|decodeMod(T)].  


% P13
encodeDir([]) -> [];
encodeDir([H|T]) -> encodeDir(T, H, 1, []).

encodeDir([], E, 1, G) -> lists:reverse([E|G]);
encodeDir([], E, C, G) -> lists:reverse([[C,E]|G]);
encodeDir([H|T], H, C, G) -> encodeDir(T, H, C+1, G);
encodeDir([H|T], E, 1, G) -> encodeDir(T, H, 1, [E|G]);
encodeDir([H|T], E, C, G) -> encodeDir(T, H, 1, [[C,E]|G]).


% P14
dupli([]) -> [];
dupli([H]) -> [H,H];
dupli([H|T]) -> [H] ++ [H|dupli(T)].


% P15
repli([], _N) -> [];
repli([H|T], N) -> repliAux(H, N) ++ repli(T,N).
repliAux(_H, 0) -> [];
repliAux(H, N) -> [H] ++ repliAux(H, N-1).


% P16
drop(L, N) -> dropAux(L,N,1).
dropAux([], _N, _C) -> [];
dropAux([_H|T], N, C) when C rem N =:= 0 -> dropAux(T, N, 1);
dropAux([H|T], N, C) -> [H] ++ dropAux(T,N,C+1).


% P17
split(L, N) -> splitAux(L,N,[]).
splitAux(L, 0, G) -> [lists:reverse(G),L];
splitAux([], _N, G) -> [lists:reverse(G), []];
splitAux([H|T], N, G) -> splitAux(T,N-1,[H|G]).


% P18
slice([], _I, _J) -> [];
slice(_L, I, J) when I > J -> [];
slice([H|T], I, J) when I =:= 1 -> [H|slice(T,I,J-1)];
slice([_H|T], I, J) -> slice(T, I-1, J-1).


% P19
rotate([], _N) -> [];
rotate(L, 0) -> L;
rotate(L, N) -> rotateAux(split(L, ((N rem length(L)) + length(L)) rem length(L))).
rotateAux([L1, L2]) -> L2 ++ L1.


% P20
removeAt([], _N) -> [];
removeAt([_H|T], 1) -> T;
removeAt([H|T], N) -> [H] ++ removeAt(T,N-1).


% P21
insertAt(_E, [], _N) -> [];
insertAt(E, [H|T], 1) -> [E] ++ [H|T];
insertAt(E, [H|T], N) -> [H] ++ insertAt(E,T,N-1).


% P22
range(I, J) when I > J -> [];
range(I, J) -> [I|range(I+1, J)].


% P23
rebuild(H, [E|T]) -> [E|[H|T]].
removeAtMod([H|T], 1) -> [H|T];
removeAtMod([H|T], K) -> rebuild(H, removeAtMod(T, K-1)).


rdnSelect(L, N) -> rdnSelect(L, N, []).
rdnSelect(_L, 0, G) -> G;
rdnSelect([], _N, G) -> G;
rdnSelect(L, N, G) -> rdnSelectAux(removeAtMod(L, rand:uniform(length(L))), N, G).
rdnSelectAux([H|T], N, G) -> rdnSelect(T, N-1, [H|G]).


% P24
diffSelect(N,M) -> rdnSelect(range(1,M), N).


% P25
rndPermu([]) -> [];
rndPermu(L) -> rndPermuAux(L, rand:uniform(length(L))).

rndPermuAux(L, N) -> rndPermuAux(L, N, []).
rndPermuAux([H|T], 1, G) -> [H|rndPermu(lists:reverse(G) ++ T)];
rndPermuAux([H|T], N, G) -> rndPermuAux(T, N-1, [H|G]).


% P26
combinations(_H,0) -> [[]];
combinations([],_K) -> [];
combinations([H|T],K) -> [[H|C] || C <- combinations(T,K-1)] ++ combinations(T,K).


% P27
remove(L, S) -> [X || X <- L, not lists:member(X, S)].
group([], []) -> [[]];
group(L, [K|RK]) -> [[C|G] || C <- combinations(L, K), G <- group(remove(L, C), RK)].


% P28
insertLength(X, []) -> [X];
insertLength(X, [H|T]) when length(X) =< length(H) -> [X,H|T];
insertLength(X, [H|T]) -> [H|insertLength(X, T)].

lsort([]) -> [];
lsort([H|T]) -> insertLength(H, lsort(T)).


% P31
isPrime(2) -> true;
isPrime(X) when X < 2 -> false;
isPrime(X) when X rem 2 =:= 0 -> false;
isPrime(X) -> isPrimeAux(X, 3).
isPrimeAux(X, I) when I*I > X -> true;
isPrimeAux(X, I) when X rem I =:= 0 -> false;
isPrimeAux(X, I) -> isPrimeAux(X, I+2).


% P32
gcd(N,0) -> N;
gcd(N,M) -> gcd(M, N rem M).


% P33
coprime(N, M) when N > 0, M > 0 -> gcd(N, M) =:= 1.


% P34
totientPhi(1) -> 1;
totientPhi(M) -> totientPhiAux(1, M).
totientPhiAux(M, M) -> 0;
totientPhiAux(R, M) -> totientPhiAuxS(R, M, coprime(R, M)).
totientPhiAuxS(R, M, true) -> 1 + totientPhiAux(R+1, M);
totientPhiAuxS(R, M, false) -> totientPhiAux(R+1, M).


% P35
primeFactors(N) when N =< 1 -> [];
primeFactors(N) -> primeFactorsAux(N, 2).
primeFactorsAux(1, _I) -> [];
primeFactorsAux(N, I) when I*I > N -> [N];
primeFactorsAux(N, I) when N rem I =:= 0 -> [I|primeFactorsAux(N div I, I)];
primeFactorsAux(N, I) -> primeFactorsAux(N, I+1).


% P36
primeFactorsMul(N) -> encode(primeFactors(N)).


% P37
expo(_B, 0) -> 1;
expo(B, E) when E rem 2 == 0 -> A=expo(B, E div 2), A*A;
expo(B, E) -> A=expo(B, E div 2), B*A*A.

phi(N) -> phiAux(primeFactorsMul(N)).
phiAux([]) -> 1;
phiAux([[M,P]|T]) -> (P-1) * expo(P, M-1) * phiAux(T).


% P39
primesR(I, J) when I > J -> [];
primesR(I, J) -> primesRAux(I, J, isPrime(I)).
primesRAux(I, J, true) -> [I|primesR(I+1, J)];
primesRAux(I, J, false) -> primesR(I+1, J).


% P40
goldbach(N) when N > 2, N rem 2 =:= 0 -> goldbachAux(N, 2).
goldbachAux(N, M) when M > N div 2 -> [];
goldbachAux(N, M) -> goldbachAuxS(N, M, isPrime(M), isPrime(N-M)).

goldbachAuxS(N, M, true, true) -> [M, N-M];
goldbachAuxS(N, M, _, _) -> goldbachAux(N, M+1).