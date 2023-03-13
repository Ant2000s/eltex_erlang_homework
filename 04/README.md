##### 1. Проверка функции rec_to_rub
```
1> rd(conv_info, {type, amount, commission}).
conv_info
2> c("D:/eltex/eltex_erlang_homework/04/converter.erl").
{ok,converter}
3> converter:rec_to_rub(#conv_info{type = usd, amount = 100, commission = 0.01}).
{ok,7474.5}
4> converter:rec_to_rub(#conv_info{type = peso, amount = 12, commission = 0.02}).
{ok,35.28}
5> converter:rec_to_rub(#conv_info{type = yene, amount = 30, commission = 0.02}).
Bad argument
{error,badarg}
6> converter:rec_to_rub(#conv_info{type = euro, amount = -15, commission = 0.02}).
Bad argument
{error,badarg}
```
##### 2. Проверка функции map_to_rub
```
7> converter: map_to_rub(#{type => usd, amount => 100, commission => 0.01}).
{ok,7474.5}
8> converter: map_to_rub(#{type => peso, amount => 12, commission => 0.02}).
{ok,35.28}
9> converter: map_to_rub(#{type => yene, amount => 30, commission => 0.02}).
Bad argument
{error,badarg}
10> converter: map_to_rub(#{type => euro, amount => -15, commission => 0.02}).
Bad argument
{error,badarg}
```
##### 3. Рекурсия
###### 3.1. Проверка функции tail_rec
```
11> c("D:/eltex/eltex_erlang_homework/04/recursion.erl").                          
{ok,recursion}
12> recursion:tail_fac(4).
24
13> recursion:tail_fac(0).
1
```
###### 3.2. Проверка функций duplicate и tail_duplicate
```
14> recursion:duplicate([1,2,3]).
[1,1,2,2,3,3]
15> recursion:duplicate([]).     
[]
16> recursion:tail_duplicate([]).
[]
17> recursion:tail_duplicate([1,2,3]).
[1,1,2,2,3,3]
```
##### 4. Создание и проверка алиасов для  tail_fac и tail_duplicate
```
19> Tail_fac = fun recursion:tail_fac/1.
fun recursion:tail_fac/1
20> Tail_dup = fun recursion:tail_duplicate/1.
fun recursion:tail_duplicate/1
21> Tail_fac(4).
24
22>Tail_dup([1,2,3]).      
  [1,1,2,2,3,3]
```
##### 5. Анонимные функции
###### 5.1. Умножение двух элементов
```
30> Multiplication = fun (First, Second) -> First * Second end.
#Fun<erl_eval.41.3316493>
31> Multiplication(2, 3).                                      
6
```
###### 5.2. Преобразование функции to_rub в анонимную и её проверка
```
24> ToRub = fun ({usd, Amount}) -> {ok, Amount * 75,5};
24> ({euro, Amount}) -> {ok, Amount * 80};
24> ({lari, Amount}) -> {ok, Amount * 29};
24> ({peso, Amount}) -> {ok, Amount * 3};
24> ({krone, Amount}) -> {ok, Amount * 10};
24> (_) -> {error, badarg} end.
#Fun<erl_eval.42.3316493>
25> ToRub({usd, 100}).
{ok,7500,5}
26> ToRub({peso, 12}).
{ok,36}
27> ToRub({yene, 30}).
{error,badarg}
28> ToRub({euro, -15}).
{ok,-1200}
```