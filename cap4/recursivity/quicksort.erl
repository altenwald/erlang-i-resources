-module(quicksort).
-export([sort/1]).

split([]) ->
    {[], [], []};
split([H]) ->
    {[H], [], []};
split([Pivote|T]) ->
    Menor = [ X || X <- T, X =< Pivote ],
    Mayor = [ X || X <- T, X > Pivote ],
    {Menor, [Pivote], Mayor}.

merge(L1, L2) ->
    L1 ++ L2.

sort([]) ->
    [];
sort([H]) ->
    [H];
sort(L) ->
    {L1, [Pivote], L2} = split(L),
    merge(sort(L1) ++ [Pivote], sort(L2)).