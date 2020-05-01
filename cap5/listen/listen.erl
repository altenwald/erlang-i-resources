-module(listen).
-export([listen/0, stop/1, speak/2, init/0]).

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

stop(Pid) ->
    Pid ! stop,
    ok.

speak(Pid, Something) ->
    Pid ! {self(), Something},
    receive
        ok -> ok
    end,
    ok.

init() ->
    spawn(listen, listen, []).