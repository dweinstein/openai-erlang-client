-module(openai_list_fine_tunes_response).

-export([encode/1]).

-export_type([openai_list_fine_tunes_response/0]).

-type openai_list_fine_tunes_response() ::
    #{ 'object' := binary(),
       'data' := list()
     }.

encode(#{ 'object' := Object,
          'data' := Data
        }) ->
    #{ 'object' => Object,
       'data' => Data
     }.
