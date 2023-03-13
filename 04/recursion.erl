-module(recursion).

-export([tail_fac/1, duplicate/1, tail_duplicate/1]).

tail_fac(N) when N >= 0 -> tail_fac(N, 1).
tail_fac(0, Result) -> Result;
tail_fac(N, Result) -> tail_fac(N - 1, Result * N).

duplicate([]) -> [];
duplicate([Elem | Rest]) ->
  [Elem, Elem | duplicate(Rest)].

tail_duplicate(Primary) ->
  tail_duplicate(Primary,[]).
tail_duplicate([], Result) -> Result;
tail_duplicate([First | Rest], Result) ->
  tail_duplicate(Rest, Result ++ [First, First]).
