-module(relic_war_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    AChild = {'relic_war_server',{'relic_war_server',start_link,[]},
          temporary,600000,worker,['relic_war_server']},
    {ok,{{simple_one_for_one,3,10}, [AChild]}}.
