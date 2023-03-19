-module(openai_images_response).

-export([encode/1]).

-export_type([openai_images_response/0]).

-type openai_images_response() ::
    #{ 'created' := integer(),
       'data' := list()
     }.

encode(#{ 'created' := Created,
          'data' := Data
        }) ->
    #{ 'created' => Created,
       'data' => Data
     }.
