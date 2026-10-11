-module(multiMatrix).
-export([trans/1, dot/2, multiMatrix/2]).

trans([]) -> [];
trans([[]|_T]) -> [];
trans(M) -> [[H || [H|_T] <- M] | trans([T || [_H|T] <- M])].

dot(V, W) -> lists:foldl(fun({X,Y}, Acc) -> Acc + X*Y end, 0, lists:zip(V,W)).

multiMatrix(A,B) -> [[dot(R, C) || C <- trans(B)] || R <- A].