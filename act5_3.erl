-module(act5_3).
-export([run/0]).
-export([lee/1]).
-export([operacion/3]).
-export([imprimir/4]).
-import(lists,[nth/2]). 
-import(string, [slice/3]).
-import(string, [len/1]).

run() ->
    NumArchivo =1,
    lee(NumArchivo).

lee(NumArchivo) ->
    if 
        NumArchivo >4 -> io:format("");
        true -> FileIn = "case" ++ integer_to_list(NumArchivo)++".in", %Guardamos nombres del archivo de entrada y salida
            FileOut = "case" ++ integer_to_list(NumArchivo)++".out",
            file:delete(FileOut),
            {ok, SIn} = file:open(FileIn, read), %Abrimos archivo de entrada,
            {ok, SOut} = file:open(FileOut, [append]),
            operacion(SIn, SOut, NumArchivo) 
    end.

operacion(SIn,SOut, NumArchivo) -> 
    Txt = io:get_line(SIn, ''),
    if 
        Txt == eof -> file:close(SIn), file:close(SOut), lee(NumArchivo +1);
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

            imprimir(SIn, Respuesta,SOut, NumArchivo)
    end.
    
   

%Imprimimos respuesta en archivo de salida
imprimir(SIn, Respuesta,SOut, NumArchivo) ->
    io:format(SOut,"~s~n", [integer_to_list(Respuesta)]),
    operacion(SIn, SOut, NumArchivo).
    

