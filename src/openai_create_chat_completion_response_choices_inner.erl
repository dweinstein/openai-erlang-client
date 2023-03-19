-module(openai_create_chat_completion_response_choices_inner).

-export([encode/1]).

-export_type([openai_create_chat_completion_response_choices_inner/0]).

-type openai_create_chat_completion_response_choices_inner() ::
    #{ 'index' => integer(),
       'message' => openai_chat_completion_response_message:openai_chat_completion_response_message(),
       'finish_reason' => binary()
     }.

encode(#{ 'index' := Index,
          'message' := Message,
          'finish_reason' := FinishReason
        }) ->
    #{ 'index' => Index,
       'message' => Message,
       'finish_reason' => FinishReason
     }.
