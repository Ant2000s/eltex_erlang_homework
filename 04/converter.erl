-module(converter).

-include("conv_info.hrl").

-export([rec_to_rub/1, map_to_rub/1]).

rec_to_rub(#conv_info{type = Type, amount = Amount, commission = Commission}) ->
  if
    is_integer(Amount), Amount > 0 ->
      case Type of
        usd ->
          {ok, Amount * 75.5 * (1 - Commission)};
        euro ->
          {ok, Amount * 80 * (1 - Commission)};
        lari ->
          {ok, Amount * 29 * (1 - Commission)};
        peso ->
          {ok, Amount * 3 * (1 - Commission)};
        krone ->
          {ok, Amount * 10 * (1 - Commission)};
        Error ->
          rec_to_rub(Error)
      end;
    true ->
      rec_to_rub(error)
  end;
rec_to_rub(_) ->
  io:format("Bad argument~n"),
  {error, badarg}.

%% В данном случае тело функции было бы идентично телу функции rec_to_rub, не стал дублировать
map_to_rub(#{type := Type, amount := Amount, commission := Commission}) ->
  rec_to_rub(#conv_info{type = Type, amount = Amount, commission = Commission});
map_to_rub(_) ->
  rec_to_rub(error).
