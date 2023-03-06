-module(converter).

-export([to_rub/1, to_rub2/1, to_rub3/1]).

to_rub({usd, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [usd, Amount]),
  {ok, Amount * 75.5};
to_rub({euro, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [euro, Amount]),
  {ok, Amount * 80};
to_rub({lari, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [lari, Amount]),
  {ok, Amount * 29};
to_rub({peso, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [peso, Amount]),
  {ok, Amount * 3};
to_rub({krone, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [krone, Amount]),
  {ok, Amount * 10};
to_rub(_) ->
  io:format("Bad argument~n"),
  {error, badarg}.

to_rub2({Currency, Amount}) when is_integer(Amount), Amount > 0 ->
  Result =
    case Currency of
      usd ->
        Amount * 75.5;
      euro ->
        Amount * 80;
      lari ->
        Amount * 29;
      peso ->
        Amount *3;
      krone ->
        Amount * 10;
      Error ->
        io:format("Can’t convert ~p to rub~n", [Error])
    end,
  if
  is_number(Result) ->
    io:format("Convert ~p to rub, amount ~p~n", [Currency, Amount]),
    {ok, Result};
  true ->
    {error, badarg}
  end;
to_rub2(_) ->
  io:format("Bad argument~n"),
  {error, badarg}.

to_rub3(Arg) ->
  case Arg of
    {usd, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [usd, Amount]),
      {ok, 75.5 * Amount};
    {euro, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [euro, Amount]),
      {ok, 80 * Amount};
    {lari, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [lari, Amount]),
      {ok, 75.5 * Amount};
    {peso, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [peso, Amount]),
      {ok, 75.5 * Amount};
    {krone, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [krone, Amount]),
      {ok, 75.5 * Amount};
    Error ->
      io:format("Can’t convert to rub, error ~p~n", [Error]),
      {error, badarg}
  end.


