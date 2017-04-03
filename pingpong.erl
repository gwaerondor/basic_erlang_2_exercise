-module(pingpong).
-export([run/1]).

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
    receive Message ->
	    io:format("Received: ~p~n", [Message]),
	    handle(Message)
    end,
    loop().

handle(Message) ->
    {error, not_implemented}.
