-module(mergesort).
-export([sort/1]).

sort([]) -> [];
sort([H]) -> [H];
sort(L) ->
    {L1, L2} = split(L),
    merge(sort(L1), sort(L2)).

split(L) ->
    lists:split(length(L) div 2, L).

merge([], L) -> L;
merge(L, []) -> L;
merge([H1|T1], [H2|_] = L2) when H1 =< H2 ->
    [H1|merge(T1, L2)];
merge(L1, [H2|T2]) ->
    [H2|merge(L1, T2)].