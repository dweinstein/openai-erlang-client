-module(openai_create_transcription_response).

-export([encode/1]).

-export_type([openai_create_transcription_response/0]).

-type openai_create_transcription_response() ::
    #{ 'text' := binary()
     }.

encode(#{ 'text' := Text
        }) ->
    #{ 'text' => Text
     }.
