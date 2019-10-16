-module(proposal).
-export([run/0,
         loop/0,
         stop/0]).

%%% Kickstart the pingpong process by sending
%%% a message from the shell after connecting the nodes.
%%%
%%% For example:
%%% {pingpong, other_node@host} ! {whereis(pingpong), ping}.

run() ->
    Pid = spawn(fun() -> loop() end),
    register(pingpong, Pid).

stop() ->
    whereis(pingpong) ! stop.

loop() ->
    receive
        {Pid, Message} ->
            io:format("Received ~p...~n", [Message]),
            timer:sleep(1000),
            Pid ! {self(), get_response(Message)},
            ?MODULE:loop();
        stop ->
            ok
    end.

get_response(ping) -> pong;
get_response(pong) -> ping.
