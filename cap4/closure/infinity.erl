-module(infinity).
-compile([export_all]).

integers(From) ->
    fun() ->
        [From|integers(From + 1)]
    end.