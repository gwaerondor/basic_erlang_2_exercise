-module(pingpong_local).
-export([run/0]).

% For fully qualified calls, the functions must be exported.

run() ->
    Ping_pid = spawn(fun() -> handle_ping() end),
    Pong_pid = spawn(fun() -> handle_pong() end),
    Pong_pid ! {Ping_pid, pong}.

handle_ping() ->
    receive
        {Pid, ping} ->
            io:format("Ping...~n"),
            Pid ! {self(), pong}
    end,
    timer:sleep(1000),
    handle_ping().

handle_pong() ->
    receive
        {Pid, pong} ->
            io:format("Pong...~n"),
            Pid ! {self(), ping}
    end,
    timer:sleep(1000),
    handle_pong().
