-module(launcher).
-compile([export_all]).

init() ->
    spawn(launcher, loop, []).

loop() ->
    receive
        {link, Pid} ->
            link(Pid);
        error ->
            throw(error)
    end,
    loop().

add(Launcher, Pid) ->
    Launcher ! {link, Pid},
    ok.