# Exercise for Basic Erlang 2
This repository contains a skeleton for an exercise included in the
"Basic Erlang Part 2" course/presentation.

A solution proposal is also included.

## Exercise
Write a small Ping-Pong program that runs in 2 nodes.
The program sends a message back and forth between the shell processes,
which is printed to the shell.
Make use of the following erlang functionality:
```erlang
    register
    spawn
    receive
    !
```
The program has to be kickstarted manually via manual interaction - this is okay.

### Skeleton
Skeleton for the exercise can be found in pingpong.erl
Be aware that the solution needs to be loaded and kickstarted manually.
1. Start the server on two different nodes
2. Send a ping manually in the same way the program would send it
3. The other node should now automatically respond with a pong.
4. The first node should now automatically respond with another ping.

There are no tests due to the multi-node nature of the exercise.

### Solution proposal
A solution proposal is included in proposal.erl
Don't copy it! 

## Credits
Credits for the initial versions of the presentation and the exercise
with its solution goes to Gianfranco Alongi, https://github.com/Gianfrancoalongi