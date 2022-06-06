-module(act5_3).
-export([lee/1]).
-export([operacion/2]).
-export([imprimir/3]).
-import(lists,[nth/2]). 
-import(string, [slice/3]).
-import(string, [len/1]).

lee(File) ->

    %Guardamos nombres del archivo de entrada y salida
    FileIn = File ++ "1.in", 
    FileOut = File ++ "1.out",
    file:delete(File ++ "1.out"),
    {ok, SIn} = file:open(FileIn, read), %Abrimos archivo de entrada,
    {ok, SOut} = file:open(FileOut, [append]),

    operacion(SIn, SOut).

operacion(SIn,SOut) -> 
    Txt = io:get_line(SIn, ''),
    if 
        Txt == eof -> file:close(SIn);
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

            imprimir(SIn, Respuesta,SOut)
    end.
    
   

%Imprimimos respuesta en archivo de salida
imprimir(SIn, Respuesta,SOut) ->
    io:format(SOut,"~s~n", [integer_to_list(Respuesta)]),
    operacion(SIn, SOut).
    

