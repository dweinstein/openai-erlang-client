-module(openai_create_embedding_response).

-export([encode/1]).

-export_type([openai_create_embedding_response/0]).

-type openai_create_embedding_response() ::
    #{ 'object' := binary(),
       'model' := binary(),
       'data' := list(),
       'usage' := openai_create_embedding_response_usage:openai_create_embedding_response_usage()
     }.

encode(#{ 'object' := Object,
          'model' := Model,
          'data' := Data,
          'usage' := Usage
        }) ->
    #{ 'object' => Object,
       'model' => Model,
       'data' => Data,
       'usage' => Usage
     }.
