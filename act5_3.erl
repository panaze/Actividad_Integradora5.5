-module(act5_3).
-export([lee/1]).
-export([operacion/2]).
-export([imprimir/2]).
-import(lists,[nth/2]). 
-import(string, [slice/3]).
-import(string, [len/1]).

lee(File) ->

    %Guardamos nombres del archivo de entrada y salida
    FileIn = File ++ "1.in", 
    FileOut = File ++ "1.out",

    operacion(FileIn,FileOut).

operacion(FileIn,FileOut) -> 
    {ok, SIn} = file:open(FileIn, read), %Abrimos archivo de entrada

    Txt = io:get_line(SIn, ''), %Obtenemos primera linea del archivo

    List1 = string:split(Txt, " ", all), %Convertimos cada elemento de la linea en una misma lista

    
    PrimerInt = list_to_integer(nth(1,List1)), %Convertimos primer elemento de la lista (primer numero) de string a int

    Operador = nth(2,List1), %Guardamos el segundo elemento de la lista (operador) como string en variable Operador

    %Convertimos tercer elemento de la lista (segundo numero) de string a int quitando el backslash n
    Length = len(nth(3,List1)),
    SegundoInt = list_to_integer(string:slice([nth(3,List1)], 0, Length-1)),
    
    %Checamos que operacion se tiene que hacer, la hacemos con los dos numeros y la guardamos en la variable Respuesta
    case  Operador of 
        "+" -> Respuesta = PrimerInt + SegundoInt; 
        "-" -> Respuesta = PrimerInt - SegundoInt; 
        "*" -> Respuesta = PrimerInt * SegundoInt; 
        "/" -> Respuesta = PrimerInt / SegundoInt; 
        "%" -> Respuesta = PrimerInt rem SegundoInt
    end,

    imprimir(Respuesta,FileOut).

%Imprimimos respuesta en archivo de salida
imprimir(Respuesta,FileOut) ->
    {ok, SOut} = file:open(FileOut, [write]),
    io:format(SOut,"~p~n", [Respuesta]).
    

