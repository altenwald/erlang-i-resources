-module(listen).
-compile([export_all]).

listen() ->
    receive
        {From, Message} ->
            io:format("received: ~p~n", [Message]),
            From ! ok,
            listen();
        stop ->
            io:format("finished process~n")
    after 5000 ->
        io:format("tell me something!~n"),
        listen()
    end.

para(Pid) ->
    Pid ! stop,
    ok.

dime(Pid, Algo) ->
    Pid ! {self(), Algo},
    receive
        ok -> ok
    end,
    ok.

init() ->
    spawn(listen, listen, []).