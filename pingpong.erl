-module(pingpong).
-export([run/0]).

%%% Kickstart the pingpong process by sending
%%% a message from the shell after connecting the nodes.
%%%
%%% For example:
%%% {pingpong, other_node@host} ! {whereis(pingpong), ping}.

run() ->
    Pid = spawn(fun() -> loop() end),
    register(pingpong, Pid).

loop() ->
    io:format("Received... ~p~n", [nothing]),
    timer:sleep(1000),
    {error, not_implemented}.
