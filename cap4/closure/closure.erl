-module(closure).
-compile([export_all]).

multiplier(X) when is_integer(X) ->
    fun(Y) -> X * Y end.