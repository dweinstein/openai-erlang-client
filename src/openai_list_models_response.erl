-module(openai_list_models_response).

-export([encode/1]).

-export_type([openai_list_models_response/0]).

-type openai_list_models_response() ::
    #{ 'object' := binary(),
       'data' := list()
     }.

encode(#{ 'object' := Object,
          'data' := Data
        }) ->
    #{ 'object' => Object,
       'data' => Data
     }.
