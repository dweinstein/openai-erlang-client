-module(openai_chat_completion_response_message).

-export([encode/1]).

-export_type([openai_chat_completion_response_message/0]).

-type openai_chat_completion_response_message() ::
    #{ 'role' := binary(),
       'content' := binary()
     }.

encode(#{ 'role' := Role,
          'content' := Content
        }) ->
    #{ 'role' => Role,
       'content' => Content
     }.
