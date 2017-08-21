-module(pingpong).
-export([run/0]).

run() ->
    Ping_pid = spawn(fun() -> ping() end),
    Pong_pid = spawn(fun() -> pong() end),
    Ping_pid ! {Pong_pid, ping}.
    
ping() ->
    io:format("Ping...~n"),
    timer:sleep(1000),
    {error, not_implemented}.

pong() ->
    io:format("Pong...~n"),
    timer:sleep(1000),
    {error, not_implemented}.
