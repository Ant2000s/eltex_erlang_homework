##### Выводы по работе
Во всех функциях две последние команды вызывают ошибку из-за неподходящих аргументов: в 3-й команде используется валюта, не обрабатываемая функцией, в 4-й подаётся значение меньше 0, что недопустимо по условиям задачи. Различия между их вызовами находятся только в сообщениях об ошибке, что вызвано различными способами их обработки.
##### Вывод консоли
```
68> c("D:/eltex/eltex_erlang_homework/03/converter.erl").
{ok,converter}
69> converter:to_rub({usd, 100}).                        
Convert usd to rub, amount 100
{ok,7550.0}
70> 
70> converter:to_rub({peso, 12}).
Convert peso to rub, amount 12
{ok,36}
71> 
71> converter:to_rub({yene, 30}).
Bad argument
{error,badarg}
72> 
72> converter:to_rub({euro, -15}).
Bad argument
{error,badarg}
73> converter:to_rub2({usd, 100}).
Convert usd to rub, amount 100
{ok,7550.0}
74> 
74> converter:to_rub2({peso, 12}).
Convert peso to rub, amount 12
{ok,36}
75> 
75> converter:to_rub2({yene, 30}).
Can’t convert yene to rub
{error,badarg}
76> 
76> converter:to_rub2({euro, -15}).
Bad argument
{error,badarg}
77> converter:to_rub3({usd, 100}). 
Convert usd to rub, amount 100
{ok,7550.0}
78> converter:to_rub3({peso, 12}). 
Convert peso to rub, amount 12
{ok,36}
79> converter:to_rub3({yene, 30}). 
Can’t convert to rub, error {yene,30}
{error,badarg}
80> converter:to_rub3({euro, -15}).
Can’t convert to rub, error {euro,-15}
{error,badarg}
```
