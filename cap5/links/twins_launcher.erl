-module(twins_launcher).
-compile([export_all]).

launch() ->
    LauncherPid = launcher:init(),
    Zip = spawn(twins_launcher, zip, [0]),
    launcher:add(LauncherPid, Zip),
    timer:sleep(500),
    Zap = spawn(twins_launcher, zap, [0]),
    launcher:add(LauncherPid, Zap),
    LauncherPid.

zip(A) ->
    io:format("zip - ~w~n", [A]),
    timer:sleep(1000),
    zip(A + 1).

zap(A) ->
    io:format("zap - ~w~n", [A]),
    timer:sleep(1000),
    zap(A + 1).