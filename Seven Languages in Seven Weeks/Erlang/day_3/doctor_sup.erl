-module(doctor_sup).
-behaviour(supervisor).
-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link(doctor_sup, []).

init(_Args) ->
    {ok, {{one_for_one, 10, 1},
          [{doctor,
            {doctor, start_link, []},
            permanent, 
            brutal_kill,
            worker, 
            [doctor]}]}}.
