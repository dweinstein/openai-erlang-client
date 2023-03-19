-module(openai_create_search_response).

-export([encode/1]).

-export_type([openai_create_search_response/0]).

-type openai_create_search_response() ::
    #{ 'object' => binary(),
       'model' => binary(),
       'data' => list()
     }.

encode(#{ 'object' := Object,
          'model' := Model,
          'data' := Data
        }) ->
    #{ 'object' => Object,
       'model' => Model,
       'data' => Data
     }.
