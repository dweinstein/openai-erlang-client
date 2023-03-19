-module(openai_engine).

-export([encode/1]).

-export_type([openai_engine/0]).

-type openai_engine() ::
    #{ 'id' := binary(),
       'object' := binary(),
       'created' := integer(),
       'ready' := boolean()
     }.

encode(#{ 'id' := Id,
          'object' := Object,
          'created' := Created,
          'ready' := Ready
        }) ->
    #{ 'id' => Id,
       'object' => Object,
       'created' => Created,
       'ready' => Ready
     }.
