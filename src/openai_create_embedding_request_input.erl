-module(openai_create_embedding_request_input).

-export([encode/1]).

-export_type([openai_create_embedding_request_input/0]).

-type openai_create_embedding_request_input() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
