-module(openai_create_search_response_data_inner).

-export([encode/1]).

-export_type([openai_create_search_response_data_inner/0]).

-type openai_create_search_response_data_inner() ::
    #{ 'object' => binary(),
       'document' => integer(),
       'score' => integer()
     }.

encode(#{ 'object' := Object,
          'document' := Document,
          'score' := Score
        }) ->
    #{ 'object' => Object,
       'document' => Document,
       'score' => Score
     }.
