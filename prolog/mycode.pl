%% P01
myLast([],[]):-!.
myLast([H],H):-!.
myLast([_H|T],X):- myLast(T,X).


%% P02
myButLast([],[]):-!.
myButLast([H,_],H):-!.
myButLast([_H|T],X):- myButLast(T,X).


%% P03
elementAt([],[]):-!.
elementAt([H|_T],0,H):-!.
elementAt([_H|T],X,E):- X2 is X-1, elementAt(T,X2,E).


%% P04
myLength([],0):-!.
myLength([_H|T],X):- myLength(T,X1), X is X1+1.


%% P05
myReverse([],[]):-!.
myReverse([H|T],LR):- myReverse(T,TR), append(TR,[H],LR).


%% P06
isPalindrome(L):- myReverse(L,L).


%% P07
myFlatten([],[]):-!.
myFlatten([[H|T]|T2], FL):- myFlatten([H|T], FLH), myFlatten(T2,T2FL), append(FLH, T2FL, FL).
myFlatten([H|T],FL):- myFlatten(T,TFL), append([H],TFL,FL).


%% P08
compress([],[]):-!.
compress([H,H|T],L):-!, compress([H|T],L).
compress([H|T],[H|L]):- compress(T,L).


%% P09
packo([],[]):-!.
packo([H,H|T], [[H|S]|L]):- packo([H|T], [S|L]).
packo([H|T], [[H]|L]):- packo(T,L).


%% P10
encode([],[]):-!.
encode([H],[[1,H]]):-!.
encode([H,H|T], [[C,H]|L]):- encode([H|T], [[C1,H]|L]), C is C1+1, !.
encode([H|T], [[1,H]|L]):- encode(T, L).


%% P11
encodeMod([], []):-!.
encodeMod([H|T], R):- encodeModAux(T, H, 1, R).

encodeModAux([], E, 1, [E]):-!.
encodeModAux([], E, C, [[C,E]]):- C > 1.
encodeModAux([H|T], H, C, R):- C1 is C + 1, encodeModAux(T, H, C1, R).
encodeModAux([H|T], E, 1, [E|R]):- H \= E, encodeModAux(T, H, 1, R).
encodeModAux([H|T], E, C, [[C,E]|R]):- H \= E, C > 1, encodeModAux(T, H, 1, R).


%% P12
repeat(0, _, []):-!.
repeat(N, E, [E|T]):- N1 is N-1, repeat(N1, E, T).

decodeMod([], []):-!.
decodeMod([[N,E]|T], R):- repeat(N, E, L), decodeMod(T, TR), append(L, TR, R).
decodeMod([H|T], [H|TR]):- H \= [_ | _], decodeMod(T, TR).


%% P13
encodeDir([], []):-!.
encodeDir([H|T], R):- encodeDirAux(T, H, 1, R).

encodeDirAux([], E, 1, [E]):-!.
encodeDirAux([], E, C, [[C,E]]):- C > 1.
encodeDirAux([H|T], H, C, R):- C1 is C + 1, encodeDirAux(T, H, C1, R).
encodeDirAux([H|T], E, 1, [E|R]):- H \= E, encodeDirAux(T, H, 1, R).
encodeDirAux([H|T], E, C, [[C,E]|R]):- H \= E, C > 1, encodeDirAux(T, H, 1, R).


%% P14
dupli([], []):-!.
dupli([H], [H,H]):-!.
dupli([H|T], [H,H|TR]):- dupli(T, TR).


%% P15
repli([], _N, []):-!.
repli([H|T], N, R):- repliAux(H, N, L), repli(T, N, TR), append(L, TR, R).
repliAux(_H, 0, []).
repliAux(H, N, [H|T]):- N1 is N-1, repliAux(H, N1, T).


%% P16
drop(L, N, R):- dropAux(L, N, 1, R).
dropAux([], _N, _C, []):-!.
dropAux([_H|T], N, C, R):- C mod N =:= 0, dropAux(T, N, 1, R).
dropAux([H|T], N, C, [H|R]):- C1 is C + 1, dropAux(T, N, C1, R).


%% P17
splito(L, N, R):- splitAux(L, N, [], R).
splitAux([], _N, G, [RVG, []]):- reverse(G, RVG).
splitAux([H|T], 0, G, [RVG, [H|T]]):- reverse(G, RVG).
splitAux([H|T], N, G, R):- N1 is N-1, splitAux(T, N1, [H|G], R).


%% P18
slice([], _I, _J, []):-!.
slice(_L, I, J, []):- I > J, !.
slice([H|T], 1, J, [H|R]):- J >= 1, J1 is J-1, slice(T, 1, J1, R).
slice([_H|T], I, J, R):- I1 is I-1, J1 is J-1, slice(T, I1, J1, R).

%% P19
rotate([], _N, []):-!. 
rotate(L, 0, L):-!.
rotate(L, N, R):- length(L, Len), S is N mod Len, splito(L, S, [L1, L2]), append(L2, L1, R).


%% P20
removeAt([], _N, []):-!.
removeAt([_H|T], 1, T):-!.
removeAt([H|T], N, [H|R]):- N1 is N-1, removeAt(T, N1, R).


%% P21
insertAt(_, [], _N, []):-!.
insertAt(E, [H|T], 1, [E,H|T]):-!.
insertAt(E, [H|T], N, [H|R]):- N1 is N-1, insertAt(E, T, N1, R).


%% P22
range(I, J, []):- I > J, !.
range(I, J, [I|R]):- I1 is I+1, range(I1, J, R).


%% P23
rndSelect([], _N, _G):-!.
rndSelect(_L, 0, []):-!.
rdnSelect(L, N, [H|T]):- member(H,L), delete(L,H,L1), N1 is N-1, rndSelect(L1,N1,T).


%% P24
diffSelect(N, M, R):- range(1, M, L), rndSelect(L, N, R).


%% P25
rndPermu([],[]):-!.
rndPermu(L,[H|T]):- member(H,L), delete(L,H,L1), rndPermu(L1,T).


%% P26
combination(_, 0, []):-!.
combination([H|T], N, [H|R]) :- N1 is N-1, combination(T, N1, R).
combination([_H|T], N, R):- combination(T, N, R).


%% P27
group(_S, [], []):-!.
group(S, [G1|GR], [C|GS]):- combination(S, G1, C), subtract(S, C, R), group(R, GR, GS).


%% P28
insertLength(X, [], [X]):-!.
insertLength(X, [H|T], [X,H|T]):- length(X, LX), length(H, LH), LX =< LH, !.
insertLength(X, [H|T], [H|R]):- insertLength(X, T, R).

lsort([], []):-!.
lsort([H|T], R):- lsort(T, RT), insertLength(H, RT, R).


%% P31
isPrime(2):-!.
isPrime(X):- X > 2, X mod 2 =\= 0, isPrimeAux(X, 3).
isPrimeAux(X, I):- I*I > X, !.
isPrimeAux(X, I):- X mod I =\= 0, I1 is I+2, isPrimeAux(X, I1).


%% P32
gcd(N, 0, N):-!.
gcd(N, M, X):- R is N mod M, gcd(M, R, X).


%% P33
coprime(N, M):- gcd(N, M, 1).


%% P34
gcdM(N, 0, N):- !.
gcdM(N, M, X):- M > 0, R is N mod M, gcdM(M, R, X).
coprimeM(N, M):- N > 0, M > 0, gcdM(N, M, 1).

totientPhi(N, R):- N > 0, totientPhiAux(N, 1, 0, R).
totientPhiAux(N, I, C, C):- I > N, !.
totientPhiAux(N, I, C, R):- I =< N, coprimeM(I, N), C1 is C+1, I1 is I+1, totientPhiAux(N, I1, C1, R).
totientPhiAux(N, I, C, R):- I =< N, I1 is I+1, totientPhiAux(N, I1, C, R).


%% P35
primeFactors(N, []):- N =< 1, !.
primeFactors(N, R):- primeFactorsAux(N, 2, R).
primeFactorsAux(1, _I, []):- !.
primeFactorsAux(N, I, [N]):- I*I > N, !.
primeFactorsAux(N, I, [I|R]):- N mod I =:= 0, N1 is N div I, primeFactorsAux(N1, I, R).
primeFactorsAux(N, I, R) :- I1 is I+1, primeFactorsAux(N, I1, R).


%% P36
primeFactorsMul(N,R):- primeFactors(N,NF), encode(NF,R).


%% P37
expo(_B, 0, 1):-!.
expo(B, E, R):- 0 is E mod 2, !, E1 is E div 2, expo(B, E1, A), R is A*A.
expo(B, E, R):- E1 is E div 2, expo(B, E1, A), R is B*A*A.

phi(N, R):- primeFactorsMul(N, FP), phiAux(FP, R).
phiAux([], 1):-!.
phiAux([[M,P]|T], R):- M1 is M-1, expo(P, M1, POT), A is (P-1)*POT, phiAux(T, TR), R is A*TR.


%% P39
primesR(I, J, []):- I > J, !.
primesR(I, J, [I|R]):- I =< J, isPrime(I), !, I1 is I+1, primesR(I1, J, R).
primesR(I, J, R):- I =< J, I1 is I+1, primesR(I1, J, R).


%% P40
goldbach(N,A,B):- primesR(2,N,P), member(A,P), member(B,P), N is A+B, A =< B.


%% P49
grayCodeAux('0', P, T):- T = P.
grayCodeAux('1', P, T):- reverse(P, RP), T = RP.
grayCode(0, []):-!.
grayCode(N, [H|T]):- N1 is N-1, grayCode(N1, P), grayCodeAux(H, P, T).


%% P54
isTree([]):-!.
isTree([_, I, D]):- isTree(I), isTree(D).


%% P55
arbBal(0, []):-!.
arbBal(N, [x, I, D]):- N1 is N-1, arbBal(N1, I), arbBal(N1, D).
arbBal(N, [x, I, D]):- N1 is N-1, N2 is N-2, N2 >= 0, arbBal(N1, I), arbBal(N2, D).
arbBal(N, [x, I, D]):- N1 is N-1, N2 is N-2, N2 >= 0, arbBal(N2, I), arbBal(N1, D).


%% P55
mirror([],[]):-!.
mirror([_R1,I1,D1],[_R2,D2,I2]):- mirror(I1,I2), mirror(D1,D2).

symmetric([]):-!.
symmetric([_]):-!.
symmetric([_R1,I,D]):- mirror(I,D).


%% P56
add(E, [], [E, [], []]):-!.
add(E, [R, I, D], [R, NSubI, D]):- E < R, !, add(E, I, NSubI).
add(E, [R, I, D], [R, I, NSubD]):- E > R, !, add(E, D, NSubD).
add(E, [E, I, D], [E, I, D]):-!.

binArb([], []):-!.
binArb([H|T], A):- binArb(T, TA), add(H, TA, A).


%% P60


%% P61
countH([], 0):-!.
countH([_H, [], []], 1):-!.
countH([_R, I, D], N):- countH(I, N1), countH(D, N2), N is N1+N2.


%% P61
collectH([], []):-!.
collectH([H, [], []], [H]):-!.
collectH([_R, I, D], L):- collectH(I, HI), collectH(D, HD), append(HI,HD,L).


%% P62
collectN([], []):-!.
collectN([_H, [], []], []):-!.
collectN([R, I, D], [R|L]):- collectN(I, NI), collectN(D, ND), append(NI, ND, L).


%% P62B
collectNL([], _, []):-!.
collectNL([R, _I, _D], 0, [R]):-!.
collectNL([_R, I, D], N, L):- N1 is N-1, collectNL(I, N1, NI), collectNL(D, N1, ND), append(NI, ND, L).


%% P63
binArbComp(0, []):-!.
binArbComp(N, [x, I, D]):- N1 is N-1, ND is N1 // 2, NI is N1-ND, binArbComp(NI, I), binArbComp(ND, D).


%% P68
preorder([], []):-!.
preorder([R], [R]):-!.
preorder([R,I,D], [R|L]):- preorder(I,LI), preorder(D, LD), append(LI, LD, L).

inorder([], []):-!.
inorder([R], [R]):-!.
inorder([R,I,D], L):- inorder(I,LI), inorder(D, LD), append(LI, [R|LD], L).


%% P70B
multiTreeAux([]):-!.
multiTreeAux([R|H]):- multiTree(R), multiTreeAux(H).
multiTree([_R|H]):- multiTreeAux(H).


%% P70C
countMultiNAux([], 0):-!.
countMultiNAux([R|H], N):- countMultiN(R, RN), countMultiNAux(H, HN), N is RN+HN.
countMultiN([_R|H], N):- countMultiNAux(H, HN), N is HN+1.


%% P71
pathMultiAux([], _P, 0):-!.
pathMultiAux([R|H], P, N):- pathMulti(R, P, RN), pathMultiAux(H, P, HN), N is RN+HN.

pathMulti([_R|H], P, N):- P1 is P+1, pathMultiAux(H, P1, HN), N is P+HN.
pathMulti(T, N):- pathMulti(T, 0, N).


%% P81
pathsAux(_G, F, F, _V, [F]):-!.
pathsAux(G, NA, F, V, [NA|RP]):- member([NA, VC], G), member(NS, VC), \+member(NS, V), pathsAux(G, NS, F, [NA|V], RP).
paths(I, F, G, P):- pathsAux(G, I, F, [], P).


%% P82
cycle(I, G, P):- member([NI, VC], G), member(I, VC), pathsAux(G, I, NI, [], PNI), append(PNI, [I], P).


%% P83
allNodes([], []).
allNodes([[N,_]|T], [N|NT]) :- allNodes(T, NT).

buildSP(_G, _Vis, [], SP, SP):-!.
buildSP(G, Vis, ToVisit, Tree, SP):-
    member(U, Vis),
    member([U, VC], G),
    member(V, VC),
    member(V, ToVisit),
    select(V, ToVisit, RemainingToVisit),
    Edge = U-V,
    buildSP(G, [V|Vis], RemainingToVisit, [Edge|Tree], SP).

spaTree(G, SP):- allNodes(G, VT), VT \= [], VT = [R|T], buildSP(G, [R], T, [], RT), sort(RT, SP).


%% P84


%% P85


%% P87
allVeci(N, [[N,V]|_], V):- !.
allVeci(N, [_|T], V):- allVeci(N, T, V).

searchVC(_G, [], _Vis, []):-!.
searchVC(G, [N|VC], Vis, P):- 
    depthFirstAux(G, N, Vis, SP),
    append(SP, RP, P),
    append(SP, Vis, VisAc),
    searchVC(G, VC, VisAc, RP).

depthFirstAux(_G, N, Vis, []):- member(N, Vis), !.
depthFirstAux(G, N, Vis, [N|P]):-
    allVeci(N, G, UVC),
    findall(NoV, (member(NoV, UVC), \+ member(NoV, Vis)), NoVC),
    searchVC(G, NoVC, [N|Vis], P).

depthFirst(G, I, P):- depthFirstAux(G, I, [], P).


%% P88
connCompoAux([], _G, []):-!.
connCompoAux([N|RN], G, [C|RC]):-
    depthFirst(G, N, OC),
    sort(OC, C),
    subtract(RN, C, NRN),
    connCompoAux(NRN, G, RC).

connCompo(G, C):- allNodes(G, AllN), connCompoAux(AllN, G, C).


%% P89
undir([], []):-!.
undir([[A,B]|T], [[A,B],[B,A]|R]):- undir(T, R).

colocar(X,Y,C1,C2, C1, [Y|C2]):- member(X,C1), !.
colocar(X,Y,C1,C2, [Y|C1], C2):- member(X,C2), !.
colocar(X,Y,C1,C2, C1, [X|C2]):- member(Y,C1), !.
colocar(X,Y,C1,C2, [X|C1], C2):- member(Y,C2), !.
colocar(X,Y,C1,C2, [X|C1], [Y|C2]):-!.

esbipartitoAux([], _, _).
esbipartitoAux([[X,Y]|T], C1, C2) :-
    \+ (member(X, C1), member(Y, C1)),
    \+ (member(X, C2), member(Y, C2)),
    colocar(X,Y,C1,C2,NewC1,NewC2),
    esbipartitoAux(T, NewC1, NewC2).

esbipartito(G):- undir(G, U), esbipartitoAux(U, [], []).


% Verificar si hay camino
veriCamino([],_G):-!.
veriCamino([A], G):- member([A, _V], G), !.
veriCamino([A,B|T], G):- member([A, V], G), member(B, V), veriCamino([B|T], G).


% Verificar si hay camino simple
veriCaminoSimple([], _G):-!.
veriCaminoSimple([A], G):- member([A,_], G), !.
veriCaminoSimple([A,B|T], G):- member([A,V], G), member(B,V), \+member(B, [A|T]), veriCaminoSimple([B|T], G).


% Constuir camino
constCamino(A, A, [A], _G):-!.
constCamino(A, B, [A,B], G):- member([A,V], G), member(B, V).
constCamino(A, B, [A,C|Cam], G):- member([A,V], G), member(C, V), constCamino(C, B, Cam, G).


% Constuir camino evitando ciclos & simple
constCaminoCS(A, A, [A], _G, _Vis):-!.
constCaminoCS(A, B, [A,B], G, _Vis):- member([A,V], G), member(B, V).
constCaminoCS(A, B, [A|Cam], G, Vis):- member([A,V], G), member(C, V), \+member(C, Vis), constCaminoCS(C, B, Cam, G, [C|Vis]).


% Verificar conexo
union([], L, L):-!.
union([H|T], L, R):- member(H, L), union(T, L, R).
union([H|T], L, [H|R]):- union(T, L, R).

veriConexoAux(_, [], Vis, Vis):-!.
veriConexoAux(G, [N|Rest], Vis, VisF):-
    member([N, Veci], G),
    union(Veci, Rest, NRest),
    subtract(NRest, Vis,PRest),
    veriConexoAux(G, PRest, [N|Vis], VisF).

veriConexo(G):-
    G = [[N,_]|_],
    veriConexoAux(G, [N], [], VisF),
    length(G, Len),
    length(VisF, Len).
