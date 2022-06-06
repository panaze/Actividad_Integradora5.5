-module(act5_3).
-export([run/0]).
-export([runSeq/2]).
-export([runConc/0]).
-export([lee/3]).
-export([operacion/5]).
-export([imprimir/6]).
-import(timer, [now_diff/2]).
-import(lists,[nth/2]). 
-import(string, [slice/3]).
-import(string, [len/1]).


run() ->
    NumArchivo =1,
    runSeq(NumArchivo, "Secuencial"),
    runConc().

%O(n^4)
runConc()->
    T1 = time(),
    io:format("Metodo Concurrente archivo: ~p~n", [1]),
    spawn(act5_3, lee, [1, "Concurrente", T1]),
    io:format("Metodo Concurrente archivo: ~p~n", [2]), 
    spawn(act5_3, lee, [2, "Concurrente", T1]),
    io:format("Metodo Concurrente archivo: ~p~n", [3]),
    spawn(act5_3, lee, [3, "Concurrente", T1]),
    io:format("Metodo Concurrente archivo: ~p~n", [4]),
    spawn(act5_3, lee, [4, "Concurrente", T1]). 

%O(1)
runSeq(NumArchivo, Filtro) ->
    if
        Filtro == "Concurrente" -> io:format("");
        true ->
            T1 = time(),
            io:format("Metodo secuencial archivo: ~p~n", [NumArchivo]),
            io:format("Tiempo inicial: ~p~n", [T1]),
            lee(NumArchivo, "Secuencial", T1)
    end.

lee(NumArchivo, Filtro, T1) ->
    if 
        NumArchivo >4 -> io:format("");
        true -> FileIn = "case" ++ integer_to_list(NumArchivo)++".in", %Guardamos nombres del archivo de entrada y salida
            FileOut = "case" ++ integer_to_list(NumArchivo)++".out",
            file:delete(FileOut),
            {ok, SIn} = file:open(FileIn, read), %Abrimos archivo de entrada,
            {ok, SOut} = file:open(FileOut, [append]),
            operacion(SIn, SOut, NumArchivo, Filtro, T1) 
    end.

operacion(SIn,SOut, NumArchivo, Filtro, T1) -> 
    Txt = io:get_line(SIn, ''),
    if 
        Txt == eof -> file:close(SIn), file:close(SOut),
            T2 = time(),
            io:format("Tiempo final: ~p~n", [T2]),
            Diff = now_diff(T2, T1),
            io:format("Diferencia de tiempo: ~p~n", [Diff]),
            runSeq(NumArchivo +1, Filtro );
        true ->  %Obtenemos primera linea del archivo

            List1 = string:split(Txt, " ", all), %Convertimos cada elemento de la linea en una misma lista

            
            PrimerInt = list_to_integer(nth(1,List1)), %Convertimos primer elemento de la lista (primer numero) de string a int

            Operador = nth(2,List1), %Guardamos el segundo elemento de la lista (operador) como string 

            %Convertimos tercer elemento de la lista (segundo numero) de string a int quitando el backslash n
            Length = len(nth(3,List1)),
            SegundoInt = list_to_integer(string:slice([nth(3,List1)], 0, Length-1)),
            
            %Checamos que operacion se tiene que hacer, la hacemos con los dos numeros y la guardamos en la variable Respuesta
            case  Operador of 
                "+" -> Respuesta = PrimerInt + SegundoInt; 
                "-" -> Respuesta = PrimerInt - SegundoInt; 
                "*" -> Respuesta = PrimerInt * SegundoInt; 
                "/" -> Respuesta = PrimerInt div SegundoInt; 
                "%" -> Respuesta = PrimerInt rem SegundoInt
            end,

            imprimir(SIn, Respuesta,SOut, NumArchivo, Filtro, T1)
    end.
    
   

%Imprimimos respuesta en archivo de salida
imprimir(SIn, Respuesta,SOut, NumArchivo, Filtro, T1) ->
    io:format(SOut,"~s~n", [integer_to_list(Respuesta)]),
    operacion(SIn, SOut, NumArchivo, Filtro, T1).
    

