-module(act5_3).
-export([lee/1]).
-import(lists,[nth/2]). 
-import(string, [slice/3]).
-import(string, [len/1]).

lee(File) ->

    FileIn = File ++ "1.in",
    FileOut = File ++ "1.out",
    {ok, SIn} = file:open(FileIn, read),
    Txt = io:get_line(SIn, ''),

    List1 = string:split(Txt, " ", all),

    %convertir a int
    PrimerInt = list_to_integer(nth(1,List1)),

    Operador = nth(2,List1),

    Length = len(nth(3,List1)),
    SegundoInt = list_to_integer(string:slice([nth(3,List1)], 0, Length-1)),
    
    case  Operador of 
        "+" -> Respuesta = PrimerInt + SegundoInt; 
        "-" -> Respuesta = PrimerInt - SegundoInt; 
        "*" -> Respuesta = PrimerInt * SegundoInt; 
        "/" -> Respuesta = PrimerInt / SegundoInt; 
        "%" -> Respuesta = PrimerInt rem SegundoInt
    end,
    
    {ok, SOut} = file:open(FileOut, [write]),
    io:format(SOut,"~p~n", [Respuesta]).
    

