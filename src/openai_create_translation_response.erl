-module(openai_create_translation_response).

-export([encode/1]).

-export_type([openai_create_translation_response/0]).

-type openai_create_translation_response() ::
    #{ 'text' := binary()
     }.

encode(#{ 'text' := Text
        }) ->
    #{ 'text' => Text
     }.
