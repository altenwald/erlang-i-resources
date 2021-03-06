-module(fact).
-export([main/1]).

main([]) ->
    io:format("Usage: fact <number>~n~n"),
    1;
main([NumberTxt]) ->
    try
        Number = list_to_integer(NumberTxt),
        io:format("~p! = ~p~n", [Number, fact(Number)]),
        0
    catch
        error:badarg -> main([])
    end.

fact(1) -> 1;
fact(N) -> N * fact(N-1).