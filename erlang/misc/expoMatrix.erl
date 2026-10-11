-module(expoMatrix).
-export([trans/1, dot/2, multiMatrix/2, identity/1, expoMatrix/2]).

trans([]) -> [];
trans([[]|_T]) -> [];
trans(M) -> [[H || [H|_T] <- M] | trans([T || [_H|T] <- M])].

dot(V, W) -> lists:foldl(fun({X,Y}, Acc) -> Acc + X*Y end, 0, lists:zip(V,W)).

multiMatrix(A,B) -> [[dot(R, C) || C <- trans(B)] || R <- A].

identity(N) ->[[1 * (I =:= J) || J <- lists:seq(1,N)] || I <- lists:seq(1,N)].

expoMatrix(M, 0) -> identity(length(M));
expoMatrix(M, 1) -> M;
expoMatrix(M, Exp) when Exp rem 2 =:= 0 -> T = expoMatrix(M, Exp div 2), multiMatrix(T, T);
expoMatrix(M, Exp) -> multiMatrix(M, expoMatrix(M, Exp-1)).