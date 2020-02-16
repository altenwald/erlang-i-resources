-module(ets_show).
-compile([export_all]).

show_all(Ets) ->
    show_all(Ets, ets:first(Ets), []).

show_all(_Ets, '$end_of_table', List) ->
    List;
show_all(Ets, Id, List) ->
    show_all(Ets,ets:next(Ets,Id),ets:lookup(Ets,Id) ++ List).

main() ->
    ets:new(my_bag, [named_table, bag]),
    Colors = [{red, 255, 0, 0},
              {green, 0, 255, 0},
              {blue, 0, 0, 255}],
    ets:insert(my_bag, Colors),
    show_all(my_bag).