-module(twins).
-compile([export_all]).

launch() ->
    spawn(twins, create, []),
    ok.

create() ->
    spawn_link(twins, zip, [0]),
    timer:sleep(500),
    zap(0).

zip(A) ->
    io:format("zip - ~w~n", [A]),
    timer:sleep(1000),
    zip(A + 1).

zap(A) ->
    io:format("zap - ~w~n", [A]),
    timer:sleep(1000),
    case A of
      A when A < 5 -> ok
    end,
    zap(A + 1).