-module(monitor).
-export([init/0, add/2]).

init() ->
    Pid = spawn(fun() -> loop([]) end),
    register(monitor, Pid),
    ok.

loop(State) ->
    receive
        {monitor, From, Name, Fun} ->
            Pid = launch(Name, Fun),
            From ! {ok, Name},
            loop([{Pid, [Name, Fun]}|State]);
        {'DOWN', _Ref, process, Pid, _Reason} ->
            [Name, Fun] = proplists:get_value(Pid, State),
            NewPid = launch(Name, Fun),
            io:format("waking up child in ~p~n", [NewPid]),
            OldChild = {Pid, [Name, Fun]},
            NewChild = {NewPid, [Name, Fun]},
            loop([NewChild|State] -- [OldChild])
    end.

launch(Name, Fun) ->
    Pid = spawn(Fun),
    register(Name, Pid),
    monitor(process, Pid),
    Pid.

add(Name, Fun) ->
    monitor ! {monitor, self(), Name, Fun},
    receive {ok, Pid} -> Pid end.