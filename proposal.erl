-module(proposal).
-author(egiaalo).
-export([run/1, loop/0]).

run(Name) when is_atom(Name) ->
    spawn(init(Name));
run(_) ->
    io:format("Error: a process name must be an atom~n"),
    {error, invalid_process_name}.

init(Name) ->
    fun() ->
	    register(Name, self()),
	    loop()
    end.

loop() ->
    receive
	Message ->
	    handle(Message)
    end,
    ?MODULE:loop().

handle({ping, Other_node}) ->
    io:format("Received ping!~n"),
    timer:sleep(500),
    Other_node ! {pong, self()};
handle({pong, Other_node}) ->
    io:format("Received pong!~n"),
    timer:sleep(500),
    Other_node ! {ping, self()}.

%% Start pinging by connecting the two nodes,
%% starting the processes with run(Name) on both
%% and then send the first ping or pong manually,
%% {bob, bob@host} ! {ping, whereis(alice)}.
