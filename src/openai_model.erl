-module(openai_model).

-export([encode/1]).

-export_type([openai_model/0]).

-type openai_model() ::
    #{ 'id' := binary(),
       'object' := binary(),
       'created' := integer(),
       'owned_by' := binary()
     }.

encode(#{ 'id' := Id,
          'object' := Object,
          'created' := Created,
          'owned_by' := OwnedBy
        }) ->
    #{ 'id' => Id,
       'object' => Object,
       'created' => Created,
       'owned_by' => OwnedBy
     }.
