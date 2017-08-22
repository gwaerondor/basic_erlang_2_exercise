-module(pingpong).
-export([run/0]).

% For fully qualified calls, the functions must be exported.

run() ->
    Ping_pid = spawn(fun() -> handle_ping() end),
    Pong_pid = spawn(fun() -> handle_pong() end),
    Pong_pid ! {Ping_pid, pong}.
    
handle_ping() ->
    io:format("Ping...~n"),
    timer:sleep(1000),
    {error, not_implemented}.

handle_pong() ->
    io:format("Pong...~n"),
    timer:sleep(1000),
    {error, not_implemented}.

