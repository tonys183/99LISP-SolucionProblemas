-module(allPermu).
-export([allPermu/1]).

allPermu([]) -> [];
allPermu(L) -> [[H|T] || H <- L, T <- [L -- [H]]].