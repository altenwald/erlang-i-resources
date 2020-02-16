-module(testing).
-export([code_change/0, init/0]).

init() ->
    loop().

code_change() ->
    loop().

loop() ->
    receive Any -> io:format("original: ~p~n", [Any]) end,
    testing:code_change().